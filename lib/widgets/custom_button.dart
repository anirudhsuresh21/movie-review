import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String buttonText;
  final double? buttonWidth;
  final Function()? goTo;

  const CustomButton({
    super.key,
    required this.buttonText,
    required this.buttonWidth,
    this.goTo,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Material(
        elevation: 2,
        surfaceTintColor: Colors.white,
        shadowColor: Color(0xffFFCA45),
        borderRadius: BorderRadius.circular(14),
        color: const Color(0xffFFB703),
        child: MaterialButton(
          highlightColor: Colors.white,
          padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
          minWidth: widget.buttonWidth,
          height: 30,
          onPressed: widget.goTo,
          child: Text(
            widget.buttonText,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
