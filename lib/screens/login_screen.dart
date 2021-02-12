import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ulo_mobile_spa/authentication/authentication.dart';
import 'package:ulo_mobile_spa/database/firestore_database.dart';
import 'package:ulo_mobile_spa/models/users.dart';
import 'package:ulo_mobile_spa/widgets/login_button.dart';
import 'package:ulo_mobile_spa/widgets/show_exception_alert_dialog.dart';
import 'package:ulo_mobile_spa/widgets/text_input_field.dart';

enum LoginFormType { LOGIN, REGISTER }

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();
  final nameController = new TextEditingController();
  final emailFocusNode = FocusNode();
  final nameFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  LoginFormType formType = LoginFormType.LOGIN;
  bool isVisible = true;
  String primaryText() => formType == LoginFormType.LOGIN
      ? 'LOGIN'
      : 'Create account'.toUpperCase();
  String secondaryText() => formType == LoginFormType.LOGIN
      ? 'Don\'t have an account? Register'
      : 'Have an account? Login';
  String appBarText() =>
      formType == LoginFormType.LOGIN ? 'Sign in' : 'Create account';
  User user;

  bool isLoading = false;
  submit() async {
    try {
      setState(() => isLoading = true);
      if (formType == LoginFormType.LOGIN) {
        user = await AuthenticationService.signInWithEmailAndPassword(
            emailController.text, passwordController.text);
      } else {
        user = await AuthenticationService.createUserWithEmailAndPassword(
            emailController.text, passwordController.text);
        final userData = new UserData(
            displayName: nameController.text, email: emailController.text);

        await FirestoreDatabase.saveUsersData(userData);
      }
      if (user != null) {
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      showExceptionAlertDialog(context, title: 'Sign in failed', exception: e);
    } finally {
      setState(() => isLoading = false);
    }
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      user = await AuthenticationService.signInWithGoogle();
    } on Exception catch (e) {
      showSignInError(context, e);
    }
    if (user != null) {
      Navigator.of(context).pop();
    }
  }

  void showSignInError(BuildContext context, Exception exception) {
    if (exception is FirebaseAuthException &&
        exception.code == 'ERROR_ABORTED_BY_USER') {
      return;
    }
    showExceptionAlertDialog(context,
        title: 'Sign in failed', exception: exception);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    emailFocusNode.dispose();
    nameFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: Colors.black,
            size: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(appBarText(), style: TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                formType == LoginFormType.REGISTER
                    ? buildNameForm()
                    : Container(),
                buildEmailForm(),
                buildPasswordForm(),
                SizedBox(
                  height: 8,
                ),
                formType == LoginFormType.LOGIN
                    ? Align(
                        alignment: Alignment.centerRight,
                        child: FlatButton(
                          child: Text('Forgot Password?'),
                          onPressed: () {},
                        ),
                      )
                    : Container(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LoginButton(
                    radius: 50,
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        formKey.currentState.save();

                        submit();
                      }
                    },
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
                            primaryText(),
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                    buttonColor: Color(0xfffdd13f),
                    height: 50,
                    width: double.infinity,
                  ),
                ),
                FlatButton(
                  child: Text(secondaryText()),
                  onPressed: () {
                    setState(() {
                      formType = formType == LoginFormType.LOGIN
                          ? LoginFormType.REGISTER
                          : LoginFormType.LOGIN;
                      emailController.clear();
                      passwordController.clear();
                    });
                  },
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Or'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.black)),
                    child: LoginButton(
                      onPressed: () => signInWithGoogle(context),
                      radius: 50,
                      width: double.infinity,
                      height: 50,
                      child: Row(
                        children: [
                          Image.asset(
                            'images/google.png',
                            width: 25,
                          ),
                          Spacer(),
                          Text('Continue with Google'),
                          Spacer(
                            flex: 2,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildNameForm() => TextInputField(
        textInputType: TextInputType.name,
        obscureText: false,
        onEditingComplete: () {
          FocusScope.of(context).requestFocus(emailFocusNode);
        },
        onChanged: (name) {
          setState(() {});
        },
        textInputAction: TextInputAction.next,
        controller: nameController,
        hintText: 'Full Name',
        validator: (value) =>
            value.isEmpty ? 'Please enter your full name' : null,
        focusNode: nameFocusNode,
      );

  /////******************************************************//////

  buildEmailForm() => TextInputField(
      textInputType: TextInputType.emailAddress,
      obscureText: false,
      onChanged: (email) {
        setState(() {});
      },
      textInputAction: TextInputAction.next,
      onEditingComplete: () {
        FocusScope.of(context).requestFocus(passwordFocusNode);
      },
      focusNode: emailFocusNode,
      validator: (value) =>
          !value.contains('@') ? 'Please provide a valid email' : null,
      controller: emailController,
      hintText: 'Email');

  /////*********************************************************//////
  buildPasswordForm() => TextInputField(
        textInputType: TextInputType.visiblePassword,
        controller: passwordController,
        validator: (value) =>
            value.length < 6 ? 'Character must be at least 6 length' : null,
        onChanged: (password) {
          setState(() {});
        },
        textInputAction: TextInputAction.done,
        obscureText: isVisible,
        hintText: 'Password',
        focusNode: passwordFocusNode,
        icon: IconButton(
          color: Color(0xfffdd13f),
          icon: isVisible ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
          onPressed: () => setState(() => isVisible = !isVisible),
        ),
      );
}
