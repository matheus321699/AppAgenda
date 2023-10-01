import 'package:flutter/material.dart';


class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget _createItem(IconData icon, String label, Function() onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        label,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(10, 20, 20, 20),
            color: Colors.orange[400],
            alignment: Alignment.bottomRight,
            child: Text(
              '',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 20),
          _createItem(
            Icons.info,
            'Informações',
            () => {}
          ),
          _createItem(
            Icons.settings,
            'Configurações',
            () => {}
          ),
        ],
      ),
    );
  }
}
