import 'package:flutter/material.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';
import 'package:ulo_mobile_spa/models/therapists.dart';

class TherapistDetailScreen extends StatelessWidget {
  final Therapists therapists;

  final controller = ScrollController();

  TherapistDetailScreen({Key key, this.therapists}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScrollAppBar(
        controller: controller,
        backgroundColor: Colors.red,
        elevation: 0,
        centerTitle: true,
        title: Text(therapists.name),
      ),
      body: ListView(
        controller: controller,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                  width: double.infinity,
                  height: 150,
                  decoration: new BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.vertical(
                          bottom: Radius.elliptical(
                              MediaQuery.of(context).size.width, 100.0)))),
              Hero(
                tag: therapists.id,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage(
                        'https://images.ulomobilespa.com/therapists/' +
                            therapists.avatar),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  therapists.emailAddress ?? '',
                ),
                Text(
                  therapists.credentials ?? '',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                therapists.description == null
                    ? Container()
                    : Column(
                        children: therapists.description
                            .map((map) => Text(
                                  map ?? '',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ))
                            .toList()),
              ],
            ),
          )
        ],
      ),
    );
  }
}
