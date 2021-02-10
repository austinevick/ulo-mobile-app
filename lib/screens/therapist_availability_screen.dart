import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:ulo_mobile_spa/models/therapists.dart';
import 'package:ulo_mobile_spa/providers/network_provider.dart';
import 'package:ulo_mobile_spa/widgets/availability_widget.dart';
import 'package:ulo_mobile_spa/widgets/date_textfield.dart';

import 'client_information_screen.dart';

class AvailabilityScreen extends StatefulWidget {
  final Therapists therapists;

  const AvailabilityScreen({Key key, this.therapists}) : super(key: key);

  @override
  _AvailabilityScreenState createState() => _AvailabilityScreenState();
}

class _AvailabilityScreenState extends State<AvailabilityScreen> {
  final controller = TextEditingController();
  DateTime selectedDate = DateTime.now();
  @override
  void initState() {
    super.initState();
    controller.text = DateFormat.yMMMd().format(selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NetworkProvider>(
      builder: (context, provider, child) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Pick a date and time',
          ),
          actions: [
            provider.availability == null
                ? SizedBox.shrink()
                : IconButton(
                    icon: Icon(
                      Icons.keyboard_arrow_right,
                      size: 32,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(PageRouteBuilder(
                          transitionDuration: Duration(seconds: 1),
                          reverseTransitionDuration: Duration(seconds: 1),
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            final curvedAnimation = CurvedAnimation(
                                curve: Interval(0, 0.5), parent: animation);
                            return FadeTransition(
                              opacity: curvedAnimation,
                              child: ClientInformationScreen(
                                date: controller.text,
                              ),
                            );
                          }));
                    },
                  )
          ],
        ),
        body: provider.selectedtherapist.defaultAvailability.isEmpty
            ? Center(
                child: Text('No selected time for the selected therapist'),
              )
            : ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  DateTextFieldWidget(
                      controller: controller, onTap: () => pickDate()),
                  Column(
                    children: List.generate(
                        widget.therapists.defaultAvailability.length, (index) {
                      final availability =
                          widget.therapists.defaultAvailability[index];
                      return TherapistAvailabilityWidget(
                        availability: availability,
                      );
                    }),
                  ),
                ],
              ),
      ),
    );
  }

  pickDate() async {
    if (Platform.isIOS) {
      return CupertinoDatePicker(
        onDateTimeChanged: (DateTime date) {
          if (date != null) {
            selectedDate = date;
            controller.text = DateFormat.yMMMd().format(selectedDate);
          }
        },
        initialDateTime: selectedDate,
      );
    } else if (Platform.isAndroid) {
      final date = await showDatePicker(
          context: context,
          firstDate: DateTime.now(),
          initialDate: selectedDate,
          lastDate: DateTime(2101),
          builder: (BuildContext context, Widget child) {
            return Theme(
              data: ThemeData.dark().copyWith(
                colorScheme: ColorScheme.dark(
                  onPrimary: Colors.black,
                  surface: Colors.yellow,
                  onSurface: Colors.black,
                ),
                dialogBackgroundColor: Colors.white,
              ),
              child: child,
            );
          });

      if (date != null) {
        selectedDate = date;
        controller.text = DateFormat.yMMMd().format(selectedDate);
      }
    }
  }
}
