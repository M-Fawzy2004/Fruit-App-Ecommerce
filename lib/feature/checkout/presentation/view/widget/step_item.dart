import 'package:e_commerce_app/feature/checkout/presentation/view/widget/active_step_item.dart';
import 'package:e_commerce_app/feature/checkout/presentation/view/widget/in_active_step_item.dart';
import 'package:flutter/material.dart';

class StepItem extends StatelessWidget {
  const StepItem({
    super.key,
    required this.index,
    required this.text,
    required this.isActive,
  });

  final String index, text;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: InActiveStepItem(text: text, index: index),
      secondChild: ActiveStepItem(text: text),
      crossFadeState:
          isActive ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      duration: Duration(milliseconds: 300),
    );
  }
}
