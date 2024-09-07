import 'package:flutter/material.dart';

class CommonTextfield extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  const CommonTextfield(
      {super.key, required this.controller, required this.label});

  @override
  State<CommonTextfield> createState() => _CommonTextfieldState();
}

class _CommonTextfieldState extends State<CommonTextfield> {
  double height = 70.0;
  double width = 0;
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(12),
      elevation: 6,
      shadowColor: Colors.black,
      child: AnimatedContainer(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.yellow, Colors.white],
          ),
        ),
        padding: const EdgeInsets.all(12),
        duration: const Duration(milliseconds: 300),
        curve: Curves.bounceInOut, // Use the bounce curve for animation
        width: (MediaQuery.of(context).size.width * .7) + width,
        height: height,
        child: TextField(
            onTap: _startBounceAnimation,
            controller: widget.controller,
            decoration: InputDecoration(
              label: Text(widget.label),
              border: InputBorder.none,
            )),
      ),
    );
  }

  // Initial height of the box
  void _startBounceAnimation() {
    setState(() {
      height = 90.0;
      width = 30; // Set the target height for the bounce animation
    });

    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        height = 70.0;
        width = 0; // Reset the height after the bounce animation
      });
    });
  }
}
