import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ulo_mobile_spa/models/gifts.dart';
import 'package:ulo_mobile_spa/models/therapists.dart';
import 'package:ulo_mobile_spa/models/treatment.dart';
import 'package:ulo_mobile_spa/network_request/network_request.dart';

class NetworkProvider extends ChangeNotifier {
  NetworkProvider() {
    getTreatments();
    getTherapists();
    getGiftTypes();
  }
  List<Treatments> treatments = [];
  List<Therapists> therapists = [];
  List<Gifts> giftTypes = [];

  getGiftTypes() {
    Future<List<Gifts>> giftTypes = NetWorkRequest.getGiftTypes();
    giftTypes.then((giftType) {
      this.giftTypes = giftType;
      notifyListeners();
    });
  }

//2581.45+1581.45
//treatment
  getTreatments() {
    Future<List<Treatments>> treatmentList =
        NetWorkRequest.fetchTreatmentList();
    treatmentList.then((value) {
      this.treatments = value;
      notifyListeners();
    });
  }

  Gifts selectedGift;
  setselectedGift(Gifts gifts) {
    selectedGift = gifts;
    notifyListeners();
  }

  Treatments treatment;
  setSelectedTreatment(Treatments treatments) {
    treatment = treatments;
    treatment.isSelected = !treatment.isSelected;
    notifyListeners();
  }

// set selected duration
  Durations selectedDuration;
  setSelectedDuration(Durations duration) {
    selectedDuration = duration;
    notifyListeners();
  }

//Therapists
  getTherapists() {
    Future<List<Therapists>> therapists = NetWorkRequest.getTherapists();
    therapists.then((therapist) {
      this.therapists = therapist;
      notifyListeners();
    });
  }

  Therapists selectedtherapist;
  setselectedtherapist(Therapists therapists) {
    selectedtherapist = therapists;
    therapists.isSelected = !therapists.isSelected;
    notifyListeners();
  }

  //Set selected availability
  DefaultAvailability availability;
  setAvailability(DefaultAvailability availability) {
    this.availability = availability;
    notifyListeners();
  }
}
