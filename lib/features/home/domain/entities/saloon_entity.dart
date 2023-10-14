// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class SaloonEntity extends Equatable {
  final String saloonName;
  final String saloonLocation;
  final String categoryDescription;
  final String saloonImage;
  final String disCountPoster;
  final String rating;
  final String saloonPersonName;
  final String uid;
  final String phone;
  const SaloonEntity({
    required this.saloonName,
    required this.saloonLocation,
    required this.categoryDescription,
    required this.saloonImage,
    required this.disCountPoster,
    required this.rating,
    required this.saloonPersonName,
    required this.uid,
    required this.phone,
  });

  @override
  List<Object?> get props => [
        saloonName,
        saloonLocation,
        categoryDescription,
        saloonImage,
        disCountPoster,
        rating,
        saloonPersonName,
        uid,
        phone,
      ];
}
