import 'package:e_commerce_app/feature/auth/presentation/view/widget/recovery_steps_page.dart';
import 'package:flutter/material.dart';

class RecoveryViewBody extends StatelessWidget {
  const RecoveryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: RecoveryStepsPage(),
        ),
      ],
    );
  }
}
