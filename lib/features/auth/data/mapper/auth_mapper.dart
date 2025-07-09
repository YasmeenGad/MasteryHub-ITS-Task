import 'package:mastery_hub_its_task/features/auth/data/models/response/user_model.dart';

import '../../domain/entities/response/user_entity.dart';

class AuthMapper {
  static UserEntity toEntity(UserModel userModel) {
    return UserEntity(
      uid: userModel.uid,
      email: userModel.email,
      userName: userModel.userName,
    );
  }
}
