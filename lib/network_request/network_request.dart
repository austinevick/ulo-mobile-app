import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ulo_mobile_spa/models/gifts.dart';
import 'package:ulo_mobile_spa/models/place.dart';
import 'package:ulo_mobile_spa/models/therapists.dart';
import 'package:ulo_mobile_spa/models/treatment.dart';

import '../apikey.dart';

class NetWorkRequest {
  // Get list of treatments
  static Future<List<Treatments>> fetchTreatmentList() async {
    final treatmentUrl = 'https://api.ulomobilespa.com/treatments';
    List<Treatments> treatments = [];
    final response = await http.get(treatmentUrl);
    try {
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        List<dynamic> data = result;
        data.forEach((map) => treatments.add(Treatments.fromMap(map)));
        print(data);
      } else
        throw Exception('Unable to fetch data');
    } catch (e) {
      print(e);
    }
    return treatments;
  }

//////////////////////////////////////////////////////////////////////////////////////////
// Get list of therapist
  static Future<List<Therapists>> getTherapists() async {
    List<Therapists> therapists = [];

    final String therapistUrl = 'https://api.ulomobilespa.com/therapists';
    final response = await http.get(therapistUrl);

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      final data = result;
      //  print(data);

      data.forEach((map) => therapists.add(Therapists.fromJson(map)));
      return therapists;
      // return data.map((map) => Therapists.fromMap(map)).toList();
    }
    throw Exception('Unable to fetch data');
  }

//////////////////////////////////////////////////////////////////////////////////////////
// Get list of Gift Types
  static Future<List<Gifts>> getGiftTypes() async {
    List<Gifts> giftTypes = [];

    final String giftTypeUrl = 'https://api.ulomobilespa.com/giftTypes';
    final response = await http.get(giftTypeUrl);

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      final data = result;
      //  print(data);

      data.forEach((map) => giftTypes.add(Gifts.fromMap(map)));
      return giftTypes;
    }
    throw Exception('Unable to fetch data');
  }

//////////////////////////////////////////////////////////////////////////////////////////
// Get list of Countries
  static Future<List<Places>> searchLocation(String input) async {
    List<Places> places = [];
    final response = await http.get(
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&key=$kGoogleApiKey&(regions)');
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      final data = result['predictions'];
      print(data);
      for (var i = 0; i < data.length; i++) {
        String name = data[i]['description'];
        places.add(Places(name));
      }
    } else {
      print(response.statusCode);
    }
    return places;
  }
}
