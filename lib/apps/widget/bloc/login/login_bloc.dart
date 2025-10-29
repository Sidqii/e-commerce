import 'package:e_commerce/apps/widget/bloc/login/login_event.dart';
import 'package:e_commerce/apps/widget/bloc/login/login_state.dart';
import 'package:e_commerce/data/model/dummy_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<UsernameTexfield>((event, emit) {
      emit(
        state.copyWith(
          username: event.username,
          errorUserTextfield: null,
          errorMessageTextfield: '',
        ),
      );
    });

    on<PasswordTexfield>((event, emit) {
      emit(
        state.copyWith(
          password: event.password,
          errorPassTextfield: null,
          errorMessageTextfield: '',
        ),
      );
    });

    on<LoginErrorMessage>((event, emit) {
      emit(state.copyWith(errorMessageTextfield: null));
    });

    on<LoginSubmitted>((event, emit) async {
      emit(
        state.copyWith(
          errorUserTextfield: null,
          errorPassTextfield: null,
          errorMessageTextfield: null,
        ),
      );

      if (state.username.trim().toLowerCase().isEmpty) {
        emit(state.copyWith(errorUserTextfield: 'Field tidak boleh kosong'));
        return;
      }

      if (state.password.trim().toLowerCase().isEmpty) {
        emit(state.copyWith(errorPassTextfield: 'Field tidak boleh kosong'));
        return;
      }

      emit(state.copyWith(isLoading: true));

      await Future.delayed(const Duration(milliseconds: 500));

      User? foundUser;

      for (var user in dummyUser) {
        if (user.username == state.username.trim().toLowerCase() &&
            user.password == state.password.trim().toLowerCase()) {
          foundUser = user;
          break;
        }
      }

      if (foundUser != null) {
        emit(state.copyWith(isLoading: false, isSucces: true));
      } else {
        emit(
          state.copyWith(
            isLoading: false,
            errorMessageTextfield: 'Sandi atau Pengguna tidak valid',
          ),
        );
      }
    });
  }
}
