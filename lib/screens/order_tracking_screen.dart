import 'package:flutter/material.dart';
import 'dart:async';

class OrderTrackingScreen extends StatefulWidget {
  final String orderId;
  const OrderTrackingScreen({super.key, required this.orderId});
  @override
  State<OrderTrackingScreen> createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
  int _status = 0; // 0=Placed, 1=Preparing, 2=Ready
  final _labels = ['Placed', 'Preparing', 'Ready for pickup'];
  final _icons = [Icons.receipt_long, Icons.soup_kitchen, Icons.storefront];
  Timer? _t1;
  Timer? _t2;

  @override
  void initState() {
    super.initState();
    _t1 = Timer(const Duration(seconds: 3), () => setState(() => _status = 1));
    _t2 = Timer(const Duration(seconds: 6), () => setState(() => _status = 2));
  }

  @override
  void dispose() {
    _t1?.cancel();
    _t2?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Order #${widget.orderId}')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _status == 2 ? 'Your order is ready!' : 'Preparing your order...',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            ...List.generate(_labels.length, (i) {
              final reached = i <= _status;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: ListTile(
                  leading: Icon(_icons[i], color: reached ? Colors.deepOrange : Colors.grey),
                  title: Text(_labels[i], style: TextStyle(fontWeight: reached ? FontWeight.bold : FontWeight.normal)),
                  trailing: reached ? const Icon(Icons.check_circle, color: Colors.green) : null,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
