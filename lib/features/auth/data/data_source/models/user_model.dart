import 'package:salloon_app/features/auth/domain/entities/user_entite.dart';

class UserModel extends UserEntity {
  const UserModel({
    required String uid,
    required String displayName,
    required String email,
    required String photoURL,
  }) : super(
          displayName: displayName,
          uid: uid,
          email: email,
          photoURL: photoURL,
        );

  Map<String, dynamic> toMap() => {
        'uid': uid,
        'displayName': displayName,
        'email': email,
        'photoURL': photoURL,
      };

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] as String,
      displayName: map['displayName'] as String,
      email: map['email'] as String,
      photoURL: map['photoURL'] as String,
    );
  }

  UserEntity toEntity() => UserEntity(
        uid: uid,
        displayName: displayName,
        email: email,
        photoURL: photoURL,
      );
}
