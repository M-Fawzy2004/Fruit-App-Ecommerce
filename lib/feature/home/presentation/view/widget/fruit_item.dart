import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/core/utils/assets.dart';
import 'package:e_commerce_app/feature/home/presentation/view/widget/custom_subtite_text.dart';
import 'package:flutter/material.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key, required this.productEntity});

  final ProductEntity productEntity;

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
              onPressed: () {},
              icon: Icon(Icons.favorite_outline),
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
                    height: 100,
                    width: MediaQuery.sizeOf(context).width * .4,
                    imageUrl: productEntity.imageUrl ?? '',
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Icon(
                      Icons.image,
                      size: 25,
                      color: Colors.grey,
                    ),
                    errorWidget: (context, url, error) => Image.asset(
                      '',
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    productEntity.name,
                    style: Styles.fontText13(context),
                  ),
                  subtitle: CustomSubtitleText(productEntity: productEntity),
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
