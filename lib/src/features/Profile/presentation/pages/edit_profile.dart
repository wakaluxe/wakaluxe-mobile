import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class EditProfile extends StatelessWidget {
const EditProfile({ super.key });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: const Center(
        child: Text('EditProfile'),
      ),
    );
  }
}