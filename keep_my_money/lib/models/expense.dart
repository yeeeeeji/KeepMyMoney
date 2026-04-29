class Expense {
  final String id;
  final int amount;
  final DateTime date;
  final String category;

  Expense({
    required this.id,
    required this.amount,
    required this.date,
    required this.category,
  });

  Expense copyWith({
    String? id,
    int? amount,
    DateTime? date,
    String? category,
  }) {
    return Expense(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'amount': amount,
      'date': date.toIso8601String(),
      'category': category,
    };
  }
}