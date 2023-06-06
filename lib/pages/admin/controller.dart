import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AdminController extends GetxController {
  RxList<DocumentSnapshot> data = RxList<DocumentSnapshot>();
  final db = FirebaseFirestore.instance;
  CollectionReference ref = FirebaseFirestore.instance.collection('company');
  final firestore = FirebaseFirestore.instance
      .collection('company')
      .where('status', isEqualTo: 'false')
      .snapshots();

  updateCompanyData(String id) async {
    print('Inside update');
    print('update id : ' + id);
    await ref.doc(id).update({
      'status': 'true',
    }).then((value) {
      Get.snackbar('Approved', 'Congrats');
    }).onError((error, stackTrace) {
      Get.snackbar('Error', 'Something went wrong');
    });
  }

  deleteCompanyData(String id) async {
    await ref.doc(id).delete().then((value) {
      Get.snackbar('Delete', 'Successfully Deleted');
    }).onError((error, stackTrace) {
      Get.snackbar('Error', 'Something went wrong');
    });
  }
}
