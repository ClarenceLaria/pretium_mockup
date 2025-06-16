import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.onTap,
    required this.selectedIndex,
  });

  final int selectedIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        // Background bar
        Container(
          height: 70,
          padding: const EdgeInsets.symmetric(horizontal: 32),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 245, 245, 245),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left Icon
              GestureDetector(
                onTap: () => onTap(0),
                child: Image.asset(
                  'assets/icons/wallet_1.png',
                  height: 28,
                  width: 28,
                  color: selectedIndex == 0 ? Theme.of(context).primaryColor : Colors.grey,
                ),
              ),
              const SizedBox(width: 60), // space for floating button
              // Right Icon
              GestureDetector(
                onTap: () => onTap(2),
                child: Image.asset(
                  'assets/icons/transactions.png',
                  height: 28,
                  width: 28,
                  color: selectedIndex == 2 ? Theme.of(context).primaryColor : Colors.grey,
                ),
              ),
            ],
          ),
        ),

        // Floating center button
        Positioned(
          bottom: 10, 
          child: GestureDetector(
            onTap: () => onTap(1),
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Center(
                child: Image.asset(
                  'assets/icons/qr-code.png',
                  height: 28,
                  width: 28,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
