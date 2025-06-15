import 'package:flutter/material.dart';
import 'package:pretium/screens/login_screen.dart';
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
      "icon": "assets/icons/wallet_1.png",
    },
    {
      "title": "Pay Bills",
      "subtitle": "Pay for utility services and earn rewards",
      "buttontext": "Get Started",
      "icon": "assets/icons/invoice.png",
    },
  ];

  void nextPage(){
    if(currentPage < onboardingPages.length - 1){
      controller.nextPage(
        duration: const Duration(milliseconds: 300), 
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen())  
      );
    }
  }
  
  @override
  void initState() {
    super.initState();
    buttontext = onboardingPages[0]['buttontext']!;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context, 
                      MaterialPageRoute(builder: (context) => const LoginScreen())
                    );
                  },
                  child: Text(
                    'Skip',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                    ),
                  ),
                ),
              ),
              Spacer(),
              Expanded(
                child: PageView.builder(
                  controller: controller,
                  itemCount: onboardingPages.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                      buttontext = onboardingPages[index]['buttontext']!;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(  
                            borderRadius: BorderRadius.circular(50),
                            color: Theme.of(context).primaryColor.withAlpha(100)
                          ),
                          padding: EdgeInsets.all(20),
                          child: Image.asset(
                            onboardingPages[index]['icon']!,
                            width: 60,
                            height: 60,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        const SizedBox(height: 15,),
                        Text(
                          onboardingPages[index]['title']!,
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyLarge?.color,
                            fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 15,),
                        Text(
                          onboardingPages[index]['subtitle']!,
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyMedium?.color,
                            fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                          ),
                        )
                      ],
                    );
                  }
                ),
              ),
              Spacer(),
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
                  expansionFactor: 4,
                ),
              ),
          
              //button
              const SizedBox(height: 25,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: nextPage, 
                  style: Theme.of(context).elevatedButtonTheme.style,
                  child: Text(
                    buttontext,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}