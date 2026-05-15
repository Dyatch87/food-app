import '../models/dish.dart';

// Захардкоженный список блюд с локальными картинками из assets/images/
final List<Dish> dishesList = [
  Dish(
    id: '1',
    name: 'Дерзкая Марго',
    category: 'pizza',
    rating: 4.5,
    reviewsCount: '100+',
    deliveryTime: '25-30 мин',
    price: 300,
    imageUrl: 'assets/images/pizza.png',
    description:
        'Et consectetur commodo ut consectetur ex nulla voluptate commodo ipsum incididunt qui dolor.',
  ),
  Dish(
    id: '2',
    name: 'Горячий парень',
    category: 'kebab',
    rating: 4.5,
    reviewsCount: '100+',
    deliveryTime: '25-30 мин',
    price: 300,
    imageUrl: 'assets/images/kebab.png',
    description:
        'Et consectetur commodo ut consectetur ex nulla voluptate commodo ipsum incididunt qui dolor.',
  ),
  Dish(
    id: '3',
    name: 'Вкусняшка Миа',
    category: 'pizza',
    rating: 4.5,
    reviewsCount: '100+',
    deliveryTime: '25-30 мин',
    price: 300,
    imageUrl: 'assets/images/dish.png',
    description:
        'Et consectetur commodo ut consectetur ex nulla voluptate commodo ipsum incididunt qui dolor.',
  ),
  Dish(
    id: '4',
    name: 'Сытый Питт',
    category: 'burger',
    rating: 4.5,
    reviewsCount: '100+',
    deliveryTime: '25-30 мин',
    price: 300,
    imageUrl: 'assets/images/burger.png',
    description:
        'Et consectetur commodo ut consectetur ex nulla voluptate commodo ipsum incididunt qui dolor.',
  ),
];

// Доп. товары для карточки блюда (вкладка "Дополнительно")
final List<Map<String, dynamic>> extrasList = [
  {'name': 'Просто кофе', 'desc': 'Вкусный зерновой кофеёчек', 'price': 200, 'image': 'assets/images/coffee.png'},
  {'name': 'Просто кофе', 'desc': 'Вкусный зерновой кофеёчек', 'price': 200, 'image': 'assets/images/coffee.png'},
  {'name': 'Просто кофе', 'desc': 'Вкусный зерновой кофеёчек', 'price': 200, 'image': 'assets/images/coffee.png'},
  {'name': 'Просто кофе', 'desc': 'Вкусный зерновой кофеёчек', 'price': 200, 'image': 'assets/images/coffee.png'},
];
