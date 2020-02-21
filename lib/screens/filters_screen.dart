import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  Widget _buildSwitchListTile(String title, String description, bool currentValue, Function updateValue ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Filter'),
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection.',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _buildSwitchListTile('Gluten-Free', 'Only include gluten-free meals', _glutenFree, (newValue){
                    setState(() {
                      _glutenFree = newValue;
                    });
                  }),
                  _buildSwitchListTile('Lactose-Free', 'Only include lactose-free meals', _lactoseFree, (newValue){
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  }),
                  _buildSwitchListTile('Vegetarian-Free', 'Only include vegetarian-free meals', _vegetarian, (newValue){
                    setState(() {
                      _vegetarian = newValue;
                    });
                  }),
                  _buildSwitchListTile('Vegan-Free', 'Only include vegan-free meals', _vegan, (newValue){
                    setState(() {
                      _vegan = newValue;
                    });
                  })
                ],
              ),
            ),
          ],
        ));
  }
}
