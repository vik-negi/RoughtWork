import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn30/utils/routes.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  final String imgUrl = "";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: EdgeInsets.zero,
        // color: Colors.black45,
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                arrowColor: Colors.black87,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 34, 58, 99),
                ),
                margin: EdgeInsets.zero,
                accountEmail: const Text("Vikramnnegi175@gmail.com"),
                accountName: const Text('Vikram Negi'),
                currentAccountPicture: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    "assets/images/profile.jpg",
                    width: 150,
                    height: 150,
                  ),
                ),
              ),
            ),
            DrawerItems(
                iconData: CupertinoIcons.home,
                title: 'Home',
                onTapFunc: () =>
                    Navigator.pushNamed(context, MyRoutes.homeRoute)),
            DrawerItems(
              iconData: CupertinoIcons.tv_fill,
              title: 'Movies',
              onTapFunc: () =>
                  Navigator.pushNamed(context, MyRoutes.movieRoutes),
            ),
            const DrawerItems(
              iconData: CupertinoIcons.profile_circled,
              title: 'Profile',
            ),
            const DrawerItems(
              iconData: CupertinoIcons.settings_solid,
              title: 'Setting',
            ),
            const Divider(height: 5, color: Colors.grey),
            const DrawerItems(
              iconData: CupertinoIcons.lock,
              title: 'logout',
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerItems extends StatelessWidget {
  const DrawerItems({
    Key? key,
    required this.title,
    required this.iconData,
    this.onTapFunc,
  }) : super(key: key);
  final String title;
  final IconData iconData;
  final Function? onTapFunc;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onTapFunc != null) {
          onTapFunc!();
        }
      },
      child: ListTile(
        leading: Icon(
          iconData,
          color: (title == "logout")
              ? Colors.red
              : const Color.fromARGB(255, 34, 58, 99),
        ),
        title: Text(
          title,
          textScaleFactor: 1.2,
          style: TextStyle(
              fontWeight: FontWeight.w400,
              color: (title == "logout") ? Colors.red : Colors.black),
        ),
      ),
    );
  }
}
