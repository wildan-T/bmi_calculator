import 'package:flutter/material.dart';

class MyRactButton extends StatelessWidget {
  final VoidCallback onPress;
  final IconData icon;
  final String btnName;
  const MyRactButton(
      {super.key,
      required this.onPress,
      required this.icon,
      required this.btnName});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 50,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.primary,
          boxShadow: [
            BoxShadow(
              color: Colors.black
                  .withOpacity(0.2), // Warna bayangan dengan kelegapan
              spreadRadius: 2, // Menentukan seberapa jauh bayangan menyebar
              blurRadius: 5, // Seberapa kabur bayangan
              offset: Offset(2, 4), // Posisi bayangan (x, y)
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            SizedBox(width: 10),
            Text(
              btnName,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
