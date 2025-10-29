import 'package:e_commerce/apps/widget/bloc/banner/banner_bloc.dart';
import 'package:e_commerce/apps/widget/bloc/banner/banner_event.dart';
import 'package:e_commerce/apps/widget/bloc/banner/banner_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class SectionBanner extends StatefulWidget {
  const SectionBanner({super.key});

  @override
  State<SectionBanner> createState() => _SectionBannerState();
}

class _SectionBannerState extends State<SectionBanner> {
  final _controller = PageController();

  @override
  void initState() {
    super.initState();
    context.read<BannerBloc>().add(BannerLoadEvent());
  }

  @override
  void didChangeDependencies() {
    final banners = context.read<BannerBloc>().state.banners;

    for (var path in banners) {
      precacheImage(AssetImage(path), context);
    }

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: BlocListener<BannerBloc, BannerState>(
        listenWhen: (previous, current) {
          return previous.currentIndex != current.currentIndex &&
              current.banners.isNotEmpty;
        },
        listener: (context, state) {
          if (!_controller.hasClients) return;
    
          if (state.currentIndex == state.banners.length - 1) {
            _controller.jumpTo(0);
            context.read<BannerBloc>().add(BannerChangeEvent(0));
          } else {
            _controller.animateToPage(
              state.currentIndex,
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeInOutCubic,
            );
          }
        },
        child: BlocBuilder<BannerBloc, BannerState>(
          builder: (context, state) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  _BannerBackground(state: state, controller: _controller),
                  const _BannerText(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

//render gambar PageView
class _BannerImage extends StatelessWidget {
  final PageController controller;

  const _BannerImage({required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BannerBloc, BannerState>(
      buildWhen: (previous, current) {
        return previous.currentIndex != current.currentIndex ||
            previous.banners != current.banners;
      },
      builder: (context, state) {
        return PageView.builder(
          key: const ValueKey('pageview'),
          controller: controller,
          physics: const BouncingScrollPhysics(),
          itemCount: state.banners.length,
          onPageChanged: (value) {
            context.read<BannerBloc>().add(BannerChangeEvent(value));
          },
          itemBuilder: (context, index) {
            return Image.asset(
              state.banners[index],
              fit: BoxFit.cover,
              width: double.infinity,
              cacheWidth: 1080,
            );
          },
        );
      },
    );
  }
}

//render text dan tombol
class _BannerText extends StatelessWidget {
  const _BannerText();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 16,
      bottom: 16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text(
            'TEMUKAN TREN TERBARU',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),

          const SizedBox(height: 5),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {},
            child: const Text('Selengkapnya'),
          ),
        ],
      ),
    );
  }
}

class _BannerBackground extends StatelessWidget {
  final BannerState state;
  final PageController controller;

  const _BannerBackground({required this.state, required this.controller});

  @override
  Widget build(BuildContext context) {
    Widget child = const SizedBox();

    if (state is BannerLoadState) {
      child = RepaintBoundary(
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade200,
          highlightColor: Colors.grey.shade400,
          period: const Duration(seconds: 1),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.shade200,
            ),
          ),
        ),
      );
    } else if (state is BannerFullState) {
      child = AnimatedOpacity(
        duration: const Duration(milliseconds: 600),
        opacity: 1.0,
        child: _BannerImage(controller: controller),
      );
    } else {
      child = const SizedBox();
    }

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 800),
      switchInCurve: Curves.easeInOutCubic,
      transitionBuilder: (child, animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: child is RepaintBoundary
          ? KeyedSubtree(key: const ValueKey('skeleton'), child: child)
          : KeyedSubtree(key: const ValueKey('full'), child: child),
    );
  }
}
