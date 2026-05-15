import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

// Горизонтальный селектор категорий (Все, Пицца, Кебаб, Бургер)
class CategorySelector extends StatelessWidget {
  final String selected;
  final Function(String) onSelect;

  const CategorySelector({
    super.key,
    required this.selected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    // Список категорий — название, иконка, ключ
    final categories = [
      {'key': 'all', 'label': 'Все', 'icon': Icons.restaurant},
      {'key': 'pizza', 'label': 'Пицца', 'icon': Icons.local_pizza},
      {'key': 'kebab', 'label': 'Кебаб', 'icon': Icons.kebab_dining},
      {'key': 'burger', 'label': 'Бургер', 'icon': Icons.lunch_dining},
    ];

    return SizedBox(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final cat = categories[index];
          final isSelected = selected == cat['key'];
          return GestureDetector(
            onTap: () => onSelect(cat['key'] as String),
            child: Container(
              width: 70,
              margin: const EdgeInsets.only(right: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    cat['icon'] as IconData,
                    color: isSelected ? AppColors.yellow : AppColors.textGrey,
                    size: 28,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    cat['label'] as String,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      color: isSelected ? AppColors.textDark : AppColors.textGrey,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
