sealed class AuthAction {}

class SignUpAction extends AuthAction {
  final String email;
  final String password;
  final String userName;
  SignUpAction(
      {required this.email, required this.password, required this.userName});
}

class LoginAction extends AuthAction {
  final String email;
  final String password;

  LoginAction({required this.email, required this.password});
}
