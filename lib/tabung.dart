import 'dart:math';

import 'package:flutter/material.dart';
import 'package:utstpm/bangun_datar.dart';
import 'package:utstpm/login_page.dart';

class Tabung extends StatefulWidget {
  @override
  State<Tabung> createState() => _Tabung();
}

class _Tabung extends State<Tabung> {
  final formKey = GlobalKey<FormState>();
  final jarijari = TextEditingController();
  final tinggi = TextEditingController();
  final phi = 3.14;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tabung'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Tabung',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Menghitung luas & keliling tabung',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade700),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 10)),
                  TextFormField(
                    controller: jarijari,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'jari -jari',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'jari - jari belum terisi';
                      }
                      return null;
                    },
                  ),
                  Padding(padding: EdgeInsets.only(top: 20)),
                  TextFormField(
                    controller: tinggi,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'tinggi',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'tinggi belum terisi';
                      }
                      return null;
                    },
                  ),
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          double r = double.parse(jarijari.text);
                          double t = double.parse(tinggi.text);
                          double keliling = 2 * phi * r;
                          double luas = (2 * phi * r * t) + (2 * phi * (r * t));
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text('Hasil'),
                                    content: Text(
                                        'Luas : $luas \n keliling : $keliling'),
                                    actions: <Widget>[
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('Ok'))
                                    ],
                                  ));
                        }
                      },
                      child: Text('Hitung'))
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => LoginPage(),
              ),
              (Route<dynamic> route) => false);
        },
      ),
    );
  }
}
