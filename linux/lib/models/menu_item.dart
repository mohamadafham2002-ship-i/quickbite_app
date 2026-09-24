class MenuItem {
  final String id;
  final String name;
  final String category; // Meals, Beverages, Snacks
  final double price;
  final String imageUrl;

  MenuItem({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.imageUrl,
  });
}

final List<MenuItem> sampleMenu = [
  MenuItem(id: '1', name: 'Chicken Rice', category: 'Meals', price: 350, imageUrl: 'https://picsum.photos/seed/rice/200'),
  MenuItem(id: '2', name: 'Veg Kottu', category: 'Meals', price: 300, imageUrl: 'https://picsum.photos/seed/kottu/200'),
  MenuItem(id: '3', name: 'Iced Coffee', category: 'Beverages', price: 150, imageUrl: 'https://picsum.photos/seed/coffee/200'),
  MenuItem(id: '4', name: 'Fresh Juice', category: 'Beverages', price: 180, imageUrl: 'https://picsum.photos/seed/juice/200'),
  MenuItem(id: '5', name: 'Samosa', category: 'Snacks', price: 80, imageUrl: 'https://picsum.photos/seed/samosa/200'),
  MenuItem(id: '6', name: 'French Fries', category: 'Snacks', price: 250, imageUrl: 'https://picsum.photos/seed/fries/200'),
];
