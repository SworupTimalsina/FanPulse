import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff25364A),
        title: Image.asset(
          'assets/images/logo.png',
          height: 40, // Adjust height to fit nicely
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Background Gradient
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
                  'Welcome to Your Dashboard',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),

          // Middle Content Section
          Positioned(
            top: 100,
            left: 16.0,
            right: 16.0,
            child: Column(
              children: [
                _buildRectangleBox(""),
                SizedBox(height: 16.0),
                _buildRectangleBox(""),
                SizedBox(height: 16.0),
                _buildRectangleBox(""),
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
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
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
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
    bool isSelected = index == 0; 
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: isSelected ? Colors.red : Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(icon, color: Color(0xff25364A)),
            onPressed: () {
              // Handle icon button action
            },
          ),
        ),
      ],
    );
  }

  Widget _buildRectangleBox(String title) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 4,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xff25364A),
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            '',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xff25364A).withOpacity(0.7),
            ),
          ),
          SizedBox(height: 8.0),
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Text(
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
