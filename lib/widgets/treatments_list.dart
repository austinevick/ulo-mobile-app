import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ulo_mobile_spa/models/treatment.dart';
import 'package:ulo_mobile_spa/providers/network_provider.dart';

import 'custom_checkbox.dart';

class TreatmentList extends StatelessWidget {
  final Treatments treatments;

  const TreatmentList({Key key, this.treatments}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<NetworkProvider>(
        builder: (context, treatment, child) => Column(
              children: [
                FlatButton(
                  onPressed: () {
                    print(treatments);
                    treatment.setSelectedTreatment(treatments);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Material(
                      elevation: 8,
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        alignment: Alignment.center,
                        height: 60,
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8),
                                topLeft: Radius.circular(8),
                              ),
                              child: Container(
                                height: 60,
                                width: 15,
                                color: Colors.green,
                              ),
                            ),
                            Spacer(),
                            Text(treatments.name,
                                style: TextStyle(fontSize: 18)),
                            Spacer()
                          ],
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  ),
                ),
                AnimatedSwitcher(
                    switchInCurve: Curves.easeIn,
                    switchOutCurve: Curves.easeInOut,
                    duration: Duration(milliseconds: 500),
                    child: treatments.isSelected &&
                            treatment.treatment == treatments
                        ? buildDuration(treatments)
                        : Container())
              ],
            ));
  }

  Widget buildDuration(Treatments treatments) {
    return Consumer<NetworkProvider>(
      builder: (context, durations, child) => Column(
          children: List.generate(treatments.duration.length, (index) {
        final duration = treatments.duration[index];
        return FlatButton(
          onPressed: () {
            print(duration);
            durations.setSelectedDuration(duration);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              elevation: 1,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        duration.length,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Text(
                      '\$' + duration.price.toString(),
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    AnimatedSwitcher(
                        duration: Duration(milliseconds: 500),
                        child: durations.selectedDuration == duration
                            ? CustomCheckBox(
                                color: Colors.green,
                              )
                            : CustomCheckBox(
                                color: Colors.white,
                              ))
                  ],
                ),
              ),
            ),
          ),
        );
      })),
    );
  }
}
