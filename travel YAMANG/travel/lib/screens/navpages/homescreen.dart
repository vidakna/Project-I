import 'package:flutter/material.dart';
import 'package:travel/screens/navpages/detail_page.dart';
import 'package:travel/screens/navpages/home_page.dart';
import 'package:travel/screens/navpages/user_page.dart';
import 'package:travel/screens/navpages/welcome_page.dart';
import 'package:travel/screens/signin.dart';
import 'package:travel/widgets/most_popular.dart';
import 'package:travel/widgets/travel_blog.dart';

import '../../widgets/reusable_widget.dart';

//import 'package:homescreen/widgets/most_popular.dart';
//import 'package:homescreen/widgets/tavel_blog.dart';

class SHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 440),
            child: Icon(
              Icons.menu,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              "Travel Blog",
              style: TextStyle(fontSize: 36),
            ),
          ),
          Expanded(flex: 1, child: TravelBlog()),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Most Popular",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "View All",
                  style: TextStyle(fontSize: 16, color: Colors.deepOrange),
                )
              ],
            ),
          ),
          Expanded(flex: 2, child: MostPopular()),
        ],
      ),
      drawer: const NavigationDrawer(),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) => Material(
      color: Colors.purple.shade700,
      child: InkWell(
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => UserPage(),
            ));
          },
          child: Container(
            padding: EdgeInsets.only(
              top: 24 + MediaQuery.of(context).padding.top,
              bottom: 24,
            ),
            child: Column(
              children: [
                //radius: 52,
                logoWidget("img/logo4.png"),
                // CircleAvatar(
                //   radius: 52,
                //   Image.asset('img/logo3.jpeg'),
                //   // backgroundImage: NetworkImage(
                //   //     'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
                // ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Janeesha Tharani',
                  style: TextStyle(fontSize: 28, color: Colors.white),
                ),
                Text(
                  'janeeshatharani@gameil.com',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          )));

  Widget buildMenuItems(BuildContext context) => Wrap(
        runSpacing: 4,
        children: [
          ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text(
                'Welcome Page',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () =>
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => WelcomePage(),
                  ))),
          ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text(
                'Packages',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailPage(),
                ));
              }),
          ListTile(
            leading: const Icon(Icons.workspaces_outline),
            title: const Text(
              'Categories',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => HomePage(),
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.update),
            title: const Text(
              'Places',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SHomePage(),
              ));
            },
          ),
          const Divider(
            color: Colors.black54,
          ),
          ListTile(
            leading: const Icon(Icons.account_tree_outlined),
            title: const Text(
              'Log Out',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SignInScreen(),
              ));
            },
          ),
        ],
      );
}
