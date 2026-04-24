import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:keep_my_money/widgets/budget_status_tile.dart';
import 'package:keep_my_money/widgets/buttons/expense_fab.dart';

class HomeTab extends StatefulWidget {

  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 150, 0, 40),
        child: Column(
          children: [
            _TodayBlock(date: DateTime.now(),),
            BudgetStatusTile(totalAmount: 10000, spentAmount: 5000)
          ],
        ),
      ),
    );
  }
}

class _TodayBlock extends StatelessWidget {
  final DateTime date;
  
  const _TodayBlock ({
    super.key,
    required this.date
  });

  @override
  Widget build(BuildContext context) {
    final String today = DateFormat("M월 d일").format(date);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          today,
          style: const TextStyle(fontSize: 18, color: Colors.black87),
        )
      ],
    );
  }
}