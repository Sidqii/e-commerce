class User {
  final String username;
  final String password;
  final String role;

  User({
    required this.username,
    required this.password,
    required this.role,
  });
}

List<User> dummyUser = [
  User(username: 'mita', password: '12345', role: 'admin'),
  User(username: 'mutu', password: '12345', role: 'guru'),
  User(username: 'dalang', password: '12345', role: 'staf'),
  User(username: 'mulyono', password: '12345', role: 'staf'),
];
