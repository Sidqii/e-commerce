abstract class LoginEvent {}

class UsernameTexfield extends LoginEvent {
  final String username;

  UsernameTexfield(this.username);
}

class PasswordTexfield extends LoginEvent {
  final String password;

  PasswordTexfield(this.password);
}

class LoginSubmitted extends LoginEvent {}

class LoginErrorMessage extends LoginEvent {}
