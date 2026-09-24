import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';
import '../providers/cart_provider.dart';
import 'order_tracking_screen.dart';
import 'main_nav_screen.dart';

class OrderConfirmationScreen extends StatelessWidget {
  final String pickupTime;
  final String paymentMethod;
  const OrderConfirmationScreen({super.key, required this.pickupTime, required this.paymentMethod});

  @override
  Widget build(BuildContext context) {
    final orderId = 'QB${1000 + Random().nextInt(9000)}';
    return Scaffold(
      appBar: AppBar(title: const Text('Order Confirmed'), automaticallyImplyLeading: false),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle, color: Colors.green, size: 72),
              const SizedBox(height: 16),
              Text('Order #$orderId', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text('Pickup: $pickupTime'),
              Text('Payment: $paymentMethod'),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  context.read<CartProvider>().clearCart();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => OrderTrackingScreen(orderId: orderId)),
                    (route) => false,
                  );
                },
                child: const Text('Track Order'),
              ),
              TextButton(
                onPressed: () {
                  context.read<CartProvider>().clearCart();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const MainNavScreen()),
                    (route) => false,
                  );
                },
                child: const Text('Back to Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
