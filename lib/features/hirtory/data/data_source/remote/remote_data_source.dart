import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:salloon_app/features/booking/data/model/booking_model.dart';

abstract class HistoryRemoteDataSource {
  Future<List<BookingModel>> getBookedDetails();
}

class HistoryRemoteDataSourceImpl extends HistoryRemoteDataSource {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  HistoryRemoteDataSourceImpl(this.firestore, this.auth);

  @override
  Future<List<BookingModel>> getBookedDetails() async {
    late String saloonUid;
    final documentRefGetSaloonId = FirebaseFirestore.instance
        .collection("saloon")
        .doc("QaV3h3Z859Hb0HL3Ww9i");

    final events = await documentRefGetSaloonId.snapshots().first;

    final data = events.data();

    if (data != null) {
      saloonUid = data["listOfSaloons"][0]["uid"];
    }

    final documentRef = firestore
        .collection("bookings")
        .doc(auth.currentUser!.uid)
        .collection("mybookings");
    final event = await documentRef.doc(saloonUid).snapshots().first;
    final datas = event.data();
    if (datas != null) {
      final listofSaloones = datas['bookings'] as List<dynamic>;
      final bookingList = listofSaloones.map((map) {
        return BookingModel.fromMap(map as Map<String, dynamic>);
      }).toList();

      return bookingList;
    } else {
      return [];
    }
  }
}
