import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/gradient_button.dart';
import '../widgets/pizza_image.dart';
import 'home_screen.dart';

class ItemScreen extends StatefulWidget {
  final Pizza pizza;
  const ItemScreen({super.key, required this.pizza});

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  int qty = 1;

  Widget _roundBtn(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: AppColors.red,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Icon(icon, color: Colors.white, size: 14),
      ),
    );
  }

  Widget _stat(Widget icon, String text) {
    return Row(children: [
      icon,
      const SizedBox(width: 4),
      Text(text, style: const TextStyle(fontSize: 11)),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final p = widget.pizza;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.arrow_back_ios_new, size: 18),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              Text(
                p.name,
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 4),
              Text(
                '\$${p.price.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 24),
              Container(
                width: 240,
                height: 240,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 30,
                      offset: Offset(0, 16),
                    ),
                  ],
                ),
                child: PizzaImage(
                  image: p.image,
                  size: 240,
                  zoom: p.zoom,
                  focus: p.focus,
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _roundBtn(Icons.remove, () {
                    if (qty > 1) setState(() => qty--);
                  }),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text('$qty', style: const TextStyle(fontSize: 13)),
                  ),
                  _roundBtn(Icons.add, () => setState(() => qty++)),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                '\$${(p.price * qty).toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 12, color: AppColors.grey),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _stat(const Icon(Icons.star, color: Colors.amber, size: 16), '4.9'),
                  _stat(
                    const Icon(Icons.local_fire_department,
                        color: Colors.orange, size: 16),
                    '${p.calories} Calories',
                  ),
                  _stat(
                    const Icon(Icons.timer_outlined, color: Colors.blue, size: 16),
                    '20 - 30 min',
                  ),
                ],
              ),
              const Spacer(),
              GradientButton(
                text: 'ADD TO CART',
                width: 210,
                height: 42,
                radius: 6,
                onPressed: () {},
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}