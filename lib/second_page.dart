import 'package:days/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'controller/count_controller.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final countController = Get.isRegistered<CountController>() ? Get.put<CountController>(CountController()) : null;
    
    // the controller is created on the memory when the controller is used, no when the code is executed
    // but not needed if dependency injection is used on routes in main.dart
    // Get.lazyPut<CountController>(() => CountController());
    // Get.putAsync<CountController>(() async => await CountController());

    String? id = Get.parameters["id"];
    String? name = Get.arguments["name"];

    // skip this, since static CountController get to => Get.find<CountController>();
    // final countController = Get.find<CountController>();

    // detect the state is changed and apply it to the screen
    // for non-responsive state, use GetBuilder
    // Widget countText = GetBuilder<CountController>(builder: (controller) {
    //   return Text(
    //     '${controller.count}',
    //     style: Theme.of(context).textTheme.headlineMedium,
    //   );
    // });

    // responsive state
    Widget countText = Obx(() => Text(
        '${CountController.to.count.value}',
        style: Theme.of(context).textTheme.headlineMedium,
      ));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            countText,
            ElevatedButton(
              onPressed: CountController.to.increment, 
              child: const Text('Increment'),
            ),
            WillPopScope(
              child: const Text('Content'), 
              onWillPop: () async => false
            ),
            ElevatedButton(
              child: const Text('Go back'),
              onPressed: () {
                Get.back();
                // Navigator.pop(context);
              }, 
            ),
            ElevatedButton(
              child: const Text('Go home'),
              onPressed: () {
                // Navigator.popUntil(context, (route) => route.isFirst);
                // Navigator.popUntil(context, ModalRoute.withName('Home'));
                Get.until((route) => Get.currentRoute == '/');
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
}
