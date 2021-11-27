import 'package:flutter/material.dart';
import 'package:meals/routs/routs.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            decoration:
                BoxDecoration(color: Theme.of(context).colorScheme.secondary),
            child: Text(
              'Cooking up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: Theme.of(context).textTheme.headline6!.color,
                fontSize: 30,
              ),
            ),
          ),
          const SizedBox(height: 20),
          _buildListTile(
            Icons.restaurant,
            'Meals',
            () => Navigator.pushNamed(context, Routs.tabsScreen),
          ),
          _buildListTile(
            Icons.settings,
            'Filters',
            () => Navigator.pushNamed(context, Routs.filters),
          ),
        ],
      ),
    );
  }

  ListTile _buildListTile(IconData icon, String title, VoidCallback tapHandler) {
    return ListTile(
      onTap: tapHandler,
      leading: Icon(
        icon,
        size: 20,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
