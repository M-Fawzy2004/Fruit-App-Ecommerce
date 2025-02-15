import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/feature/home/presentation/view/widget/custom_subtite_text.dart';
import 'package:flutter/material.dart';

class FruitItem extends StatefulWidget {
  const FruitItem({super.key, required this.productEntity});

  final ProductEntity productEntity;

  @override
  State<FruitItem> createState() => _FruitItemState();
}

class _FruitItemState extends State<FruitItem> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).colorScheme.tertiary,
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_outline,
                color: isFavorite ? Colors.red : Colors.grey,
              ),
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    height: MediaQuery.sizeOf(context).height * .12,
                    width: MediaQuery.sizeOf(context).width * .4,
                    imageUrl: widget.productEntity.imageUrl ?? '',
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
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.007,
                ),
                ListTile(
                  title: Text(
                    widget.productEntity.name,
                    maxLines: 1,
                    style: Styles.fontText16(context).copyWith(
                      fontWeight: FontWeight.w800,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  subtitle:
                      CustomSubtitleText(productEntity: widget.productEntity),
                  trailing: CircleAvatar(
                    backgroundColor: Color(0xff1B5E37),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add,
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
