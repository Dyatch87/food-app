# Alt.Point Mobile Test Task

Тестовое задание — приложение доставки еды на Flutter.

## Что внутри
- 4 экрана: главный со списком блюд, фильтр по категориям, детальная страница блюда, боковое меню (Drawer)
- Поиск по названию
- Состояние избранного (сердечко)
- Табы на странице блюда (Дополнительно / Похожие / Отзывы)
- Картинки подгружаются с интернета (Unsplash) — заменить на ассеты из Figma в `assets/images/`

## Как запустить (с нуля)

### 1. Установить Flutter
Идёшь по ссылке https://docs.flutter.dev/install/manual, выбираешь свою ОС (Windows/Mac/Linux), скачиваешь архив и кладёшь его куда-нибудь (например `C:\flutter` на Windows). Дальше добавляешь путь к `flutter\bin` в переменные среды PATH.

Проверка в терминале:
```
flutter --version
flutter doctor
```
`flutter doctor` подскажет, чего не хватает (обычно — Android Studio для эмулятора, или включить режим разработчика на телефоне).

### 2. Установить VS Code
https://code.visualstudio.com/download

Открыть VS Code → вкладка Extensions (Ctrl+Shift+X) → поставить:
- **Dart**
- **Flutter**
- **Russian Language Pack** (для русского интерфейса самого VS Code)

### 3. Открыть проект
File → Open Folder → выбрать папку `alt_point_test`.

### 4. Поставить зависимости
В терминале VS Code (Ctrl+`):
```
flutter pub get
```

### 5. Запустить
- Подключи телефон по USB с включённой отладкой ИЛИ запусти эмулятор через Android Studio.
- В правом нижнем углу VS Code будет название устройства.
- F5 для запуска, или в терминале: `flutter run`.

## Структура проекта
```
lib/
├── main.dart              — точка входа
├── models/
│   └── dish.dart          — модель блюда
├── data/
│   └── mock_data.dart     — захардкоженные блюда
├── theme/
│   └── app_colors.dart    — цвета
├── widgets/
│   ├── dish_card.dart     — карточка блюда в списке
│   ├── category_selector  — селектор категорий
│   └── app_drawer.dart    — боковое меню
└── screens/
    ├── home_screen.dart   — главный экран
    └── dish_detail_screen.dart — экран блюда
```

## Что доделать
- Заменить картинки с Unsplash на реальные ассеты из Figma (положить в `assets/images/` и поменять `Image.network` на `Image.asset` в `dish_card.dart` и `dish_detail_screen.dart`).
- Подогнать цвета и размеры под точные значения из Figma.
- Сделать корзину (сейчас иконка ничего не делает).
- Сохранение избранного между запусками (например через `shared_preferences`).
