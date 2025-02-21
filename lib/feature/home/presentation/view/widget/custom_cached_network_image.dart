import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.onTap,
    this.height,
    this.width,
  });

  final String imageUrl;
  final void Function()? onTap;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        onTap: onTap,
        child: CachedNetworkImage(
          height: height ?? MediaQuery.sizeOf(context).height * .12,
          width: width ?? MediaQuery.sizeOf(context).width * .4,
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          placeholder: (context, url) => Icon(
            Icons.image,
            size: MediaQuery.sizeOf(context).height * .12,
            color: Colors.grey,
          ),
          errorWidget: (context, url, error) => Container(
            color: Theme.of(context).colorScheme.secondary,
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height * .12,
              width: MediaQuery.sizeOf(context).width * .4,
            ),
          ),
        ),
      ),
    );
  }
}
