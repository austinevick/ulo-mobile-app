class Gifts {
  final int id;
  final String desc;
  final int amount;
  final String duration;
  Gifts({
    this.id,
    this.desc,
    this.amount,
    this.duration,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'desc': desc,
      'amount': amount,
      'duration': duration,
    };
  }

  factory Gifts.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Gifts(
      id: map['id'],
      desc: map['description'],
      amount: map['amount'],
      duration: map['duration'],
    );
  }
}
