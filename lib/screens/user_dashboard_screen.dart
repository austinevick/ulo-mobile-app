import 'package:flutter/material.dart';
import 'package:ulo_mobile_spa/authentication/authentication.dart';
import 'package:ulo_mobile_spa/database/firestore_database.dart';
import 'package:ulo_mobile_spa/screens/booking_screen.dart';
import 'package:ulo_mobile_spa/screens/booking_screen2.dart';
import 'package:ulo_mobile_spa/screens/gift_types_screen.dart';
import 'package:ulo_mobile_spa/screens/treatment_screen.dart';
import 'package:ulo_mobile_spa/widgets/show_alert_dialog.dart';

import '../internet_connectivity.dart';

class UserDashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirestoreDatabase.readBooking();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'DASHBOARD',
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.center,
              height: 60,
              width: 50,
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(8)),
              child: Icon(Icons.person_add),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              children: [
                DashboardCard(
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) => TreatmentScreen())),
                  color: Color(0xff2c62ff),
                  text: 'Treatment',
                ),
                DashboardCard(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => BookingScreen2(
                            showDetailScreen: true,
                          ))),
                  color: Color(0xff2bc999),
                  text: 'Therapists',
                ),
                DashboardCard(
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) => GiftTypesScreen())),
                  color: Color(0xfff6be00),
                  text: 'Gifts',
                ),
                DashboardCard(
                  onTap: () =>
                      NetworkConnectivityChecker.checkConnection(context, () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (ctx) => BookingScreen1()));
                  }),
                  color: Colors.indigo,
                  text: 'Book Appointment',
                ),
                DashboardCard(
                  onTap: () {},
                  color: Colors.pink,
                  text: 'Pricing',
                ),
                DashboardCard(
                  onTap: () {},
                  color: Colors.green,
                  text: 'Blogs',
                ),
                DashboardCard(
                  onTap: () => confirmSignOut(context),
                  color: Colors.red,
                  text: 'Logout',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _signOut() async {
    try {
      await AuthenticationService.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> confirmSignOut(BuildContext context) async {
    final didRequestSignOut = await showAlertDialog(context,
        title: 'LOGOUT',
        content: 'Are you sure you want to logout?',
        cancelActionText: 'Cancel',
        defaultActionText: 'Logout');
    if (didRequestSignOut == true) {
      _signOut();
    }
  }
}

class DashboardCard extends StatelessWidget {
  final String text;
  final Color color;
  final Function onTap;

  const DashboardCard({Key key, this.onTap, this.color, this.text})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: TextStyle(color: Colors.white),
            ),
          ),
          height: 150,
          width: 150,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
