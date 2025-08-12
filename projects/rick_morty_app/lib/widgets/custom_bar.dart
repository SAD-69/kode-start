import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showBackButton;
  final VoidCallback? onBack;

  const CustomAppBar({
    super.key,
    this.showBackButton = false,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF1A1A1A),
      elevation: 0,
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: onBack ??
                  () {
                    Navigator.pop(context);
                  },
            )
          : IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                
              },
            ),
      centerTitle: true,
      title: Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/kobe_logo.png',
              height: 40,
              width: 115,
              fit: BoxFit.contain,
            ),
            const Text(
              "RICK AND MORTY API",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'CustomFont',
                fontSize: 12,
                letterSpacing: 2,
              ),
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.account_circle, color: Colors.white),
          onPressed: () {
            
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(90);
}
