import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ulo_mobile_spa/models/therapists.dart';
import 'package:ulo_mobile_spa/providers/network_provider.dart';

import 'custom_checkbox.dart';

class TherapistAvailabilityWidget extends StatelessWidget {
  final DefaultAvailability availability;

  const TherapistAvailabilityWidget({Key key, this.availability})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<NetworkProvider>(
        builder: (context, provider, child) => GestureDetector(
              onTap: () {
                print(availability);
                provider.setAvailability(availability);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  borderRadius: BorderRadius.circular(10),
                  elevation: 2,
                  child: Container(
                    height: 60,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              availability.displayValue,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          AnimatedSwitcher(
                              switchInCurve: Curves.easeIn,
                              switchOutCurve: Curves.easeInOut,
                              duration: Duration(milliseconds: 500),
                              child: provider.availability == availability
                                  ? CustomCheckBox(
                                      color: Colors.green,
                                    )
                                  : CustomCheckBox())
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ));
  }
}
