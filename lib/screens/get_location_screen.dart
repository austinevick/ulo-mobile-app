import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ulo_mobile_spa/models/place.dart';
import 'package:ulo_mobile_spa/network_request/network_request.dart';
import 'package:ulo_mobile_spa/providers/network_provider.dart';

class GetUserLocationScreen extends StatefulWidget {
  @override
  _GetUserLocationScreenState createState() => _GetUserLocationScreenState();
}

class _GetUserLocationScreenState extends State<GetUserLocationScreen> {
  TextEditingController searchController = new TextEditingController();
  String initialLocation = 'Calgary';
  @override
  Widget build(BuildContext context) {
    return Consumer<NetworkProvider>(
      builder: (context, places, child) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: Colors.black,
              size: 30,
            ),
          ),
          backgroundColor: Colors.white,
          title: TextFormField(
            autofocus: true,
            cursorColor: Colors.black,
            cursorWidth: 1,
            controller: searchController,
            decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: 'Enter address or postal code'),
            onChanged: (value) {
              setState(() {
                value = searchController.text;
              });
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder<List<Places>>(
                  future: NetWorkRequest.searchLocation(searchController.text),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (ctx, i) {
                          Places place = snapshot.data[i];
                          return ListTile(
                            onTap: () {
                              searchController.clear();

                              Navigator.of(context).pop({'item': place.name});
                            },
                            leading: Icon(
                              Icons.place,
                              color: Colors.red,
                            ),
                            title: Text(place.name),
                          );
                        });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
