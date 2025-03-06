import 'dart:math'; // For sqrt to calculate magnitude

import 'package:fanpulse/core/common/snackbar/my_snackbar.dart';
import 'package:fanpulse/features/home/presentation/view_model/home_cubit.dart';
import 'package:fanpulse/features/home/presentation/view_model/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sensors_plus/sensors_plus.dart'; // Import for accelerometer

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final bool _isDarkTheme = false;
  final double _shakeThreshold = 15.0; // The threshold for shake intensity
  final List<double> _accelerometerValues = []; // To store accelerometer values

  @override
  void initState() {
    super.initState();

    // Listen to the user accelerometer events
    userAccelerometerEvents.listen((UserAccelerometerEvent event) {
      double magnitude =
          sqrt(pow(event.x, 2) + pow(event.y, 2) + pow(event.z, 2));

      if (magnitude > _shakeThreshold) {
        _onShake();
      }
    });
  }

  // Function to handle the shake event (logging out)
  void _onShake() {
    showMySnackBar(
      context: context,
      message: 'Logging out...',
      color: Colors.red,
    );
    context.read<HomeCubit>().logout(context); // Call logout method
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50, // Light blue background
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        backgroundColor: const Color(0xff25364A), // Blue AppBar
        foregroundColor: Colors.white, // White text and icons
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            color: Colors.white, // Icon color
            onPressed: () {
              showMySnackBar(
                context: context,
                message: 'Logging out...',
                color: Colors.red,
              );
              context
                  .read<HomeCubit>()
                  .logout(context); // Call logout on button press
            },
          ),
          Switch(
            value: _isDarkTheme,
            onChanged: (value) {
              // Handle theme switch
            },
            activeColor: Colors.white, // Switch thumb color
            activeTrackColor: const Color(0xff212121), // Switch track color
          ),
        ],
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return state.views.elementAt(state
              .selectedIndex); // Displaying the view based on selected index
        },
      ),
      bottomNavigationBar: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Container(
            color: Colors.blue, // Ensures blue background
            child: BottomNavigationBar(
              type:
                  BottomNavigationBarType.fixed, // Prevents background override
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard),
                  label: 'Dashboard',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.book),
                  label: 'Article',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.group),
                  label: 'Messages',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle),
                  label: 'Account',
                ),
              ],
              backgroundColor:
                  const Color(0xff25364A), // Sets navbar background
              currentIndex: state.selectedIndex,
              selectedItemColor: Colors.white, // White for selected item
              unselectedItemColor:
                  Colors.white70, // Light white for unselected items
              onTap: (index) {
                context.read<HomeCubit>().onTabTapped(index);
              },
            ),
          );
        },
      ),
    );
  }
}
