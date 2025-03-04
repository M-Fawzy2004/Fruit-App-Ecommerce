import 'package:e_commerce_app/feature/auth/presentation/view/widget/recovery_view_body.dart';
import 'package:flutter/material.dart';

class RecoveryView extends StatelessWidget {
  const RecoveryView({super.key});

  static const routeName = '/recovery';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SafeArea(
          child: RecoveryViewBody(),
        ),
      ),
    );
  }
}
