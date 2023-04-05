import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:utstpm/home_page.dart';
import 'package:utstpm/login_page.dart';

class Trapesium extends StatefulWidget {
  @override
  State<Trapesium> createState() => _Trapesium();
}

class _Trapesium extends State<Trapesium> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final sisiAController = TextEditingController();
    final sisiBController = TextEditingController();
    final miringController = TextEditingController();
    final tinggiController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Trapesium'),
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
                    'Trapesium',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Menghitung luas dan keliling trapesium',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade700),
                  ),
                  Padding(padding: EdgeInsets.only(top: 20)),
                  TextFormField(
                    controller: sisiAController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Nilai sisi a",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Sisi atas belum terisi';
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                  ),
                  TextFormField(
                    controller: sisiBController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Nilai sisi B",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Sisi Bawah belum terisi';
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                  ),
                  TextFormField(
                    controller: miringController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Nilai sisi miring",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Sisi Miring belum terisi';
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                  ),
                  TextFormField(
                    controller: tinggiController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Nilai sisi T",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Sisi Tinggi belum terisi';
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        double sisiA = double.parse(sisiAController.text);
                        double sisiB = double.parse(sisiBController.text);
                        double miring = double.parse(miringController.text);
                        double tinggi = double.parse(tinggiController.text);
                        double keliling = sisiA + sisiB + miring * 2;
                        double luas = 0.5 * (tinggi * (sisiA + sisiB));

                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Hasil'),
                            content:
                                Text('Luas : $luas\n keliling : $keliling'),
                            actions: <Widget>[
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Ok'),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    child: Text('Hitung'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => LoginPage()),
              (Route<dynamic> route) => false);
        },
      ),
    );
  }
}
