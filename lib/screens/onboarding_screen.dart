import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();
  int currentPage = 0;
  String buttontext = "";

  final List<Map<String, String>> onboardingPages = [
    {
      "title": "Direct Pay",
      "subtitle": "Pay with crypto across Africa effortlessly",
      "buttontext": "Next",
      "icon": "assets/icons/credit-card.png",
    },
    {
      "title": "Accept Payments",
      "subtitle": "Accept stablecoin payments hassle-free",
      "buttontext": "Next",
      "icon": "assets/icons/waller_1.png",
    },
    {
      "title": "Pay Bills",
      "subtitle": "Pay for utility services and earn rewards",
      "buttontext": "Get Started",
      "icon": "assets/icons/invoice.png",
    },
  ];

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
            child: PageView.builder(
              controller: controller,
              itemCount: onboardingPages.length,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                  buttontext = onboardingPages[index][buttontext]!;
                });
              },
              itemBuilder: (context, index) {
                return Column(
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
                        onboardingPages[index]['icon']!,
                        width: 60,
                        height: 60,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Text(
                      onboardingPages[index]['title']!,
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                        fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                      ),
                    ),
                    Text(
                      onboardingPages[index]['subtitle']!,
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodySmall?.color,
                        fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
                      ),
                    )
                  ],
                );
              }
            ),
          ),
          // smooth screen indicator
          const SizedBox(height: 16,),
          SmoothPageIndicator(
            controller: controller, // You can use a PageController to control the page indicator
            count: onboardingPages.length, // Number of onboarding pages
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
              buttontext,
            )
          ),
        ],
      ),
    );
  }
}