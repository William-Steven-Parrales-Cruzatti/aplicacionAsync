import 'package:flutter/material.dart';

import 'services/mockapi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});1

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Asincronía en Flutter',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 54, 54, 54),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color.fromARGB(255, 94, 94, 94),
        ),
      ),
      home: const PracticaAsync(title: 'Asincronía en Flutter'),
    );
  }
}

class PracticaAsync extends StatefulWidget {
  const PracticaAsync({super.key, required this.title});

  final String title;

  @override
  State<PracticaAsync> createState() => _PracticaAsyncState();
}

class _PracticaAsyncState extends State<PracticaAsync> {
  //DECLARACIONES DE VARIABLES
  int rayo = 0;
  int rayo_time = 0;
  double rayo_with = 0;
  int rayo_text = 0;

  int medio = 0;
  int medio_time = 0;
  double medio_bar_with = 0;
  int medio_text = 0;

  int lento = 0;
  int lento_time = 0;
  double lento_bar_with = 0;
  int lento_text = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
          child: Container(
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Ink(
              decoration: ShapeDecoration(
                color: Colors.green.shade900,
                shape: const CircleBorder(),
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.flash_on,
                  color: Colors.white,
                ),
                iconSize: 50.0,
                onPressed: () async {
                  setState(() {
                    rayo_with = 300;
                    rayo_time = 1;
                  });
                  rayo = await MockApi().getFerrariInteger();
                  setState(() {
                    rayo_text = rayo;
                    rayo_time = 0;
                    rayo_with = 0;
                  });
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: AnimatedContainer(
                  width: rayo_with,
                  height: 15,
                  decoration: BoxDecoration(color: Colors.green.shade900),
                  duration: Duration(seconds: rayo_time)),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: Text(
                rayo.toString(),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            Ink(
              decoration: ShapeDecoration(
                color: Colors.orange.shade700,
                shape: const CircleBorder(),
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.airport_shuttle,
                  color: Colors.white,
                ),
                iconSize: 50.0,
                onPressed: () async {
                  setState(() {
                    medio_bar_with = 300;
                    medio_time = 3;
                  });
                  medio = await MockApi().getHyundaiInteger();
                  setState(() {
                    medio_text = medio;
                    medio_time = 0;
                    medio_bar_with = 0;
                  });
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: AnimatedContainer(
                  width: medio_bar_with,
                  height: 15,
                  decoration: BoxDecoration(color: Colors.orange.shade700),
                  duration: Duration(seconds: medio_time)),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: Text(
                medio.toString(),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            Ink(
              decoration: ShapeDecoration(
                color: Colors.redAccent.shade700,
                shape: const CircleBorder(),
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.directions_walk,
                  color: Colors.white,
                ),
                iconSize: 50.0,
                onPressed: () async {
                  setState(() {
                    lento_bar_with = 300;
                    lento_time = 10;
                  });
                  lento = await MockApi().getFisherPriceInteger();
                  setState(() {
                    lento_text = lento;
                    lento_time = 0;
                    lento_bar_with = 0;
                  });
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: AnimatedContainer(
                  width: lento_bar_with,
                  height: 15,
                  decoration: BoxDecoration(color: Colors.redAccent.shade700),
                  duration: Duration(seconds: lento_time)),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Text(
                lento.toString(),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
