import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keep_my_money/models/expense.dart';

class ExpenseNotifier extends Notifier<List<Expense>> {
  
  @override
  List<Expense> build() {
    // DB 데이터 불러올 부분
    return [];
  }

  void addExpense(Expense expense) {
    state = [...state, expense];
  }

  void removeExpense(String id) {
    state = state.where((e) => e.id != id).toList();
  }

  void updateExpense(String id, int newAmount, String newCategory) {
    state = [
      for (final expense in state)
        if (expense.id == id)
          expense.copyWith(amount: newAmount, category: newCategory)
        else
          expense,
    ];
  }
}

final expenseProvider = NotifierProvider<ExpenseNotifier, List<Expense>>(() {
  return ExpenseNotifier();
});