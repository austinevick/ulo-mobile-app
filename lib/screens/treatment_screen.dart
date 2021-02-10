import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ulo_mobile_spa/providers/network_provider.dart';
import 'package:ulo_mobile_spa/widgets/animated_dialog.dart';
import 'package:ulo_mobile_spa/widgets/login_button.dart';

import '../internet_connectivity.dart';

class TreatmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<NetworkProvider>(
        builder: (context, treatment, child) => Scaffold(
            appBar: AppBar(
              title: Text('Treatments'),
            ),
            body: treatment.treatments.isEmpty
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: treatment.treatments.length,
                    itemBuilder: (context, index) {
                      final treatments = treatment.treatments[index];
                      return GestureDetector(
                        onTap: () => NetworkConnectivityChecker.checkConnection(
                            context, () {
                          /*  showBarModalBottomSheet(
                              shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none),
                              context: context,
                              builder: (context) => Scaffold(
                                appBar: AppBar(title: Text(treatments.name),),
                              ));*/
                          animatedDialog(
                              context: context,
                              child: Dialog(
                                  child: Container(
                                height: MediaQuery.of(context).size.height / 2,
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      height: 60,
                                      width: double.infinity,
                                      child: Text(treatments.name),
                                    ),
                                    Column(
                                        children: treatments.desc
                                            .map((items) => Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(items),
                                                ))
                                            .toList()),
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: LoginButton(
                                        buttonColor: Color(0xfff6be00),
                                        radius: 50,
                                        width: 200,
                                        height: 50,
                                        child: Text(
                                          'CLOSE',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )));
                        }),
                        child: Hero(
                          tag: treatments.id,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Container(
                                alignment: Alignment.center,
                                height: 150,
                                child: Text(
                                  treatments.name,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        colorFilter: ColorFilter.mode(
                                            Colors.black54, BlendMode.darken),
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            'https://images.ulomobilespa.com/treatments/' +
                                                treatments.image))),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )));
  }
}
