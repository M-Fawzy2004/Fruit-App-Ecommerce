import 'package:e_commerce_app/core/entities/product_entity.dart';

ProductEntity getDummyProduct() {
  return ProductEntity(
    name: "تفاح أحمر",
    price: 10.5,
    code: "APPLE123",
    desc: "تفاح أحمر طازج ولذيذ",
    imageUrl: null,
    isFeatured: true,
    expritionmonths: 3,
    isOrganic: true,
    numberOfCalories: 52,
    unitAmount: 1,
    reviews: [],
    sellingCount: 50,
  );
}

List<ProductEntity> getDummyProducts() {
  return [
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
  ];
}
