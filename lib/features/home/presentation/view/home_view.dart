import 'package:fanpulse/core/common/snackbar/my_snackbar.dart';
import 'package:fanpulse/features/home/presentation/view_model/home_cubit.dart';
import 'package:fanpulse/features/home/presentation/view_model/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  final bool _isDarkTheme = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50, // Light blue background
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        backgroundColor: Color(0xff25364A), // Blue AppBar
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
              context.read<HomeCubit>().logout(context);
            },
          ),
          Switch(
            value: _isDarkTheme,
            onChanged: (value) {
              // Handle theme switch
            },
            activeColor: Colors.white, // Switch thumb color
            activeTrackColor: Color(0xff212121), // Switch track color
          ),
        ],
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return state.views.elementAt(state.selectedIndex);
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
              backgroundColor: Color(0xff25364A), // Sets navbar background
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
