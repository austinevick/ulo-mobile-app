class Booking {
  final String fullName;
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
    this.fullName,
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
      'fullName': fullName,
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
      fullName: map['fullName'],
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

  @override
  String toString() {
    return 'Booking(fullName: $fullName,street: $street, email: $email, postalCode: $postalCode, phoneNumber: $phoneNumber, instructions: $instructions, pet: $pet, stairs: $stairs, dateOfBooking: $dateOfBooking, location: $location, socialChoice: $socialChoice, treatment: $treatment, duration: $duration, therapist: $therapist, date: $date, time: $time)';
  }
}
