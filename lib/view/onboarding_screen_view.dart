import 'package:flutter/material.dart';

import 'login_screen_view.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      'title': 'Your Ultimate Hub for Sports',
      'description':
          'Never miss a moment! Track live scores, watch highlights, and follow real-time updates.',
      'image': 'assets/images/onboard1.png',
    },
    {
      'title': '"Stay Updated with Live Scores',
      'description':
          'Get alerts for matches, scores, and news that matter most to you.',
      'image': 'assets/images/onboard2.png',
    },
    {
      'title': 'Live Chats',
      'description':
          'Join live chats, share your opinions, and be part of the action!.',
      'image': 'assets/images/onboard3.png',
    },
  ];

  void _onDone() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(), // Redirect to login screen
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff25364A),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: _onboardingData.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      _onboardingData[index]['image']!,
                      height: 250,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      _onboardingData[index]['title']!,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Text(
                        _onboardingData[index]['description']!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 16, color: Colors.white70),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () =>
                      _pageController.jumpToPage(_onboardingData.length - 1),
                  child: const Text(
                    'Skip',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                Row(
                  children: List.generate(
                    _onboardingData.length,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentPage == index
                            ? Colors.white
                            : Colors.white70,
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: _currentPage == _onboardingData.length - 1
                      ? _onDone
                      : () => _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          ),
                  child: Text(
                    _currentPage == _onboardingData.length - 1
                        ? 'Done'
                        : 'Next',
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
