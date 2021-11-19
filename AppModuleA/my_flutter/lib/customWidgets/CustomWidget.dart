import 'package:flutter/material.dart';

/// 自定义渐变色的button
class GradientButton extends StatelessWidget {
/// 渐变色组
final List<Color> colors;
final double? width;
final double? height;
final GestureTapCallback? onPressed;
final Widget child;
final BorderRadius? borderRadius;

GradientButton({required this.colors, this.width, this.height, this.onPressed, this.borderRadius, required this.child});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: colors),
        borderRadius: borderRadius
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          splashColor: Colors.red,
          highlightColor: Colors.purple,
          borderRadius: borderRadius,
          onTap: onPressed,
          child: ConstrainedBox(
            constraints:  BoxConstraints.tightFor(width: width, height: height),
            child: Center(
              child: Padding(
                child: child, 
                padding: const EdgeInsets.all(5),
                ),
              ),
            ),
            
        ),
      ),
      );
  }
}



