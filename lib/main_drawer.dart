import 'package:flutter/material.dart';
import '../screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget _buildListTile(String label, IconData icon, Function() tapHandler) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        label,
        style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            height: 140,
            color: Theme.of(context).accentColor,
            width: double.infinity,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                  fontSize: 28,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w900),
            ),
            alignment: Alignment.centerLeft,
          ),
          const SizedBox(
            height: 20,
          ),
          _buildListTile('Meals', Icons.no_meals, () {
            Navigator.pushReplacementNamed(context, '/');
          }),
          _buildListTile('Filters', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
          }),
        ],
      ),
    );
  }
}
