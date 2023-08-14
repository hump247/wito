import 'package:firebase_database/firebase_database.dart';

class GetData {
  Stream<List<Map<String, dynamic>>> getMiradiStream() {
    DatabaseReference ref = FirebaseDatabase.instance.reference().child("miradi");
    return ref.onValue.map((event) {
      DataSnapshot snapshot = event.snapshot;
      List<Map<String, dynamic>> dataList = [];
      if (snapshot.value != null && snapshot.value is Map) {
        (snapshot.value as Map).forEach(
          (childKey, childValue) {
            if (childValue is Map<dynamic, dynamic>) {
              Map<String, dynamic> typedChildValue = Map<String, dynamic>.from(childValue);

              if (typedChildValue.isNotEmpty) {
                dataList.add(typedChildValue);
              }
            }
          },
        );
      }
      print(dataList);
      return dataList;
    });
  }
}
