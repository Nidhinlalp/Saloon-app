// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class BookingEntity extends Equatable {
  final String phone;
  final String money;
  final String date;
  final String time;
  const BookingEntity({
    required this.phone,
    required this.money,
    required this.date,
    required this.time,
  });

  @override
  List<Object?> get props => [
        phone,
        money,
        date,
        time,
      ];
}
