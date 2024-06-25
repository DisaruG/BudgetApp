import 'package:budget/dashboard_page.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  OnboardingPageState createState() => OnboardingPageState();
}

class OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Widget> _onboardingPages = [
    const OnboardingScreen(
      imagePath: 'lib/assets/trackexpense.png', // Add your image assets
      title: 'Track Your Expenses',
      description: 'Easily keep track of where your money goes with detailed reports and insights.',
    ),
    const OnboardingScreen(
      imagePath: 'lib/assets/budgetplan.png',
      title: 'Set Budget Goals',
      description: 'Create budget goals to help you save money and avoid overspending.',
    ),
    const OnboardingScreen(
      imagePath: 'lib/assets/steal.png',
      title: 'Secure and Private',
      description: 'Your data is secure with industry-standard encryption and privacy measures.',
    ),
  ];

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: _onboardingPages,
          ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _onboardingPages.length,
                    (index) => _buildDot(index),
              ),
            ),
          ),
          if (_currentPage == _onboardingPages.length - 1)
            Positioned(
              bottom: 30,
              right: 20,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DashboardPage()));
                  // Navigate to the next page (login or main app)
                },
                child: const Text('Get Started'),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildDot(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.blue : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const OnboardingScreen({super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
