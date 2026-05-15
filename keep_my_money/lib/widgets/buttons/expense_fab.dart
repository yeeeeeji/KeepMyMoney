import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keep_my_money/widgets/dialogs/transaction_dialog.dart';

class ExpenseFab extends ConsumerWidget {
  const ExpenseFab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () {
        _showTransactionModal(context, ref);
      },
      backgroundColor: Colors.grey[300],
      child: const Icon(Icons.add, color: Colors.black87),
    );
  }
}

void _showTransactionModal(BuildContext context, WidgetRef ref) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => const TransactionDialog(),
  );
}
