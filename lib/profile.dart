import 'package:flutter/material.dart';
import 'package:utstpm/login_page.dart';
import 'package:utstpm/detail_profile.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage('img/me.jpg'),
                radius: 100,
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
              ),
              Text(
                "123200005 \n Anis Magfiroh",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
              Padding(padding: EdgeInsets.all(20.0)),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailProfile()));
                  },
                  child: Text('Detail Profil')),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        MaterialPageRoute(builder: (context) => LoginPage());
      }),
    );
  }
}
