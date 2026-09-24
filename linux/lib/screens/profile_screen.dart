import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _name = 'Jane Student';

  final _orders = const [
    {'id': 'QB4521', 'status': 'Ready for pickup', 'total': 'Rs. 650'},
    {'id': 'QB3390', 'status': 'Completed', 'total': 'Rs. 380'},
    {'id': 'QB2187', 'status': 'Completed', 'total': 'Rs. 500'},
  ];

  void _editName() {
    final controller = TextEditingController(text: _name);
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Edit Name'),
        content: TextField(controller: controller, decoration: const InputDecoration(border: OutlineInputBorder())),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () {
              setState(() => _name = controller.text.trim().isEmpty ? _name : controller.text.trim());
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  Color _statusColor(String status) {
    switch (status) {
      case 'Ready for pickup':
        return Colors.green;
      case 'Preparing':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40)),
          const SizedBox(height: 12),
          Center(
            child: Column(
              children: [
                Text(_name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                TextButton.icon(onPressed: _editName, icon: const Icon(Icons.edit, size: 16), label: const Text('Edit name')),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text('Order History', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const Divider(),
          ..._orders.map((o) => ListTile(
                leading: CircleAvatar(backgroundColor: _statusColor(o['status']!).withOpacity(0.15), child: Icon(Icons.receipt_long, color: _statusColor(o['status']!))),
                title: Text(o['id']!),
                subtitle: Text(o['status']!),
                trailing: Text(o['total']!, style: const TextStyle(fontWeight: FontWeight.bold)),
              )),
        ],
      ),
    );
  }
}
