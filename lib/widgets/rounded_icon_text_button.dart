import 'package:flutter/material.dart';

class RoundedIconTextButton extends StatelessWidget {
  final Color? buttonColor;
  final double outerPadding;
  final double borderRadius;
  final double innerPadding;
  final IconData icon;
  final double? iconSize;
  final Color? iconColor;
  final double spaceBetween;
  final String text;
  final double? textSize;
  final Color? textColor;
  final VoidCallback? onPressed;

  RoundedIconTextButton({
      Key? key,
      this.buttonColor,
      this.outerPadding = 16,
      this.borderRadius = 16,
      this.innerPadding = 16,
      required this.icon,
      this.iconSize,
      this.iconColor,
      this.spaceBetween = 20,
      required this.text,
      this.textSize,
      this.textColor,
      required this.onPressed
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(outerPadding),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(innerPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: iconSize,
                color: iconColor,
              ),
              SizedBox(
                width: spaceBetween,
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: textSize,
                    color: textColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}