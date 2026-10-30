import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/gradient_button.dart';
import '../widgets/pizza_image.dart';
import 'item_screen.dart';

class Pizza {
  final String name, image;
  final double price;
  final int calories;
  final double zoom;
  final Alignment focus;

  const Pizza(
    this.name,
    this.image,
    this.price,
    this.calories, {
    this.zoom = 2.4,
    this.focus = Alignment.center,
  });
}


const pizzas = [
  Pizza(
    'Melting Cheese',
    'assets/images/Melting_cheese.png',
    9.47,
    44,
    zoom: 2.1,
    focus: Alignment(0, 0.15),
  ),
  Pizza(
    'Pizza Capricciosa',
    'assets/images/Pizza_capricciosa.png',
    12.55,
    54,
    zoom: 2.4,
    focus: Alignment(0, 0),
  ),
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget _category(String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
            ),
            child: Icon(icon, size: 20, color: AppColors.red),
          ),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 8)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.menu),
                  Container(
                    width: 36,
                    height: 36,
                    decoration: const BoxDecoration(
                      color: AppColors.red,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.search, color: Colors.white, size: 20),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              const Text(
                'Hi Alex',
                style: TextStyle(color: AppColors.red, fontSize: 13),
              ),
              const Text(
                'Find your Delicious Food',
                maxLines: 1,
                softWrap: false,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textDark,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 16),
              Row(children: [
                _category('Italian', Icons.local_pizza),
                _category('Japanese', Icons.set_meal),
              ]),
              const SizedBox(height: 40),
              const Text(
                'Popular',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 190,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: pizzas.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (context, i) => _PizzaCard(pizza: pizzas[i]),
                ),
              ),
              const Spacer(),
              Center(
                child: GradientButton(
                  text: 'ADD TO CART',
                  width: 210,
                  height: 42,
                  radius: 6,
                  onPressed: () {},
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _PizzaCard extends StatelessWidget {
  final Pizza pizza;
  const _PizzaCard({required this.pizza});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => ItemScreen(pizza: pizza)),
      ),
      child: Container(
        width: 135,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.black12),
        ),
        child: Column(
          children: [
            Text(
              pizza.name,
              style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 4),
            Text(
              '${pizza.calories} calories',
              style: const TextStyle(fontSize: 8, color: AppColors.red),
            ),
            const SizedBox(height: 6),
            Expanded(
              child: Center(
                child: PizzaImage(
                  image: pizza.image,
                  size: 100,
                  zoom: pizza.zoom,
                  focus: pizza.focus,
                ),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              '\$${pizza.price.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}