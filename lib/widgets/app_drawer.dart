import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/orders_screen.dart';
import '../screens/user_products_screen.dart';
import '../providers/auth.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(title: Text("Hello Friens"),
          automaticallyImplyLeading: false,
            ),
          Divider(),
        //Shop list tile
        ListTile(
          leading: Icon(Icons.shop),
          title: Text('SHOP'),
          onTap: () => Navigator.of(context).pushReplacementNamed('/'),
          ),
          Divider(),
          //Orders List tile
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('ORDERS'),
            onTap: () => Navigator.of(context).pushReplacementNamed(OrderScreen.routName),
          ),
          Divider(),
          //Manage Products tile
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('MANAGE PRODUCTS'),
            onTap: () => Navigator.of(context).pushReplacementNamed(UserProductsScreen.routeName),
          ),
          Divider(),
          //Logout tile
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('LOGOUT'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/');
              Provider.of<Auth>(context , listen: false).logout();
            },
          ),
        ],
      ),
    );
  }
}
