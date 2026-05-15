import 'package:flutter/material.dart';
import '../models/dish.dart';
import '../data/mock_data.dart';
import '../theme/app_colors.dart';

// Экран с подробной инфой по блюду
class DishDetailScreen extends StatefulWidget {
  final Dish dish;

  const DishDetailScreen({super.key, required this.dish});

  @override
  State<DishDetailScreen> createState() => _DishDetailScreenState();
}

class _DishDetailScreenState extends State<DishDetailScreen> {
  // Состояние избранного (сердечко)
  bool isFavorite = false;

  // Активный таб: 0 — Дополнительно, 1 — Похожие, 2 — Отзывы
  int activeTab = 0;

  @override
  Widget build(BuildContext context) {
    // Для бургера показываем большую версию ассета, для остальных — обычную
    final String bigImage = widget.dish.category == 'burger'
        ? 'assets/images/burger_big.png'
        : widget.dish.imageUrl;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Картинка с навигацией и иконками сверху
              Stack(
                children: [
                  Image.asset(
                    bigImage,
                    width: double.infinity,
                    height: 280,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 280,
                        color: Colors.grey[300],
                        child: const Icon(Icons.fastfood, size: 80, color: Colors.grey),
                      );
                    },
                  ),
                  // Кнопка "назад" (стрелка влево)
                  Positioned(
                    top: 16,
                    left: 16,
                    child: _buildCircleButton(
                      icon: Icons.arrow_back_ios_new,
                      onTap: () => Navigator.pop(context),
                    ),
                  ),
                  // Иконка корзины
                  Positioned(
                    top: 16,
                    right: 16,
                    child: _buildCircleButton(
                      icon: Icons.shopping_cart_outlined,
                      onTap: () {},
                    ),
                  ),
                  // Кнопка "вперед" по галерее (заглушка)
                  Positioned(
                    bottom: 16,
                    right: 16,
                    child: _buildCircleButton(
                      icon: Icons.arrow_forward_ios,
                      onTap: () {},
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.dish.name,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        // Сердечко избранного
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isFavorite = !isFavorite;
                            });
                          },
                          icon: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite ? Colors.red : AppColors.textGrey,
                          ),
                        ),
                      ],
                    ),
                    // Рейтинг + время доставки + цена
                    Row(
                      children: [
                        const Icon(Icons.star, color: AppColors.yellow, size: 16),
                        const SizedBox(width: 4),
                        Text('${widget.dish.rating}'),
                        const SizedBox(width: 6),
                        Text('(${widget.dish.reviewsCount})',
                            style: const TextStyle(color: AppColors.textGrey)),
                        const SizedBox(width: 12),
                        Text(widget.dish.deliveryTime,
                            style: const TextStyle(color: AppColors.textGrey)),
                        const Spacer(),
                        Text(
                          '₽${widget.dish.price}',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      widget.dish.description,
                      style: const TextStyle(color: AppColors.textGrey, height: 1.4),
                    ),
                    const SizedBox(height: 16),
                    // Кнопка Купить
                    SizedBox(
                      width: double.infinity,
                      height: 44,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.yellow,
                          foregroundColor: AppColors.textDark,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22),
                          ),
                        ),
                        child: const Text('Купить',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Табы
                    Row(
                      children: [
                        _buildTab('Дополнительно', 0),
                        const SizedBox(width: 16),
                        _buildTab('Похожие', 1),
                        const SizedBox(width: 16),
                        _buildTab('Отзывы', 2),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Содержимое таба
                    _buildTabContent(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Круглая кнопка-иконка для оверлеев на картинке
  Widget _buildCircleButton({required IconData icon, required VoidCallback onTap}) {
    return Material(
      color: AppColors.white,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Icon(icon, size: 18, color: AppColors.textDark),
        ),
      ),
    );
  }

  // Таб
  Widget _buildTab(String title, int index) {
    final isActive = activeTab == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          activeTab = index;
        });
      },
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          color: isActive ? AppColors.textDark : AppColors.textGrey,
        ),
      ),
    );
  }

  // Содержимое таба
  Widget _buildTabContent() {
    if (activeTab == 0) {
      // Дополнительно — список доп. товаров с локальными картинками
      return Column(
        children: extrasList.map((extra) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    extra['image'],
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.brown[300],
                        child: const Icon(Icons.coffee, color: Colors.white, size: 20),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(extra['name'],
                          style: const TextStyle(fontWeight: FontWeight.w500)),
                      Text(extra['desc'],
                          style: const TextStyle(
                              fontSize: 12, color: AppColors.textGrey)),
                    ],
                  ),
                ),
                Text('${extra['price']} руб',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          );
        }).toList(),
      );
    } else if (activeTab == 1) {
      return const Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Text('Здесь будут похожие блюда',
              style: TextStyle(color: AppColors.textGrey)),
        ),
      );
    } else {
      return const Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Text('Здесь будут отзывы',
              style: TextStyle(color: AppColors.textGrey)),
        ),
      );
    }
  }
}
