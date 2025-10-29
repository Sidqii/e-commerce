class LoginState {
  final String username;
  final String password;
  final String? errorUserTextfield;
  final String? errorPassTextfield;
  final String? errorMessageTextfield;
  final bool isLoading;
  final bool isSucces;

  const LoginState({
    this.username = '',
    this.password = '',
    this.errorUserTextfield,
    this.errorPassTextfield,
    this.errorMessageTextfield,
    this.isLoading = false,
    this.isSucces = false,
  });

  LoginState copyWith({
    String? username,
    String? password,
    String? errorUserTextfield,
    String? errorPassTextfield,
    String? errorMessageTextfield,
    bool? isLoading,
    bool? isSucces,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      errorUserTextfield: errorUserTextfield,
      errorPassTextfield: errorPassTextfield,
      errorMessageTextfield: errorMessageTextfield,
      isLoading: isLoading ?? this.isLoading,
      isSucces: isSucces ?? this.isSucces,
    );
  }
}
