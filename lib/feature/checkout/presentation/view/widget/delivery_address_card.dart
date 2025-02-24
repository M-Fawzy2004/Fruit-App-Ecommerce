import 'package:e_commerce_app/constant.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class DeliveryAddressCard extends StatelessWidget {
  const DeliveryAddressCard({
    super.key,
    required this.address,
    required this.onEdit,
  });

  final String address;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.tertiary,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'عنوان التوصيل',
                style: Styles.fontText13(context).copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              Spacer(),
              InkWell(
                onTap: onEdit,
                child: Row(
                  children: [
                    Image.asset(Assets.imagesVector),
                    SizedBox(width: screenWidth * 0.02),
                    Text(
                      'تعديل',
                      style: Styles.fontText13(context),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * .02),
          Row(
            children: [
              Image.asset(
                Assets.imagesLocation,
                color: activeDotColor,
              ),
              SizedBox(width: screenWidth * .02),
              Text(
                address,
                style: Styles.fontText16(context).copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
