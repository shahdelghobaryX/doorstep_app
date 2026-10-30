import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/gradient_button.dart';
import 'login_screen.dart';


const double kManOverlap = 30;   
const double kManShiftX = 0.17; 


class GettingStartedScreen extends StatelessWidget {
  const GettingStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(gradient: AppColors.gradient),
        child: Column(
          children: [
            Expanded(
              child: FractionalTranslation(
                translation: const Offset(kManShiftX, 0),
                child: Transform.translate(
                  offset: const Offset(0, kManOverlap),
                  child: SizedBox.expand(
                    child: Image.asset(
                      'assets/images/Dilveryman.png',
                      fit: BoxFit.contain,
                      alignment: Alignment.bottomCenter,
                      errorBuilder: (c, e, s) => const Center(
                        child: Icon(Icons.broken_image,
                            color: Colors.white, size: 40),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(28, 0, 28, 24),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 16,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textDark,
                          height: 1.15,
                        ),
                        children: [
                          TextSpan(text: 'Quick Delivery at\nyour '),
                          TextSpan(
                            text: 'Doorstep',
                            style: TextStyle(color: AppColors.red),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Home delivery and online reservation\nsystem for restaurants and cafe',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 11, color: AppColors.grey),
                    ),
                    const SizedBox(height: 20),
                    GradientButton(
                      text: 'Get Started',
                      width: 170,
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginScreen()),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}