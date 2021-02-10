/*
class Therapists {
  final int id;
  final String name;
  final String avatar;
  final String emailAddress;
  final String phone;
  final String credentials;
  final String membershipId;
  final List<String> description;
  final List<int> treatmentIds;
  final List<DefaultAvailability> defaultAvailability;
  // final List<DailyAvailability> dailyAvailability;
  Therapists({
    this.id,
    this.name,
    this.avatar,
    this.emailAddress,
    this.phone,
    this.membershipId,
    this.credentials,
    this.description,
    this.treatmentIds,
    this.defaultAvailability,
    // this.dailyAvailability,
  });

  factory Therapists.fromMap(Map<String, dynamic> map) {
    List<String> description = [];
    List<int> treatmentIds = [];
    map['treatmentIds'].forEach((data) => treatmentIds.add(data));
    List<DefaultAvailability> defaultAvailability = [];
    map['defaultAvailability'].forEach(
        (map) => defaultAvailability.add(DefaultAvailability.fromMap(map)));
    map['description'].forEach((data) => description.add(data));

    return Therapists(
      id: map['id'],
      name: map['name'],
      avatar: map['avatar'],
      emailAddress: map['emailAddress'],
      membershipId: map['membershipId'],
      phone: map['phone'],
      credentials: map['credentials'],
      desc: description, //List<String>.from(map['description'].map((m) => m)),
      treatmentIds: List<int>.from(map['treatmentIds'].map((x) => x))
          .toList(), //treatmentIds,
      defaultAvailability: defaultAvailability,
    );
  }

  @override
  String toString() {
    return 'Therapists(id: $id, name: $name, avatar: $avatar, emailAddress: $emailAddress, phone: $phone, credentials: $credentials, desc: $desc, defaultAvailability: $defaultAvailability)';
  }
}

class DefaultAvailability {
  final int key;
  final String displayValue;

  DefaultAvailability({this.key, this.displayValue});

  factory DefaultAvailability.fromMap(Map<String, dynamic> map) {
    return DefaultAvailability(
        displayValue: map['displayValue'], key: map['key']);
  }

  @override
  String toString() =>
      'DefaultAvailability(key: $key, displayValue: $displayValue)';
}
*/

// To parse this JSON data, do
//
//     final therapists = therapistsFromJson(jsonString);

import 'dart:convert';

List<Therapists> therapistsFromJson(String str) =>
    List<Therapists>.from(json.decode(str).map((x) => Therapists.fromJson(x)));

String therapistsToJson(List<Therapists> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Therapists {
  Therapists({
    this.id,
    this.therapistId,
    this.name,
    this.avatar,
    this.treatmentIds,
    this.defaultAvailability,
    // this.dailyAvailability,
    this.emailAddress,
    this.phone,
    this.credentials,
    this.description,
    this.isSelected = false,
    this.membershipId,
  });

  String id;
  int therapistId;
  String name;
  String avatar;
  List<int> treatmentIds;
  List<DefaultAvailability> defaultAvailability;
  //Map<String, List<Availability>> dailyAvailability;
  String emailAddress;
  String phone;
  String credentials;
  List<String> description;
  String membershipId;
  bool isSelected;

  factory Therapists.fromJson(Map<String, dynamic> json) {
    List<DefaultAvailability> defaultAvailability = [];
    json['defaultAvailability'].forEach(
        (map) => defaultAvailability.add(DefaultAvailability.fromMap(map)));
    return Therapists(
      id: json["_id"],
      therapistId: json["id"],
      name: json["name"],
      avatar: json["avatar"],
      treatmentIds: List<int>.from(json["treatmentIds"].map((x) => x)),
      defaultAvailability: defaultAvailability //List<Availability>.from(
      //json["defaultAvailability"].map((x) => Availability.fromJson(x))),
      ,
      emailAddress: json["emailAddress"] == null ? null : json["emailAddress"],
      phone: json["phone"] == null ? null : json["phone"],
      credentials: json["credentials"] == null ? null : json["credentials"],
      description: json["description"] == null
          ? null
          : List<String>.from(json["description"].map((x) => x)),
      membershipId: json["membershipId"] == null ? null : json["membershipId"],
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "id": therapistId,
        "name": name,
        "avatar": avatar,
        "treatmentIds": List<dynamic>.from(treatmentIds.map((x) => x)),
        // "defaultAvailability":
        //  List<dynamic>.from(defaultAvailability.map((x) => x.toJson())),
        //"dailyAvailability": Map.from(dailyAvailability).map((k, v) =>
        //  MapEntry<String, dynamic>(
        //     k, List<dynamic>.from(v.map((x) => x.toJson())))),
        "emailAddress": emailAddress == null ? null : emailAddress,
        "phone": phone == null ? null : phone,
        "credentials": credentials == null ? null : credentials,
        "description": description == null
            ? null
            : List<dynamic>.from(description.map((x) => x)),
        "membershipId": membershipId == null ? null : membershipId,
      };
}

class DefaultAvailability {
  final int key;
  final String displayValue;

  DefaultAvailability({this.key, this.displayValue});

  factory DefaultAvailability.fromMap(Map<String, dynamic> map) {
    return DefaultAvailability(
        displayValue: map['displayValue'], key: map['key']);
  }

  @override
  String toString() =>
      'DefaultAvailability(key: $key, displayValue: $displayValue)';
}

/*
class Availability {
  Availability({
    this.key,
    this.displayValue,
  });

  int key;
  DisplayValue displayValue;

  factory Availability.fromJson(Map<String, dynamic> json) => Availability(
        key: json["key"],
        displayValue: displayValueValues.map[json["displayValue"]],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "displayValue": displayValueValues.reverse[displayValue],
      };
}

enum DisplayValue {
  THE_900_A_M,
  THE_1000_A_M,
  THE_1100_A_M,
  THE_1200_P_M,
  THE_100_P_M,
  THE_200_P_M,
  THE_300_P_M,
  THE_400_P_M,
  THE_500_P_M,
  THE_600_P_M,
  THE_700_P_M,
  THE_800_P_M,
  THE_900_P_M
}

final displayValueValues = EnumValues({
  "10:00 A.M.": DisplayValue.THE_1000_A_M,
  "1:00 P.M.": DisplayValue.THE_100_P_M,
  "11:00 A.M.": DisplayValue.THE_1100_A_M,
  "12:00 P.M.": DisplayValue.THE_1200_P_M,
  "2:00 P.M.": DisplayValue.THE_200_P_M,
  "3:00 P.M.": DisplayValue.THE_300_P_M,
  "4:00 P.M.": DisplayValue.THE_400_P_M,
  "5:00 P.M.": DisplayValue.THE_500_P_M,
  "6:00 P.M.": DisplayValue.THE_600_P_M,
  "7:00 P.M.": DisplayValue.THE_700_P_M,
  "8:00 P.M.": DisplayValue.THE_800_P_M,
  "9:00 A.M.": DisplayValue.THE_900_A_M,
  "9:00 P.M.": DisplayValue.THE_900_P_M
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
*/
