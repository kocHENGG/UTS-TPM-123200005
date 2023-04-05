import 'package:flutter/material.dart';
import 'package:utstpm/login_page.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class Kalender extends StatefulWidget {
  @override
  State<Kalender> createState() => _Kalender();
}

class _Kalender extends State<Kalender> {
  String tanggal = "";
  String waktu = "";
  String zona = 'WIB';

  @override
  void initState() {
    super.initState();
    updateTime();
  }

  void updateTime() {
    var now = DateTime.now().toUtc();
    switch (zona) {
      case 'WIB':
        now = now.add(Duration(hours: 7));
        break;
      case 'WITA':
        now = now.add(Duration(hours: 8));
        break;
      case 'WIT':
        now = now.add(Duration(hours: 9));
        break;
      default:
        break;
    }
    var formatter = DateFormat('HH:mm:ss');
    setState(() {
      waktu = formatter.format(now);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalender'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SafeArea(
                child: TableCalendar(
              firstDay: DateTime.utc(1, 1, 1),
              lastDay: DateTime.utc(3000, 12, 30),
              focusedDay: DateTime.now(),
            )),
            SizedBox(
              height: 10.0,
            ),
            Text(
              '$waktu',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      zona = 'WIB';
                    });
                    updateTime();
                  },
                  child: Text(
                    'WIB',
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      zona = 'WITA';
                    });
                    updateTime();
                  },
                  child: Text('WITA'),
                ),
                SizedBox(
                  width: 10.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      zona = 'WIT';
                    });
                    updateTime();
                  },
                  child: Text('WIT'),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      }),
    );
  }
}
