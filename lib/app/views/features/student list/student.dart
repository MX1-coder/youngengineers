import 'package:flutter/material.dart';
import 'package:ye_app/app/views/widgets/drawer.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({super.key});

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        toolbarHeight: 60,
        elevation: 0,
        backgroundColor: Color.fromRGBO(145, 181, 8, 1),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text('Hi'), Text('Deepesh@Youngengineers.org')],
        ),
        actions: [
          IconButton(
            onPressed: () {
              _scaffoldKey.currentState!.openEndDrawer();
            },
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
          )
        ],
      ),
      endDrawer: CustomDrawer(),
      body: SafeArea(
          child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              'Yours Student List',
              style: TextStyle(fontSize: 18, color: Colors.blue.shade900),
            ),
            SizedBox(
              height: 50,
            ),
            CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(
                Icons.person_2_rounded,
                color: Colors.white,
                size: 100,
              ),
              radius: 50,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Sign Up New Student',
              style: TextStyle(fontSize: 25, color: Colors.grey),
            )
          ],
        ),
      )),
    );
  }
}
