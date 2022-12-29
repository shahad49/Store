import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shahadproject/pages/category/products.dart';
import 'category/electronics.dart';
import 'category/jewelery.dart';
import 'category/men clothing.dart';
import 'category/women clothing.dart';


var indexProvider=StateProvider<int>((ref)=>0);

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var index=ref.watch(indexProvider);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.teal),
        backgroundColor: Colors.white,
        elevation: 10,
        title: Text(
          'Store',
          style: TextStyle(
            fontSize: 16,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
              color: Colors.teal
          ),
        ),
        actions:[
          Icon(Icons.search_rounded,
          ),
        ],

      ),
      drawer:Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              buildHeader(context),
              buildMenuItems(context),
            ],
          )),
      ),
      body:IndexedStack(
        index:index,
      children: [
        ProductsPage(),
        ElectronicsPage(),
        JeweleryPage(),
        WomenClothingPage(),
        MensClothingPage()
      ],
      ) ,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: index,
        onTap: (int index) {
          ref.read(indexProvider.state).state=index;
        },
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.teal.withOpacity(0.6),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.phonelink_sharp),
            label: 'Electronic ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.diamond),
            label: 'Jewelery ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.woman),
            label: 'Women ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.man),
            label: ' Men ',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.account_circle),
          //   label: 'Profile',
          // ),
        ],
      ),
    );
  }
}



Widget buildHeader(BuildContext context) => Container(
  padding: EdgeInsets.only(
    top: MediaQuery.of(context).padding.top,
  ),
  color: Colors.teal,
  height: 200,
  width: MediaQuery.of(context).size.width,
  child: Column(
    children: [
      CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(
            'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bWFufGVufDB8fDB8fA%3D%3D&w=1000&q=80',
          )
      ),
      SizedBox(
        height: 12,
      ),
      Text(
        'Matthew',
        style: TextStyle(fontSize: 25, color: Colors.white),
      ),
      Text(
        'Matthew@gmail.com',
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    ],
  ),
);

Widget buildMenuItems(BuildContext context) => Padding(
  padding: const EdgeInsets.all(10.0),
  child: Column(
    children: [
      ListTile(
        leading: const Icon(Icons.home),
        title: Text('Home'),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(Icons.favorite),
        title: Text('Favorite'),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(Icons.shopping_cart),
        title: Text('Basket'),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(Icons.notification_important),
        title: Text('Notification'),
        onTap: () {},
      ),
      Container(
        height: 0.5,
        width: MediaQuery.of(context).size.width,
        color: Colors.black54,),
      ListTile(
        leading: const Icon(Icons.settings),
        title: Text('Settings'),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(Icons.help),
        title: Text('Help'),
        onTap: () {},
      ),
    ],
  ),
);

