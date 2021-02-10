import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';
import 'package:ulo_mobile_spa/database/firestore_database.dart';
import 'package:ulo_mobile_spa/models/booking.dart';
import 'package:ulo_mobile_spa/providers/network_provider.dart';
import 'package:ulo_mobile_spa/widgets/login_button.dart';
import 'package:ulo_mobile_spa/widgets/text_input_field.dart';

import 'get_location_screen.dart';

class ClientInformationScreen extends StatefulWidget {
  final String date;

  const ClientInformationScreen({
    Key key,
    this.date,
  }) : super(key: key);
  @override
  _ClientInformationScreenState createState() =>
      _ClientInformationScreenState();
}

class _ClientInformationScreenState extends State<ClientInformationScreen> {
  final firstNameController = new TextEditingController();
  final lastNameController = new TextEditingController();
  final homeAdressController = new TextEditingController();
  final emailController = new TextEditingController();
  final postalCodeController = new TextEditingController();
  final phoneNumberController = new TextEditingController();
  final instructionController = new TextEditingController();
  final otherController = new TextEditingController();
  final controller = ScrollController();
  List<String> pets = ['No Pets', 'Cats', 'Dogs', 'Both'];
  List<String> stairs = ['None', '1 flight', '2 flights', '3+ flights'];
  List<String> locations = ['Home', 'Office', 'Hotel'];
  List<String> socialChoice = [
    'Instagram',
    'Facebook',
    'Referral',
    'LinkedIn',
    'Twitter',
    'Flyer'
  ];

  var currentsocialChoice = 'Instagram';
  var currentLocation = 'Home';
  var currentStairs = 'None';
  var currentPet = 'No Pets';
  Widget headerText(String title) => Text(
        title,
        style: GoogleFonts.aclonica(fontSize: 16),
      );

  @override
  Widget build(BuildContext context) {
    return Consumer<NetworkProvider>(
        builder: (context, booking, child) => Scaffold(
            appBar: ScrollAppBar(
              controller: controller,
              title: Text('Personal Information'),
            ),
            body: ListView(
              controller: controller,
              children: [
                Form(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextInputField(
                          autofillHints: [AutofillHints.name],
                          controller: firstNameController,
                          hintText: 'First Name',
                        ),
                        TextInputField(
                          autofillHints: [AutofillHints.familyName],
                          controller: lastNameController,
                          hintText: 'Last Name ',
                        ),
                        TextInputField(
                            controller: homeAdressController,
                            onTap: () async {
                              Map result = await Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (ctx) =>
                                          GetUserLocationScreen()));
                              if (result != null &&
                                  result.containsKey('item')) {
                                setState(() =>
                                    homeAdressController.text = result['item']);
                                print(homeAdressController.text);
                              }
                            },
                            readOnly: true,
                            hintText: 'Home Address'),
                        TextInputField(
                            textInputType: TextInputType.emailAddress,
                            autofillHints: [AutofillHints.email],
                            controller: emailController,
                            hintText: 'Email Address ',
                            validator: (value) {
                              Pattern pattern =
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                              RegExp regex = new RegExp(pattern);
                              if (!regex.hasMatch(value))
                                return 'Enter a valid email';
                              else
                                return null;
                            }),
                        TextInputField(
                          autofillHints: [AutofillHints.postalCode],
                          controller: postalCodeController,
                          hintText: 'Postal Code ',
                        ),
                        TextInputField(
                            autofillHints: [AutofillHints.telephoneNumber],
                            controller: phoneNumberController,
                            hintText: 'Phone Number ',
                            textInputType: TextInputType.phone,
                            validator: (value) {
                              Pattern pattern =
                                  r'^(?:\+?1[-.●]?)?\(?([0-9]{3})\)?[-.●]?([0-9]{3})[-.●]?([0-9]{4})$';
                              RegExp regex = new RegExp(pattern);
                              if (!regex.hasMatch(value))
                                return 'Enter a valid phone number';
                              else
                                return null;
                            }),
                        TextInputField(
                          controller: instructionController,
                          obscureText: false,
                          maxLines: null,
                          hintText:
                              'Special Instructions (buzzer, allergies, parking)',
                        ),
                        SizedBox(height: 15),
                        headerText(
                          'Pets',
                        ),
                        DropdownButtonFormField(
                          value: currentPet,
                          items: pets
                              .map((item) => DropdownMenuItem(
                                    value: item,
                                    child: Text('$item'),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() => currentPet = value);
                          },
                        ),
                        SizedBox(height: 15),
                        headerText(
                          'Stairs',
                        ),
                        DropdownButtonFormField(
                          items: stairs
                              .map((items) => DropdownMenuItem(
                                    child: Text(items),
                                    value: items,
                                  ))
                              .toList(),
                          value: currentStairs,
                          onChanged: (value) =>
                              setState(() => currentStairs = value),
                        ),
                        SizedBox(height: 15),
                        headerText(
                          'Location',
                        ),
                        DropdownButtonFormField(
                          items: locations
                              .map((items) => DropdownMenuItem(
                                    child: Text(items),
                                    value: items,
                                  ))
                              .toList(),
                          value: currentLocation,
                          onChanged: (value) =>
                              setState(() => currentLocation = value),
                        ),
                        TextInputField(
                          controller: otherController,
                          hintText: 'Other',
                        ),
                        SizedBox(height: 15),
                        headerText(
                          'Where did you hear about us?',
                        ),
                        DropdownButtonFormField(
                          items: socialChoice
                              .map((items) => DropdownMenuItem(
                                    child: Text(items),
                                    value: items,
                                  ))
                              .toList(),
                          value: currentsocialChoice,
                          onChanged: (value) =>
                              setState(() => currentsocialChoice = value),
                        ),
                      ],
                    ),
                  ),
                ),
                LoginButton(
                  radius: 0,
                  buttonColor: Color(0xfffdd13f),
                  onPressed: () async {
                    await FirestoreDatabase.saveBooking(Booking(
                        therapist: booking.selectedtherapist.name,
                        duration: booking.selectedDuration.length,
                        time: booking.availability.displayValue,
                        firstName: firstNameController.text,
                        street: homeAdressController.text,
                        date: widget.date,
                        pet: currentPet));
                  },
                  height: 65,
                  child: Text(
                    'Continue',
                    style: TextStyle(fontSize: 20),
                  ),
                  width: double.infinity,
                ),
              ],
            )));
  }
}
