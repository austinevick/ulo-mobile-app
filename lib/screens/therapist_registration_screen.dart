import 'package:flutter/material.dart';
import 'package:ulo_mobile_spa/widgets/login_button.dart';
import 'package:ulo_mobile_spa/widgets/text_input_field.dart';

class TherapistRegistrationScreen extends StatefulWidget {
  @override
  _TherapistRegistrationScreenState createState() =>
      _TherapistRegistrationScreenState();
}

class _TherapistRegistrationScreenState
    extends State<TherapistRegistrationScreen> {
  List<String> materials = ['Portable table', 'Chair', 'Both'];
  var selectedMaterial = 'Portable table';
  List<String> availableDays = [
    'weekdays',
    'Weekends',
    'Mornings',
    'Afternoon',
    'Evening'
  ];
  var selectedDays = 'Weekdays';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              TextInputField(
                hintText: 'First Name',
              ),
              TextInputField(
                hintText: 'Last Name',
              ),
              TextInputField(
                hintText: 'Street Address',
              ),
              TextInputField(
                hintText: 'City',
              ),
              TextInputField(
                hintText: 'Province',
              ),
              TextInputField(
                hintText: 'Postal Code',
              ),
              TextInputField(
                hintText: 'Email Address',
              ),
              TextInputField(
                hintText: 'Phone Number',
              ),
              TextInputField(
                hintText: 'Gender',
              ),
              TextInputField(
                hintText: 'Years of experience',
              ),
              TextInputField(
                hintText: 'I received my certification from',
              ),
              TextInputField(
                hintText: 'Referred by',
              ),
              TextInputField(
                hintText: 'Languages Spoken',
              ),
              Text('I have a'),
              DropdownButtonFormField(
                items: materials
                    .map((items) => DropdownMenuItem(
                          child: Text(items),
                          value: items,
                        ))
                    .toList(),
                value: selectedMaterial,
                onChanged: (value) => setState(() => selectedMaterial = value),
              ),
              SizedBox(
                height: 25,
              ),
              Text('I would like to work'),
              DropdownButtonFormField(
                items: availableDays
                    .map((items) => DropdownMenuItem(
                          child: Text(items),
                          value: items,
                        ))
                    .toList(),
                value: selectedDays,
                onChanged: (value) => setState(() => selectedDays = value),
              ),
              Text('I am'),
              CheckboxListTile(
                  title:
                      Text('Willing to carry a massage table to appointment'),
                  onChanged: (v) {},
                  value: false),
              CheckboxListTile(
                  title: Text('Self-Employed (have GST/HST number)'),
                  onChanged: (v) {},
                  value: false),
              Text('Please upload the following documents'),
              FlatButton(
                child: Text('Resume'),
                onPressed: () {},
              ),
              FlatButton(
                child: Text('Liability Insurance'),
                onPressed: () {},
              ),
              Text('References'),
              TextInputField(
                hintText: 'Name',
              ),
              TextInputField(
                hintText: 'Email Address',
              ),
              TextInputField(
                hintText: 'Phone Number',
              ),
              SizedBox(
                height: 20,
              ),
              TextInputField(
                hintText: 'Name',
              ),
              TextInputField(
                hintText: 'Email Address',
              ),
              TextInputField(
                hintText: 'Phone Number',
              ),
              SizedBox(
                height: 20,
              ),
              LoginButton(
                buttonColor: Color(0xfff6be00),
                radius: 0,
                child: Text('SUBMIT'),
                height: 60,
                width: double.infinity,
              )
            ],
          ),
        ),
      ),
    );
  }
}
