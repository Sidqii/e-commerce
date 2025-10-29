import 'package:e_commerce/apps/widget/bloc/banner/banner_bloc.dart';
import 'package:e_commerce/apps/widget/bloc/banner/banner_event.dart';
import 'package:e_commerce/apps/widget/bloc/search/search_bloc.dart';
import 'package:e_commerce/apps/widget/pages/page_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewHome extends StatelessWidget {
  const ViewHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) {
            final bloc = BannerBloc();
            bloc.add(BannerAutoScrollEvent());
            return bloc;
          },
        ),

        BlocProvider(
          create: (_) {
            return SearchBloc();
          },
        ),
      ],
      child: const PageHome(),
    );
  }
}
