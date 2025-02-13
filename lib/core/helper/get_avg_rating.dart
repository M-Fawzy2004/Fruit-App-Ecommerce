import 'package:e_commerce_app/core/entities/review_entity.dart';

num getAvagreRating(List<ReviewEntity> reviews) {
  double sum = 0.0;
  for (var review in reviews) {
    sum += review.rating;
  }
  return sum / reviews.length;
}
