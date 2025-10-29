import 'package:e_commerce/apps/widget/pages/page_login.dart';
import 'package:e_commerce/apps/widget/bloc/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewLogin extends StatelessWidget {
  const ViewLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return LoginBloc();
      },
      child: const PageLogin(),
    );
  }
}
