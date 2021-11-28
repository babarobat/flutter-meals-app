import 'package:flutter/material.dart';
import 'package:meals/services/data_service.dart';
import 'package:meals/views/screens/favorites_screen.dart';
import 'package:meals/views/widgets/main_drawer.dart';

import 'categories_screen.dart';

class BottomTabsScreen extends StatefulWidget {
  final DataService dataService;

  const BottomTabsScreen({Key? key, required this.dataService})
      : super(key: key);

  @override
  _TopTabsScreenState createState() => _TopTabsScreenState();
}

class _TopTabsScreenState extends State<BottomTabsScreen> {
  List<Map<String, Object>> _map = [];

  int _selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _map = <Map<String, Object>>[
      {
        'page': const CategoriesScreen(),
        'name': 'Categories',
      },
      {
        'page': FavoritesScreen(dataService: widget.dataService),
        'name': 'Favorites',
      },
    ];
  }

  Widget _body() {
    return _map[_selectedTabIndex]['page'] as Widget;
  }

  Widget _title() {
    return Text(_map[_selectedTabIndex]['name'] as String);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      body: _body(),
      drawer: const MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        selectedItemColor: Theme.of(context).primaryColor,
        currentIndex: _selectedTabIndex,
        onTap: _onTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }

  void _onTap(int value) {
    setState(() {
      _selectedTabIndex = value;
    });
  }
}
