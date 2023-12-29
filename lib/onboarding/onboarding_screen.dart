import 'package:flutter/material.dart';
import 'package:rentexl/Drawer/drawer.dart';
import 'package:rentexl/Drawer/drawer_controller.dart';
import 'package:rentexl/view/home.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
   

  PageController _pageController = PageController();
  Widget? screenView;
  DrawerIndex? drawerIndex;
  int _currentPage = 0;

  List<Map<String, String>> onboardingData = [
    {
      'title': 'Welcome to Rentxcel',
      'description':
          'Your one-stop solution for managing your fleet efficiently.',
      'image': 'assets/images/on_boarding1.jpg',
    },
    {
      'title': 'Real-time Chating',
      'description':
          'Track your vehicles in real-time and make data-driven decisions.',
      'image': 'assets/images/on_boarding1.jpg',
    },
    {
      'title': 'Optimize Operations',
      'description':
          'Streamline operations and reduce costs with our powerful features.',
      'image': 'assets/images/on_boarding1.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: onboardingData.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return OnboardingPage(
                title: onboardingData[index]['title']!,
                description: onboardingData[index]['description']!,
                image: onboardingData[index]['image']!,
              );
            },
          ),
          Positioned(
            bottom: 20.0,
            left: 0.0,
            right: 0.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildPageIndicator(),
            ),
          ),
          Positioned(
            bottom: 20.0,
            right: 20.0,
            child: _currentPage == onboardingData.length - 1
                ? ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => NavigationHomeScreen()));
                    },
                    child: Text("Get Started"),
                  )
                : SizedBox(),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < onboardingData.length; i++) {
      indicators.add(_buildPageIndicatorItem(i == _currentPage));
    }
    return indicators;
  }

  Widget _buildPageIndicatorItem(bool isActive) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: isActive ? 12.0 : 8.0,
        height: 8.0,
        decoration: BoxDecoration(
          color: isActive ? Colors.blue : Colors.grey,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  OnboardingPage({
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          image,
          height: 200.0, // Adjust the height as needed
        ),
        SizedBox(height: 20.0),
        Text(
          title,
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
