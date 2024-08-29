import 'package:flutter/material.dart';

class CommonTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  const CommonTextfield(
      {super.key, required this.controller, required this.label});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(12),
      elevation: 6,
      shadowColor: Colors.black,
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.yellow, Colors.white],
          ),
        ),
        padding: const EdgeInsets.all(12),
        child: TextField(
            controller: controller,
            decoration: InputDecoration(
              label: Text(label),
            )),
      ),
    );
  }
}
