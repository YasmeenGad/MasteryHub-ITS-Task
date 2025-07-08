class UserEntity {
  final String uid;
  final String? email;
  final String? userName;

  const UserEntity({
    required this.uid,
    this.email,
    this.userName,
  });
}
