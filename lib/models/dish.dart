// Модель одного блюда в меню
class Dish {
  final String id;
  final String name;
  final String category; // 'pizza', 'kebab', 'burger'
  final double rating;
  final String reviewsCount; // "100+"
  final String deliveryTime; // "25-30 мин"
  final int price;
  final String imageUrl;
  final String description;

  Dish({
    required this.id,
    required this.name,
    required this.category,
    required this.rating,
    required this.reviewsCount,
    required this.deliveryTime,
    required this.price,
    required this.imageUrl,
    required this.description,
  });
}
