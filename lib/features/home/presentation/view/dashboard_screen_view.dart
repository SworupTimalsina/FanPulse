import 'package:fanpulse/core/common/snackbar/my_snackbar.dart';
import 'package:fanpulse/features/home/presentation/view_model/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(SportsBlogApp());
}

class SportsBlogApp extends StatelessWidget {
  const SportsBlogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    ArticlesScreen(),
    MessagesScreen(),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'FanPulse',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff25364A),
        centerTitle: true,
        actions: [
          Switch(
            value: false,
            onChanged: (value) {
              // Change theme
              // setState(() {
              //   _isDarkTheme = value;
              // });
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: () {
              // Logout code
              showMySnackBar(
                context: context,
                message: 'Logging out...',
                color: Colors.red,
              );

              context.read<HomeCubit>().logout(context);
            },
          ),
        ],
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.article), label: 'Articles'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xff25364A),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

// 🏠 Home Screen - Displays Featured News & Live Scores
class HomeScreen extends StatelessWidget {
  final List<String> featuredArticles = [
    "🏀 NBA Finals: The Ultimate Showdown!",
    "⚽ Messi's Magical Night in the Champions League",
    "🏈 Super Bowl Preview: What to Expect",
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "🏆 Featured News",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          ...featuredArticles.map((article) => Card(
                child: ListTile(
                  title: Text(article,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {},
                ),
              )),
          SizedBox(height: 20),
          Text(
            "🔥 Live Scores",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Card(
            color: Colors.green[100],
            child: ListTile(
              title: Text("⚽ Real Madrid 2 - 1 Barcelona"),
              subtitle: Text("La Liga - 78' min"),
            ),
          ),
          Card(
            color: Colors.orange[100],
            child: ListTile(
              title: Text("🏀 Lakers 101 - 98 Warriors"),
              subtitle: Text("NBA Playoffs - 4th Qtr"),
            ),
          ),
        ],
      ),
    );
  }
}

// 📰 Articles Screen - Displays Sports Blog Posts
class ArticlesScreen extends StatelessWidget {
  final List<Map<String, String>> articles = [
    {"title": "🏏 Cricket World Cup: Who Will Win?", "author": "John Doe"},
    {"title": "⚽ Top 5 Football Players in 2024", "author": "Jane Smith"},
    {"title": "🏀 NBA Draft 2024: Rising Stars", "author": "Mike Johnson"},
    {
      "title": "🎾 Wimbledon: A Look at This Year's Contenders",
      "author": "Emma Williams"
    },
  ];

  ArticlesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(articles[index]['title']!,
                style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text("By ${articles[index]['author']}"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
        );
      },
    );
  }
}

// 💬 Messages Screen - Placeholder for Fan Chat
class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "🚀 Chat Feature Coming Soon!",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}

// ⚙️ Settings Screen
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        ListTile(
          leading: Icon(Icons.notifications),
          title: Text("Notifications"),
          trailing: Switch(value: true, onChanged: (value) {}),
        ),
        ListTile(
          leading: Icon(Icons.dark_mode),
          title: Text("Dark Mode"),
          trailing: Switch(value: false, onChanged: (value) {}),
        ),
        ListTile(
          leading: Icon(Icons.info),
          title: Text("About"),
          onTap: () {
            showAboutDialog(
              context: context,
              applicationName: "Sports Blog App",
              applicationVersion: "1.0.0",
              applicationLegalese: "© 2025 Sports Blog Inc.",
            );
          },
        ),
      ],
    );
  }
}
