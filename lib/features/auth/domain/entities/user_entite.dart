import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String uid;
  final String displayName;
  final String email;
  final String photoURL;

  const UserEntity({
    required this.uid,
    required this.displayName,
    required this.email,
    required this.photoURL,
  });

  @override
  List<Object?> get props => [
        uid,
        displayName,
        email,
        photoURL,
      ];
}
