import 'package:salloon_app/features/home/domain/entities/saloon_entity.dart';

class SaloonModel extends SaloonEntity {
  const SaloonModel({
    required String saloonName,
    required String saloonLocation,
    required String categoryDescription,
    required String saloonImage,
    required String disCountPoster,
    required String rating,
    required String saloonPersonName,
    required String uid,
    required String phone,
  }) : super(
          saloonName: saloonName,
          saloonLocation: saloonLocation,
          categoryDescription: categoryDescription,
          saloonImage: saloonImage,
          disCountPoster: disCountPoster,
          rating: rating,
          saloonPersonName: saloonPersonName,
          uid: uid,
          phone: phone,
        );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'saloonName': saloonName,
      'saloonLocation': saloonLocation,
      'categoryDescription': categoryDescription,
      'saloonImage': saloonImage,
      'disCountPoster': disCountPoster,
      'rating': rating,
      'saloonPersonName': saloonPersonName,
      'uid': uid,
      'phone': phone,
    };
  }

  factory SaloonModel.fromMap(Map<String, dynamic> map) {
    return SaloonModel(
      saloonName: map['saloonName'] as String,
      saloonLocation: map['saloonLocation'] as String,
      categoryDescription: map['categoryDescription'] as String,
      saloonImage: map['saloonImage'] as String,
      disCountPoster: map['disCountPoster'] as String,
      rating: map['rating'] as String,
      saloonPersonName: map['saloonPersonName'] as String,
      uid: map['uid'] as String,
      phone: map['phone'] as String,
    );
  }

  SaloonEntity toEntity() => SaloonEntity(
        saloonName: saloonName,
        saloonLocation: saloonLocation,
        categoryDescription: categoryDescription,
        saloonImage: saloonImage,
        disCountPoster: disCountPoster,
        rating: rating,
        saloonPersonName: saloonPersonName,
        uid: uid,
        phone: phone,
      );
  static List<SaloonEntity> toListOfEntity(List<SaloonModel> saloonList) {
    return saloonList.map((saloonModel) => saloonModel.toEntity()).toList();
  }
}
