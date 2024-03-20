class SqfliteDbModel {
  final int? id;
  final String type;
  final double amount;
  final DateTime dateReceived;
  final String header;

  SqfliteDbModel({
    this.id,
    required this.header,
    required this.type,
    required this.amount,
    required this.dateReceived,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'header': header,
      'type': type,
      'amount': amount,
      'dateReceived': dateReceived.toIso8601String(),
    };
  }

  factory SqfliteDbModel.fromMap(Map<String, dynamic> map) {
    return SqfliteDbModel(
      id: map['id'],
      header: map['header'],
      type: map['type'],
      amount: map['amount'],
      dateReceived: DateTime.parse(map['dateReceived']),
    );
  }

  SqfliteDbModel copyWith({int? id, String? header, String? type, double? amount, DateTime? dateReceived}) {
    return SqfliteDbModel(
      id: id ?? this.id,
      header: header ?? this.header,
      type: type ?? this.type,
      amount: amount ?? this.amount,
      dateReceived: dateReceived ?? this.dateReceived,
    );
  }
}
