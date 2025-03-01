import 'package:e_commerce_app/constant.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ProfileItem extends StatefulWidget {
  const ProfileItem({
    super.key,
    required this.text,
    required this.image,
    this.onTap,
    required this.imageIcon,
    required this.isIcon,
    this.onChanged,
  });

  final String text, image, imageIcon;
  final void Function()? onTap;
  final bool isIcon;
  final void Function(bool)? onChanged;

  @override
  State<ProfileItem> createState() => _ProfileItemState();
}

class _ProfileItemState extends State<ProfileItem> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: MediaQuery.sizeOf(context).height * .05,
        padding: EdgeInsets.symmetric(vertical: 13.5, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.tertiary,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(widget.image),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * .03,
            ),
            Text(
              widget.text,
              style: Styles.fontText13(context).copyWith(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            Spacer(),
            widget.isIcon
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7.0),
                    child: Image.asset(
                      widget.imageIcon,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  )
                : Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      children: [
                        Transform.scale(
                          scale: 0.7,
                          child: Switch(
                            padding: EdgeInsets.zero,
                            value: isSwitched,
                            onChanged: (val) {
                              setState(() {
                                isSwitched = val;
                              });
                              if (widget.onChanged != null) {
                                widget.onChanged!(val);
                              }
                            },
                            activeColor: Theme.of(context).colorScheme.tertiary,
                            activeTrackColor: activeDotColor,
                            inactiveThumbColor:
                                Theme.of(context).colorScheme.inversePrimary,
                            inactiveTrackColor:
                                Theme.of(context).colorScheme.tertiary,
                          ),
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
