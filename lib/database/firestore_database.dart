import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ulo_mobile_spa/authentication/authentication.dart';
import 'package:ulo_mobile_spa/models/booking.dart';

class FirestoreDatabase {
  static User user = AuthenticationService.currentUser;

  static saveBooking(Booking booking) async {
    final path = '/user/${user.uid}/appointment/booking';
    final documentReference = FirebaseFirestore.instance.doc(path);
    await documentReference.set(booking.toMap());
  }

  static readBooking() {
    final reference =
        FirebaseFirestore.instance.collection('user/${user.uid}/appointment');
    final snapshots = reference.snapshots();
    snapshots.listen((snapshot) {
      snapshot.docs.forEach((snapshots) => print(snapshots.reference));
    });
  }
}
