import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0; // Track the selected icon index

  // Titles for each screen
  final List<String> _titles = [
    'Home',
    'Messages',
    'Articles',
    'Settings',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff25364A),
        title: Image.asset(
          'assets/images/logo.png',
          height: 80,
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff25364A), Color(0xff25364A)],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Center(
                child: Text(
                  _titles[_selectedIndex],
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          if (_selectedIndex == 0)
            Positioned(
              top: 100,
              left: 16.0,
              right: 16.0,
              child: Column(
                children: [
                  _buildRectangleBox(""),
                  const SizedBox(height: 16.0),
                  _buildRectangleBox(""),
                  const SizedBox(height: 16.0),
                  _buildRectangleBox(""),
                ],
              ),
            ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Color(0xff25364A),
              width: 2,
            ),
          ),
        ),
        child: BottomAppBar(
          color: Colors.white,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildNavItem(Icons.home, 0),
                _buildNavItem(Icons.message, 1),
                _buildNavItem(Icons.article, 2),
                _buildNavItem(Icons.settings, 3),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    bool isSelected = index == _selectedIndex;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: isSelected ? Colors.red : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: const Color(0xff25364A),
            ),
          ),
          const SizedBox(height: 4.0),
          Text(
            _titles[index],
            style: TextStyle(
              fontSize: 12,
              color: isSelected
                  ? Colors.red
                  : const Color(0xff25364A).withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRectangleBox(String title) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 4,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xff25364A),
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            '',
            style: TextStyle(
              fontSize: 14,
              color: const Color(0xff25364A).withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 8.0),
          Align(
            alignment: Alignment.center,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: const Text(
                'View All',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
