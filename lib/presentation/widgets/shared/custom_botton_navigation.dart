import 'package:flutter/material.dart';

class CustomBottonNavigation extends StatelessWidget {
  const CustomBottonNavigation({
    super.key,
    required this.buttons,
    required this.current,
  });
  final List<ButtonMenu> buttons;
  final int current;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: (value) {
          if (current == value) return;
          buttons[value].onTap(value);
        },
        currentIndex: current,
        elevation: 0,
        items: [
          ...buttons.map(
            (button) => BottomNavigationBarItem(
              label: button.lable,
              icon: Icon(button.icon),
            ),
          ),
        ]);
  }
}

class ButtonMenu {
  final String lable;
  final IconData icon;
  final Function(int) onTap;

  ButtonMenu({required this.lable, required this.icon, required this.onTap});
}
