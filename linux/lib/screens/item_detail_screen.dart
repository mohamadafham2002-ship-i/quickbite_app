import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/menu_item.dart';
import '../providers/cart_provider.dart';

class ItemDetailScreen extends StatefulWidget {
  final MenuItem item;
  const ItemDetailScreen({super.key, required this.item});
  @override
  State<ItemDetailScreen> createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  int _qty = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.item.name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(borderRadius: BorderRadius.circular(12), child: Image.network(widget.item.imageUrl, height: 200, width: double.infinity, fit: BoxFit.cover)),
            const SizedBox(height: 16),
            Text(widget.item.name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Text('Rs. ${widget.item.price.toStringAsFixed(0)}', style: const TextStyle(fontSize: 18, color: Colors.deepOrange)),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text('Quantity:'),
                IconButton(onPressed: () => setState(() => _qty = _qty > 1 ? _qty - 1 : 1), icon: const Icon(Icons.remove_circle_outline)),
                Text('$_qty', style: const TextStyle(fontSize: 18)),
                IconButton(onPressed: () => setState(() => _qty++), icon: const Icon(Icons.add_circle_outline)),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  context.read<CartProvider>().addToCart(widget.item, _qty);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Added to cart')));
                  Navigator.pop(context);
                },
                child: const Padding(padding: EdgeInsets.all(14), child: Text('Add to Cart')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
