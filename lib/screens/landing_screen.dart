import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ulo_mobile_spa/authentication/authentication.dart';
import 'package:ulo_mobile_spa/database/firestore_database.dart';
import 'package:ulo_mobile_spa/screens/login_screen.dart';
import 'package:ulo_mobile_spa/screens/therapist_registration_screen.dart';
import 'package:ulo_mobile_spa/widgets/login_button.dart';
import 'package:ulo_mobile_spa/widgets/show_exception_alert_dialog.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  bool isLoading = false;

  signInAnonymously(BuildContext context) async {
    try {
      setState(() => isLoading = true);
      User user = await AuthenticationService.signInAnonymously();
      if (user != null) {
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      showExceptionAlertDialog(context, title: 'Sign in failed', exception: e);
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                'images/ulo_logo.png',
                width: 130,
                height: 140,
              ),
            ),
          ),
          Text(
            'Welcome to Ulo Mobile Spa',
            style: GoogleFonts.bungee(fontSize: 22),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'A new way for you to experience a professional massage at home, work or even in a hotel.',
              textAlign: TextAlign.center,
              style: GoogleFonts.oleoScript(fontSize: 14),
            ),
          ),
          Center(
            child: FadeIn(
                duration: Duration(seconds: 2),
                child: Image.asset('images/image1.png')),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: LoginButton(
              onPressed: () => signInAnonymously(context),
              radius: 50,
              width: double.infinity,
              buttonColor: Color(0xfff6be00),
              height: 50,
              child: isLoading
                  ? Center(
                      child: SizedBox(
                        height: 15,
                        width: 15,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      ),
                    )
                  : Text(
                      'Continue as guest',
                      style: TextStyle(color: Colors.white),
                    ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LoginButton(
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (ctx) => TherapistRegistrationScreen())),
                    radius: 50,
                    buttonColor: Colors.indigo,
                    height: 50,
                    child: Text(
                      'Join our team',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LoginButton(
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            fullscreenDialog: true,
                            builder: (ctx) => LoginScreen())),
                    radius: 50,
                    buttonColor: Colors.green,
                    height: 50,
                    child: Text(
                      'Become a member',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }
}
