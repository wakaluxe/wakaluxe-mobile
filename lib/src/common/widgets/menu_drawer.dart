import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: const <Widget>[
            
          ],
        ),
      ),
    );
  }
}
