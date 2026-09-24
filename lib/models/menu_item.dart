import 'package:flutter/material.dart';

class MenuItem {
  final String id;
  final String name;
  final String category; // Meals, Beverages, Snacks
  final double price;
  final String? photoCategory; // maps to a real-photo API category, if available
  final IconData icon; // fallback icon (used for items with no photo match, e.g. drinks)
  final Color color;

  MenuItem({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    this.photoCategory,
    required this.icon,
    required this.color,
  });
}

final List<MenuItem> sampleMenu = [
  MenuItem(id: '1', name: 'Chicken Rice', category: 'Meals', price: 350, photoCategory: 'rice', icon: Icons.rice_bowl, color: Colors.orange),
  MenuItem(id: '2', name: 'Veg Kottu', category: 'Meals', price: 300, photoCategory: 'biryani', icon: Icons.ramen_dining, color: Colors.deepOrange),
  MenuItem(id: '3', name: 'Iced Coffee', category: 'Beverages', price: 150, photoCategory: null, icon: Icons.coffee, color: Colors.brown),
  MenuItem(id: '4', name: 'Fresh Juice', category: 'Beverages', price: 180, photoCategory: null, icon: Icons.local_drink, color: Colors.amber),
  MenuItem(id: '5', name: 'Samosa', category: 'Snacks', price: 80, photoCategory: 'samosa', icon: Icons.bakery_dining, color: Colors.red),
  MenuItem(id: '6', name: 'French Fries', category: 'Snacks', price: 250, photoCategory: 'burger', icon: Icons.fastfood, color: Colors.amber),
];
