import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getAccount(String userId) {
    return _fireStore
        .collection('accounts')
        .where('userId', isEqualTo: userId)
        .orderBy(
          'createdAt',
          descending: false,
        )
        .snapshots();
  }

  Future addAccount(String name, String wallet, String userId) async {
    await _fireStore.collection('accounts').add({
      'name': name.trim(),
      'address': wallet.trim(),
      'createdAt': DateTime.now(),
      'userId': userId.trim(),
    });
  }

  @override
  void onClose() {}
}
