import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/menu_item.dart';

class FoodImage extends StatefulWidget {
  final MenuItem item;
  final double? height;
  const FoodImage({super.key, required this.item, this.height});

  @override
  State<FoodImage> createState() => _FoodImageState();
}

class _FoodImageState extends State<FoodImage> {
  String? _url;
  bool _failed = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final cat = widget.item.photoCategory;
    if (cat == null) {
      setState(() => _failed = true);
      return;
    }
    try {
      final res = await http
          .get(Uri.parse('https://foodish-api.com/api/images/$cat'))
          .timeout(const Duration(seconds: 6));
      if (res.statusCode == 200) {
        final data = json.decode(res.body);
        setState(() => _url = data['image']);
      } else {
        setState(() => _failed = true);
      }
    } catch (_) {
      setState(() => _failed = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.item;

    if (_url != null) {
      return Image.network(
        _url!,
        height: widget.height,
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => _iconFallback(item),
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return Container(
            height: widget.height,
            color: item.color.withOpacity(0.1),
            child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
          );
        },
      );
    }

    if (_failed) return _iconFallback(item);

    // still loading the API call
    return Container(
      height: widget.height,
      color: item.color.withOpacity(0.1),
      child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
    );
  }

  Widget _iconFallback(MenuItem item) {
    return Container(
      height: widget.height,
      width: double.infinity,
      color: item.color.withOpacity(0.15),
      child: Icon(item.icon, size: widget.height != null && widget.height! > 100 ? 90 : 48, color: item.color),
    );
  }
}
