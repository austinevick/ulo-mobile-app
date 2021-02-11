class Treatments {
  final int id;
  final String name;
  final List<String> desc;
  final String image;
  final int cityId;
  final List<Durations> duration;
  bool isSelected;
  Treatments({
    this.id,
    this.name,
    this.isSelected = false,
    this.desc,
    this.image,
    this.cityId,
    this.duration,
  });
  factory Treatments.fromMap(Map<String, dynamic> map) {
    List<Durations> durationList = [];
    List<String> descriptions = [];
    map['description'].forEach((map) => descriptions.add(map));
    map['durations'].forEach((map) => durationList.add(Durations.fromMap(map)));
    return Treatments(
      id: map['id'],
      name: map['name'],
      desc: descriptions,
      cityId: map['cityId'],
      image: map['image'],
      duration: durationList,
    );
  }

  @override
  String toString() {
    return 'Treatments(id: $id, name: $name, desc: $desc, image: $image, cityId: $cityId, duration: $duration)';
  }
}

class Durations {
  final int id;
  final String length;
  final int price;
  bool isSelected;
  Durations({
    this.id,
    this.length,
    this.price,
    this.isSelected = false,
  });
  factory Durations.fromMap(Map<String, dynamic> map) {
    return Durations(
      id: map['id'],
      length: map['length'],
      price: map['price'],
    );
  }

  @override
  String toString() => 'Durations(id: $id, length: $length, price: $price)';
}
