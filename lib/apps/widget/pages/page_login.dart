import 'package:e_commerce/apps/view/view_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:e_commerce/apps/widget/bloc/login/login_bloc.dart';
import 'package:e_commerce/apps/widget/bloc/login/login_event.dart';
import 'package:e_commerce/apps/widget/bloc/login/login_state.dart';

class PageLogin extends StatefulWidget {
  const PageLogin({super.key});

  @override
  State<PageLogin> createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  final userController = TextEditingController();
  final passController = TextEditingController();
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listenWhen: (previous, current) => previous.isSucces != current.isSucces,
      listener: (context, state) {
        if (state.isSucces) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const ViewHome()),
          );
        }
      },
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          context.read<LoginBloc>().add(LoginErrorMessage());
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(55),
              child: BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  final bloc = context.read<LoginBloc>();

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //header nya ya ges ya (bagian icon sama teks nya yang ini)
                      Center(
                        child: Image.asset(
                          'assets/logo/logo_1.png',
                          cacheWidth: 1080,
                        ),
                      ),

                      //yang ini input username (email)
                      TextField(
                        controller: userController,
                        cursorColor: Colors.grey.shade900,
                        onChanged: (value) {
                          bloc.add(UsernameTexfield(value));
                        },
                        decoration: InputDecoration(
                          labelText: 'Nama Pengguna',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade900),
                          ),
                          floatingLabelStyle: TextStyle(
                            color: Colors.grey.shade900,
                          ),
                          errorText: state.errorUserTextfield,
                        ),
                      ),

                      const SizedBox(height: 15),

                      //yang ini input sandi nya (isObscure kepake nya disini ni)
                      TextField(
                        controller: passController,
                        cursorColor: Colors.grey.shade900,
                        obscureText: isObscure,
                        onChanged: (value) {
                          bloc.add(PasswordTexfield(value));
                        },
                        decoration: InputDecoration(
                          labelText: 'Sandi Pengguna',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade900),
                          ),
                          floatingLabelStyle: TextStyle(
                            color: Colors.grey.shade900,
                          ),
                          errorText: state.errorPassTextfield,
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isObscure = !isObscure;
                              });
                            },
                            icon: Icon(
                              isObscure ? Icons.lock_outline : Icons.lock_open,
                              size: 20,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 15),

                      //bagian button (masuk)
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.grey.shade900,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            bloc.add(LoginSubmitted());
                          },
                          child: state.isLoading
                              ? const SizedBox(
                                  height: 12,
                                  width: 12,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 1,
                                  ),
                                )
                              : const Text('masuk'),
                        ),
                      ),

                      //pesan error kalau sandi sama email nya ga nyambung
                      if (state.errorMessageTextfield != null &&
                          state.errorMessageTextfield!.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            state.errorMessageTextfield!,
                            style: TextStyle(
                              color: Colors.red.shade900,
                              fontSize: 13,
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
