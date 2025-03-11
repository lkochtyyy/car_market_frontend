import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: OnboardingScreen(),
  ));
}

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  List<Map<String, String>> onboardingData = [
    {
      "image": "assets/pass1.png",
      "title": "Choose a Car",
      "description": "Explore and find the perfect car for you! Browse detailed listings, compare prices, and make the best decision.",
    },
    {
      "image": "assets/pass2.png",
      "title": "Contact Seller",
      "description": "Easily connect with sellers to ask questions, negotiate prices, and finalize your car purchase.",
    },
    {
      "image": "assets/pass3.png",
      "title": "Make a Deal",
      "description": "Secure the best deal and drive away with confidence. Enjoy a seamless car-buying experience!",
    }
  ];

  void nextPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Redirect to home screen when onboarding is finished
      Navigator.pushReplacementNamed(context, '/acceuil');
      print("Onboarding terminé !");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: onboardingData.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) => OnboardingPage(
                image: onboardingData[index]["image"]!,
                title: onboardingData[index]["title"]!,
                description: onboardingData[index]["description"]!,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Skip Button
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/acceuil');
                    print("Skip Pressed");
                  },
                  child: Text("Skip", style: TextStyle(fontSize: 16)),
                ),

                // Dots Indicator
                Row(
                  children: List.generate(
                    onboardingData.length,
                    (index) => buildDot(index),
                  ),
                ),

                // Next Button
                TextButton(
                  onPressed: nextPage,
                  child: Text(
                    _currentPage == 2 ? "Finish" : "Next",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDot(int index) {
    return Container(
      margin: EdgeInsets.only(right: 5),
      height: 8,
      width: _currentPage == index ? 20 : 8,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String image, title, description;

  OnboardingPage({required this.image, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        children: [
          // Image in the top half of the screen
          Container(
            height: screenHeight / 2, // Height is half of the screen
            child: Image.asset(image, fit: BoxFit.cover), // The image fills the container
          ),
          SizedBox(height: 20),
          // Title and description in the bottom half of the screen
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                description,
                style: TextStyle(fontSize: 14, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
