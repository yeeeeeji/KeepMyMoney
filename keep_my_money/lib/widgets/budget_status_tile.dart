import 'package:flutter/material.dart';
import 'package:keep_my_money/utils/extensions.dart';

class BudgetStatusTile extends StatelessWidget {
  final int totalAmount;
  final int spentAmount;

  const BudgetStatusTile({
    super.key,
    required this.totalAmount,
    required this.spentAmount,
  });

  @override
  Widget build(BuildContext context) {
    final int balance = totalAmount - spentAmount;
    final double progress = balance / totalAmount;
    return Padding(
      padding: const EdgeInsets.fromLTRB(80, 0, 80, 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(balance.toWon),
              Text("/"),
              Text(totalAmount.toWon)
            ],
          ),
          SizedBox(child: _ProgressBar(progress: progress))
        ],
      ),
    );
  }
}

class _ProgressBar extends StatelessWidget {
  final double progress;

  const _ProgressBar({
    super.key,
    required this.progress
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              _BarBase(isBackground: true, width: constraints.maxWidth,),
              _BarBase(progress: progress, width: constraints.maxWidth,),
            ],
          );
      }),
    );
  }
}

class _BarBase extends StatelessWidget {
  final bool isBackground;
  final double progress;
  final double width;

  const _BarBase({
    super.key,
    this.isBackground = false,
    this.progress = 1,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    final Color barColor = isBackground
      ? Colors.grey[200]!
      : progress > 0.8 ? Colors.redAccent : Colors.green;

    return Container(
      width: width * progress.clamp(0.0, 1.0),
      decoration: BoxDecoration(
        color: barColor,
        borderRadius: BorderRadius.circular(5)
      ),
    );
  }
}