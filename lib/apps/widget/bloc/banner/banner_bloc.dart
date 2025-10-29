import 'dart:async';

import 'package:e_commerce/apps/widget/bloc/banner/banner_event.dart';
import 'package:e_commerce/apps/widget/bloc/banner/banner_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  Timer? _timer;

  BannerBloc() : super(const BannerLoadState()) {
    on<BannerLoadEvent>(_onLoadBanner);
    on<BannerChangeEvent>(_onChangeBanner);
    on<BannerAutoScrollEvent>(_autoScroll);
  }

  Future<void> _onLoadBanner(
    BannerLoadEvent event,
    Emitter<BannerState> emit,
  ) async {
    emit(const BannerLoadState());

    await Future.delayed(const Duration(seconds: 1));

    final banners = [
      'assets/banner/banner_2.png',
      'assets/banner/banner_0.png',
      'assets/banner/banner_1.png',
      'assets/banner/banner_2.png',
      'assets/banner/banner_0.png',
    ];

    if (!emit.isDone) {
      emit(BannerFullState(currIndex: 0, banner: banners));
    }
  }

  void _onChangeBanner(BannerChangeEvent event, Emitter<BannerState> emit) {
    if (state is BannerFullState) {
      final s = state as BannerFullState;

      emit(s.copyWith(currIndex: event.index));
    }
  }

  void _autoScroll(
    BannerAutoScrollEvent event,
    Emitter<BannerState> emit,
  ) async {
    _timer?.cancel();

    await Future.delayed(const Duration(seconds: 2));

    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (state.banners.isEmpty) {
        return;
      }

      final next = (state.currentIndex + 1) % state.banners.length;

      add(BannerChangeEvent(next));
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
