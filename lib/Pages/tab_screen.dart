import 'package:delimeals/Pages/categories_screen.dart';
import 'package:delimeals/Pages/favorite_screen.dart';
import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Meals'),
          ),
          bottomNavigationBar: TabBar(
            padding: EdgeInsets.only(left: 7, right: 7, bottom: 4),
            indicator: BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.circular(15)
            ),
            tabs: [
              Tab(icon: Icon(Icons.category), text: 'Categories'),
              Tab(
                icon: Icon(Icons.star),
                text: 'Favorites',
              )
            ],
          ),
          body: const TabBarView(
            children: [
              CategoriesScreen(),
              FavoriteScreen()
            ],
          ),
        ));
  }
}
