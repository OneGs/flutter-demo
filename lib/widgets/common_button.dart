import 'package:flutter/material.dart';
import 'package:untitled/common//config_colors.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key,
    this.width = 150.0,
    this.onPressed,
    this.text = '确 定',
    this.height = 55.0,
    this.textSize = 18,
    this.circular = 25,
    this.textColor = Colors.white,
    this.beginColor = ConfigColors.color_3FD4CF,
    this.endColor = ConfigColors.color_3FAED4,
    this.borderColor = Colors.transparent,
  });

  final double width;
  final double height;
  final String? text;
  final double? textSize;
  final double? circular;
  final Color beginColor;
  final Color endColor;
  final Color textColor;
  final Color borderColor;

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(circular!),
        border: Border.all(color: borderColor, width: 1),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            beginColor,
            endColor,
          ],
        ),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          //去除阴影
          elevation: MaterialStateProperty.all(0),
          //将按钮背景设置为透明
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
        ),
        onPressed: () {
          if (onPressed != null) {
            onPressed!();
          }
        },
        child: Text(
          text!,
          style: TextStyle(fontSize: textSize, color: textColor),
        ),
      ),
    );
  }
}
