import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            'Skip',
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(  
                    borderRadius: BorderRadius.circular(36),
                    color: Theme.of(context).primaryColor.withAlpha(100)
                  ),
                  padding: EdgeInsets.all(10),
                  child: Image.asset(
                    'assets/icons/wallet_1/png',
                    width: 60,
                    height: 60,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Text(
                  'Accept Payments',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                    fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                  ),
                ),
                Text(
                  'Accept stablecoin payments hassle-free',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodySmall?.color,
                    fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
                  ),
                )
              ],
            ),
          ),
          // smooth screen indicator
          const SizedBox(height: 16,),
          SmoothPageIndicator(
            controller: controller, // You can use a PageController to control the page indicator
            count: 3, // Number of onboarding pages
            effect: ExpandingDotsEffect(
              dotColor: Colors.grey,
              activeDotColor: Theme.of(context).primaryColor,
              dotHeight: 8,
              dotWidth: 8,
            ),
          ),

          //button
          const SizedBox(height: 16,),
          ElevatedButton(
            onPressed: (){}, 
            child: Text(
              'Next',
            )
          ),
        ],
      ),
    );
  }
}