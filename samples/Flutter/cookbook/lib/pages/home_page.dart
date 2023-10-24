import 'package:cookbook/pages/images/image_page.dart';
import 'package:cookbook/pages/lists/grid_page.dart';
import 'package:cookbook/pages/lists/horizontal_list_page.dart';
import 'package:cookbook/pages/lists/item_list_page.dart';
import 'package:cookbook/pages/lists/long_list_page.dart';
import 'package:cookbook/pages/navigation/hero_page.dart';
import 'package:cookbook/pages/navigation/navigation_page.dart';
import 'package:cookbook/pages/navigation/todo_page.dart';
import 'package:cookbook/pages/networking/network_page.dart';
import 'package:flutter/material.dart';
import 'package:cookbook/pages/lists/list_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  ListTile _buildTile(BuildContext context, IconData icon,String title, Widget widget) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('cookbook'),
      ),
      body: ListView(
        children: [
          _buildTile(context, Icons.image, 'image', const ImagePage()),
          _buildTile(context, Icons.navigation, 'navigation', const NavigationPage()),
          _buildTile(context, Icons.navigation_outlined, 'hero', const HeroPage()),
          _buildTile(context, Icons.assistant_navigation, 'todo', TodoPage()),
          _buildTile(context, Icons.list, 'list', const ListPage()),
          _buildTile(context, Icons.horizontal_distribute, 'horizontal list', const HorizontalListPage()),
          _buildTile(context, Icons.list_alt, 'grid list', const GridPage()),
          _buildTile(context, Icons.line_style, 'item list', ItemListPage()),
          _buildTile(context, Icons.receipt_long, 'long list', LongListPage()),
          _buildTile(context, Icons.network_wifi, 'networking', const NetworkPage()),
        ],
      ),
    );
  }
}
