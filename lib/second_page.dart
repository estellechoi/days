import 'package:days/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Second Page'),
    ),
    body: Center(
      child: Column(
        children: <Widget>[
          WillPopScope(
            child: const Text('Content'), 
            onWillPop: () async => false
          ),
          ElevatedButton(
            child: const Text('Go back'),
            onPressed: () {
              Navigator.pop(context);
            }, 
          ),
          ElevatedButton(
            child: const Text('Go home'),
            onPressed: () {
              // Navigator.popUntil(context, (route) => route.isFirst);
              Navigator.popUntil(context, ModalRoute.withName('Home'));
            },
          ),
          ElevatedButton(
            child: const Text('Open modal'),
            onPressed: () {
              Navigator.push(context, 
                CupertinoPageRoute(
                  fullscreenDialog: true,
                  builder: (_) => const MyHomePage(title: '??')
                )
              );
            },
          )
        ]
      )
    ),
  );
}
