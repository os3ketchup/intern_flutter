class CardDetails {
  final String number;
  final String age;
  final String cvc;

  CardDetails(this.number, this.age, this.cvc);

  // Convert Card object to Map
  Map<String, dynamic> toJSON() {
    return {'number': number, 'age': age, 'cvc': cvc};
  }

  // Factory method to create a Card object from a map
  factory CardDetails.fromJSON(Map<String, dynamic> json) {
    return CardDetails(
      json['number'] as String,
      json['age'] as String,
      json['cvc'] as String,
    );
  }
}
