import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomAnimationLoading extends StatelessWidget {
  const CustomAnimationLoading({
    super.key,
    required this.isLoading,
    required this.child,
  });

  final bool isLoading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: LoadingAnimationWidget.fallingDot(
              color: Colors.white,
              size: 50,
            ),
          )
        : child;
  }
}
