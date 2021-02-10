import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ulo_mobile_spa/authentication/authentication.dart';
import 'package:ulo_mobile_spa/screens/landing_screen.dart';
import 'package:ulo_mobile_spa/screens/user_dashboard_screen.dart';

class AuthenticationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: AuthenticationService.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User user = snapshot.data;
          if (user == null) {
            return LandingScreen();
          } else {
            return UserDashboardScreen();
          }
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
