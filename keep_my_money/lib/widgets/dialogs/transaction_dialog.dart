import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keep_my_money/models/expense.dart';
import 'package:keep_my_money/providers/budget_notifier.dart';
import 'package:keep_my_money/providers/expense_notifier.dart';

class TransactionDialog extends ConsumerStatefulWidget {
  const TransactionDialog({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TransactionDialogState();
}

class _TransactionDialogState extends ConsumerState<TransactionDialog> {
  final TextEditingController _amountController = TextEditingController();

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  void _submit(bool isExpense) {
    final int? amount = int.tryParse(_amountController.text);
    if (amount == null || amount <= 0) return;

    if (isExpense) {
      final newExpense = Expense(
        id: DateTime.now().toString(),
        amount: amount,
        date: DateTime.now(),
        category: '미분류',
      );
      ref.read(expenseProvider.notifier).addExpense(newExpense);
    } else {
      final currentBudget = ref.read(budgetProvider).totalAmount;
      ref.read(budgetProvider.notifier).updateAmount(currentBudget + amount);
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      contentPadding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              autofocus: true,
              decoration: const InputDecoration(
                hintText: '금액을 입력하세요',
                border: OutlineInputBorder(),
                suffixText: '원',
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[400],
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    onPressed: () => _submit(false),
                    child: const Text(
                      '입금',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    onPressed: () => _submit(true),
                    child: const Text(
                      '지출',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
