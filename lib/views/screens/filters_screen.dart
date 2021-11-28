import 'package:flutter/material.dart';
import 'package:meals/views/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var isGlutenFree = false;
  var isVegan = false;
  var isVegetarian = false;
  var isLactoseFree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _glutenFilter(),
                _veganFilter(),
                _vegetarianFilter(),
                _lactoseFreeFilter(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _filterEntry(String title, String description, bool current,
      Function(bool) onChangedCallback) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: current,
      onChanged: onChangedCallback,
    );
  }

  Widget _glutenFilter() {
    return _filterEntry(
        'gluten free',
        'no gluten ',
        isGlutenFree,
        (value) => setState(() {
              isGlutenFree = value;
            }));
  }

  Widget _veganFilter() {
    return _filterEntry(
        'vegan',
        'vegan ',
        isVegan,
        (value) => setState(() {
              isVegan = value;
            }));
  }

  Widget _vegetarianFilter() {
    return _filterEntry(
        'vegetarian',
        'vegetarian ',
        isVegetarian,
        (value) => setState(() {
              isVegetarian = value;
            }));
  }

  Widget _lactoseFreeFilter() {
    return _filterEntry(
        'lactose free',
        'lactose free ',
        isLactoseFree,
        (value) => setState(() {
              isLactoseFree = value;
            }));
  }
}
