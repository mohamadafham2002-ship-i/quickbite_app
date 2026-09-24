import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import 'order_confirmation_screen.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});
  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String _pickupTime = 'ASAP (15 min)';
  String _payment = 'Cash on Pickup';

  final _pickupOptions = ['ASAP (15 min)', 'In 30 minutes', 'In 1 hour'];
  final _paymentOptions = ['Cash on Pickup', 'Campus Card', 'Mobile Wallet'];

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Order Summary', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          ...cart.items.map((ci) => ListTile(
                dense: true,
                title: Text(ci.item.name),
                trailing: Text('x${ci.quantity}  Rs. ${ci.subtotal.toStringAsFixed(0)}'),
              )),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Subtotal', style: TextStyle(fontSize: 16)),
              Text('Rs. ${cart.subtotal.toStringAsFixed(0)}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 24),
          const Text('Pickup Time', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ..._pickupOptions.map((opt) => RadioListTile<String>(
                title: Text(opt),
                value: opt,
                groupValue: _pickupTime,
                onChanged: (v) => setState(() => _pickupTime = v!),
              )),
          const SizedBox(height: 16),
          const Text('Payment Method', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ..._paymentOptions.map((opt) => RadioListTile<String>(
                title: Text(opt),
                value: opt,
                groupValue: _payment,
                onChanged: (v) => setState(() => _payment = v!),
              )),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => OrderConfirmationScreen(pickupTime: _pickupTime, paymentMethod: _payment)),
                );
              },
              child: const Padding(padding: EdgeInsets.all(14), child: Text('Place Order')),
            ),
          ),
        ],
      ),
    );
  }
}
