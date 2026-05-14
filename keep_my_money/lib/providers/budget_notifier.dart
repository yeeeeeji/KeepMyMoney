import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keep_my_money/models/budget.dart';

class BudgetNotifier extends Notifier<Budget> {
  @override
  Budget build() {
    final now = DateTime.now();
    return Budget(totalAmount: 500000, month: now.month.toString());
  }

  void updateAmount(int newAmount) {
    state = state.copyWith(totalAmount: newAmount);
  }
}

final budgetProvider = NotifierProvider<BudgetNotifier, Budget>(
  () => BudgetNotifier(),
);
