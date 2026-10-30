import 'package:flutter/material.dart';

class PizzaImage extends StatelessWidget {
  final String image;
  final double size;

  
  final double zoom;

  
  final Alignment focus;

  const PizzaImage({
    super.key,
    required this.image,
    required this.size,
    this.zoom = 2.4,
    this.focus = Alignment.center,
  });

  @override
  Widget build(BuildContext context) {
    final big = size * zoom;
    return SizedBox(
      width: size,
      height: size,
      child: ClipOval(
        child: OverflowBox(
          alignment: focus,
          minWidth: big,
          maxWidth: big,
          minHeight: big,
          maxHeight: big,
          child: Image.asset(
            image,
            width: big,
            height: big,
            cacheWidth: (big * 2).round(),
            fit: BoxFit.cover,
            errorBuilder: (context, error, stack) {
              debugPrint('PizzaImage error loading $image: $error');
              return Container(
                color: Colors.red.shade100,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8),
                child: Text(
                  size > 150 ? '$error' : 'Cannot load',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 9, color: Colors.black87),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}