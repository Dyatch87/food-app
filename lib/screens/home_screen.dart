import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../models/dish.dart';
import '../theme/app_colors.dart';
import '../widgets/dish_card.dart';
import '../widgets/category_selector.dart';
import '../widgets/app_drawer.dart';

// Главный экран — заголовок "Голоден?", поиск, категории, список блюд
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Текущая выбранная категория
  String selectedCategory = 'all';

  // Текст из поиска
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    // Фильтруем блюда по категории и поиску
    List<Dish> filtered = dishesList.where((dish) {
      final byCategory = selectedCategory == 'all' || dish.category == selectedCategory;
      final bySearch = searchText.isEmpty ||
          dish.name.toLowerCase().contains(searchText.toLowerCase());
      return byCategory && bySearch;
    }).toList();

    return Scaffold(
      backgroundColor: AppColors.background,
      drawer: const AppDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            // Верхняя панель — бургер-меню, город, иконка корзины
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Builder(
                    builder: (context) => IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () => Scaffold.of(context).openDrawer(),
                    ),
                  ),
                  const Spacer(),
                  // Селектор города
                  Row(
                    children: const [
                      Icon(Icons.location_on_outlined, size: 18),
                      SizedBox(width: 4),
                      Text('Челябинск',
                          style: TextStyle(fontWeight: FontWeight.w500)),
                      Icon(Icons.keyboard_arrow_down, size: 18),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.shopping_cart_outlined),
                    onPressed: () {
                      // TODO: переход в корзину
                    },
                  ),
                ],
              ),
            ),
            // Заголовок "Голоден?"
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Голоден?',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Поле поиска
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    searchText = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Поиск по меню',
                  hintStyle: const TextStyle(color: AppColors.textGrey),
                  prefixIcon: const Icon(Icons.search, color: AppColors.textGrey),
                  filled: true,
                  fillColor: AppColors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                ),
              ),
            ),
            const SizedBox(height: 12),
            // Категории
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CategorySelector(
                selected: selectedCategory,
                onSelect: (key) {
                  setState(() {
                    selectedCategory = key;
                  });
                },
              ),
            ),
            const SizedBox(height: 8),
            // Список блюд
            Expanded(
              child: filtered.isEmpty
                  ? const Center(
                      child: Text(
                        'Ничего не найдено',
                        style: TextStyle(color: AppColors.textGrey),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: filtered.length,
                      itemBuilder: (context, index) {
                        return DishCard(dish: filtered[index]);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
