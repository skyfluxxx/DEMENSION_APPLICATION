import 'package:demension_application/home.dart';
import 'package:demension_application/medications.dart';
import 'package:demension_application/activity/activity.dart';
import 'package:demension_application/diary/diary.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Demension());
}

class Demension extends StatelessWidget {
  const Demension({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
      ),
      debugShowCheckedModeBanner: false,
      home: const RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  String _currentDate = '';
  String _currentTime = '';
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _updateDateTime();
  }

  void _updateDateTime() {
    final now = DateTime.now().toUtc().add(
          const Duration(hours: 8),
        );
    final dateFormat = DateFormat.yMMMMd();
    final timeFormat = DateFormat('h:mm a');

    setState(() {
      _currentDate = dateFormat.format(now);
      _currentTime = timeFormat.format(now);
    });
  }

  final List<Widget> _pages = const [
    HomePage(),
    Medication(),
    Activity(),
    Diary(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff5ba2f4),
        title: const Text(
          'Demension',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                _currentDate,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                _currentTime,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              ),
              const SizedBox(width: 20),
            ],
          ),
        ],
        elevation: 0,
      ),
      body: _pages[_currentPage],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('Floating Action Button');
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(
            icon: Icon(
              Icons.home_outlined,
              color: _currentPage == 0 ? Colors.blue : Colors.black,
            ),
            selectedIcon: const Icon(
              Icons.home_filled,
              color: Colors.blue,
            ),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.local_hospital_outlined,
              color: _currentPage == 1 ? Colors.blue : Colors.black,
            ),
            selectedIcon: const Icon(
              Icons.local_hospital,
              color: Colors.blue,
            ),
            label: 'Medications',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.local_activity_outlined,
              color: _currentPage == 2 ? Colors.blue : Colors.black,
            ),
            selectedIcon: const Icon(
              Icons.local_activity,
              color: Colors.blue,
            ),
            label: 'Activity',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.book_outlined,
              color: _currentPage == 3 ? Colors.blue : Colors.black,
            ),
            selectedIcon: const Icon(
              Icons.book,
              color: Colors.blue,
            ),
            label: 'Diary',
          ),
        ],
        onDestinationSelected: (int index) {
          setState(() {
            _currentPage = index;
          });
        },
        selectedIndex: _currentPage,
      ),
    );
  }
}
