import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:salloon_app/features/home/data/model/saloon_model.dart';

abstract class SaloonRemoteDataSource {
  Future<List<SaloonModel>> getSaloonsList();
  Future<String> getSaloonuid();
}

class SaloonRemoteDataSourceImpl extends SaloonRemoteDataSource {
  final FirebaseFirestore firestore;

  SaloonRemoteDataSourceImpl(this.firestore);

  @override
  Future<List<SaloonModel>> getSaloonsList() async {
    final documentRef =
        firestore.collection("saloon").doc("QaV3h3Z859Hb0HL3Ww9i");
    final event = await documentRef.snapshots().first;
    final data = event.data();
    if (data != null) {
      final listofSaloones = data['listOfSaloons'] as List<dynamic>;
      final saloonsList = listofSaloones.map((map) {
        return SaloonModel.fromMap(map as Map<String, dynamic>);
      }).toList();

      return saloonsList;
    } else {
      return [];
    }
  }

  @override
  Future<String> getSaloonuid() async {
    final documentRef = FirebaseFirestore.instance
        .collection("saloon")
        .doc("QaV3h3Z859Hb0HL3Ww9i");

    final event = await documentRef.snapshots().first;

    final data = event.data();

    if (data != null) {
      return data["listOfSaloons"][0]["uid"];
    }
    return "";
  }
}
