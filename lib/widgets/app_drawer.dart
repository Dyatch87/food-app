import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

// Боковое меню (Drawer) с профилем юзера и пунктами
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.background,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Шапка с профилем
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  // Аватарка-заглушка
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.orange[200],
                    child: const Text('JN', style: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Juanita Nguyen',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        Text(
                          'somemail@mail.com',
                          style: TextStyle(color: AppColors.textGrey, fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                  // Кнопка выхода
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.logout, color: AppColors.textGrey),
                  ),
                ],
              ),
            ),
            const Divider(),
            // Пункты меню
            _buildMenuItem(context, 'Все меню', null),
            _buildMenuItem(context, 'Заказы', '6'),
            _buildMenuItem(context, 'Корзина', '3'),
          ],
        ),
      ),
    );
  }

  // Один пункт бокового меню с опциональным значком (бейджем)
  Widget _buildMenuItem(BuildContext context, String title, String? badge) {
    return ListTile(
      title: Text(title, style: const TextStyle(fontSize: 15)),
      trailing: badge != null
          ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.yellow,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                badge,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                ),
              ),
            )
          : null,
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}
