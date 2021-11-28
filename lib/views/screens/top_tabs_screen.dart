import 'package:flutter/material.dart';
import 'package:meals/services/data_service.dart';
import 'package:meals/views/screens/categories_screen.dart';

import 'favorites_screen.dart';

class TopTabsScreen extends StatefulWidget {
  final DataService dataService;
  const TopTabsScreen({Key? key, required this.dataService}) : super(key: key);

  @override
  _TopTabsScreenState createState() => _TopTabsScreenState();
}

class _TopTabsScreenState extends State<TopTabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Meals'),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'Favorites',
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          CategoriesScreen(),
          FavoritesScreen( dataService: widget.dataService),
        ],),
      ),
    );
  }
}


