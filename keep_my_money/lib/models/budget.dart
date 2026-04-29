class Budget {
  final int totalAmount;
  final String month;

  Budget({
    required this.totalAmount,
    required this.month,
  });

  Budget copyWith({
    int? totalAmount,
    String? month
  }) {
    return Budget(
      totalAmount: totalAmount ?? this.totalAmount, 
      month: month ?? this.month
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'totalAmount': totalAmount,
      'month': month,
    };
  }
}