import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const NavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _NavItem(
              icon: Icons.home_outlined, 
              activeIcon: Icons.home, 
              label: "홈", 
              index: 0,
              currentIndex: currentIndex,
              onTap: onTap,
            ),
            _NavItem(
              icon: Icons.pie_chart_outline_outlined, 
              activeIcon: Icons.pie_chart, 
              label: "카테고리", 
              index: 1,
              currentIndex: currentIndex,
              onTap: onTap,
            ),
            _NavItem(
              icon: Icons.settings_outlined, 
              activeIcon: Icons.settings, 
              label: "설정", 
              index: 2,
              currentIndex: currentIndex,
              onTap: onTap,
            )
          ],
          ),
      ),
    );
  }

}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final int index;

  final int currentIndex;
  final Function(int) onTap;

  const _NavItem({
    super.key,
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.index,
    required this.currentIndex,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            currentIndex == index ? activeIcon : icon,
            color: currentIndex == index ? Colors.blueAccent : Colors.grey,
            size: 28,
          ),
          const SizedBox(height: 4,),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: currentIndex == index ? FontWeight.bold : FontWeight.normal,
              color: currentIndex == index ? Colors.blueAccent : Colors.grey
            ),
          )
        ],
      ),
    );
  }
}