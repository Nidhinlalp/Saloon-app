import 'package:salloon_app/features/booking/domain/entities/booking_entities.dart';

class BookingModel extends BookingEntity {
  const BookingModel({
    required String phone,
    required String money,
    required String date,
    required String time,
  }) : super(
          phone: phone,
          money: money,
          date: date,
          time: time,
        );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'phone': phone,
      'money': money,
      'date': date,
      'time': time,
    };
  }

  factory BookingModel.fromMap(Map<String, dynamic> map) {
    return BookingModel(
      phone: map['phone'] as String,
      money: map['money'] as String,
      date: map['date'] as String,
      time: map['time'] as String,
    );
  }

  BookingEntity toEntity() => BookingEntity(
        phone: phone,
        money: money,
        date: date,
        time: time,
      );

  static List<BookingEntity> toListOfEntity(List<BookingModel> bookingEntity) {
    return bookingEntity.map((saloonModel) => saloonModel.toEntity()).toList();
  }
}
