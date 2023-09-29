import 'package:flutter/material.dart';
import 'package:kordi_mobile/home_page.dart';
import 'package:kordi_mobile/kordi_router.dart';

class KordiScaffold extends StatelessWidget {
  const KordiScaffold({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text('Kordi Mobile')),
            ListTile(
              title: Text('Home'),
              onTap: () {
                HomePageRoute().go(context);
              },
            ),
            ListTile(
              title: Text('About'),
              onTap: () {
                Navigator.of(context).pushNamed('/about');
              },
            ),
          ],
        ),
      ),
      body: child,
    );
  }
}
