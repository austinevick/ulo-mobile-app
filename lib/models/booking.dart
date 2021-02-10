import 'dart:convert';

import 'package:ulo_mobile_spa/models/treatment.dart';

class Booking {
  final String firstName;
  final String lastName;
  final String street;
  final String email;
  final String postalCode;
  final String phoneNumber;
  final String instructions;
  final String pet;
  final String stairs;
  final String dateOfBooking;
  final String location;
  final String socialChoice;
  final String treatment;
  final String duration;
  final String therapist;
  final String date;
  final String time;
  Booking({
    this.firstName,
    this.lastName,
    this.street,
    this.email,
    this.postalCode,
    this.phoneNumber,
    this.instructions,
    this.pet,
    this.stairs,
    this.dateOfBooking,
    this.location,
    this.socialChoice,
    this.treatment,
    this.duration,
    this.therapist,
    this.date,
    this.time,
  });

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'street': street,
      'email': email,
      'postalCode': postalCode,
      'phoneNumber': phoneNumber,
      'instructions': instructions,
      'pet': pet,
      'stairs': stairs,
      'dateOfBooking': dateOfBooking,
      'location': location,
      'socialChoice': socialChoice,
      'treatment': treatment,
      'duration': duration,
      'therapist': therapist,
      'date': date,
      'time': time,
    };
  }

  factory Booking.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Booking(
      firstName: map['firstName'],
      lastName: map['lastName'],
      street: map['street'],
      email: map['email'],
      postalCode: map['postalCode'],
      phoneNumber: map['phoneNumber'],
      instructions: map['instructions'],
      pet: map['pet'],
      stairs: map['stairs'],
      dateOfBooking: map['dateOfBooking'],
      location: map['location'],
      socialChoice: map['socialChoice'],
      treatment: map['treatment'],
      duration: map['duration'],
      therapist: map['therapist'],
      date: map['date'],
      time: map['time'],
    );
  }

  Booking copyWith({
    String firstName,
    String lastName,
    String street,
    String email,
    String postalCode,
    String phoneNumber,
    String instructions,
    String pet,
    String stairs,
    String dateOfBooking,
    String location,
    String socialChoice,
    String treatment,
    String duration,
    String therapist,
    String date,
    String time,
  }) {
    return Booking(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      street: street ?? this.street,
      email: email ?? this.email,
      postalCode: postalCode ?? this.postalCode,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      instructions: instructions ?? this.instructions,
      pet: pet ?? this.pet,
      stairs: stairs ?? this.stairs,
      dateOfBooking: dateOfBooking ?? this.dateOfBooking,
      location: location ?? this.location,
      socialChoice: socialChoice ?? this.socialChoice,
      treatment: treatment ?? this.treatment,
      duration: duration ?? this.duration,
      therapist: therapist ?? this.therapist,
      date: date ?? this.date,
      time: time ?? this.time,
    );
  }

  String toJson() => json.encode(toMap());

  factory Booking.fromJson(String source) =>
      Booking.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Booking(firstName: $firstName, lastName: $lastName, street: $street, email: $email, postalCode: $postalCode, phoneNumber: $phoneNumber, instructions: $instructions, pet: $pet, stairs: $stairs, dateOfBooking: $dateOfBooking, location: $location, socialChoice: $socialChoice, treatment: $treatment, duration: $duration, therapist: $therapist, date: $date, time: $time)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Booking &&
        o.firstName == firstName &&
        o.lastName == lastName &&
        o.street == street &&
        o.email == email &&
        o.postalCode == postalCode &&
        o.phoneNumber == phoneNumber &&
        o.instructions == instructions &&
        o.pet == pet &&
        o.stairs == stairs &&
        o.dateOfBooking == dateOfBooking &&
        o.location == location &&
        o.socialChoice == socialChoice &&
        o.treatment == treatment &&
        o.duration == duration &&
        o.therapist == therapist &&
        o.date == date &&
        o.time == time;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
        lastName.hashCode ^
        street.hashCode ^
        email.hashCode ^
        postalCode.hashCode ^
        phoneNumber.hashCode ^
        instructions.hashCode ^
        pet.hashCode ^
        stairs.hashCode ^
        dateOfBooking.hashCode ^
        location.hashCode ^
        socialChoice.hashCode ^
        treatment.hashCode ^
        duration.hashCode ^
        therapist.hashCode ^
        date.hashCode ^
        time.hashCode;
  }
}
