import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ulo_mobile_spa/models/therapists.dart';
import 'package:ulo_mobile_spa/providers/network_provider.dart';

class ImageWidget extends StatelessWidget {
  final Therapists therapists;

  const ImageWidget({Key key, this.therapists}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<NetworkProvider>(
        builder: (context, therapist, child) => Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: therapists.id,
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          border: therapists.isSelected &&
                                  therapist.selectedtherapist == therapists
                              ? Border.all(color: Colors.yellow, width: 3)
                              : null,
                          borderRadius: BorderRadius.circular(50),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://images.ulomobilespa.com/therapists/' +
                                      therapists.avatar))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      therapists.name,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ));
  }
}
