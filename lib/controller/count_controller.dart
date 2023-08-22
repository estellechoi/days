import 'package:get/get.dart';

// class CountController extends GetxService  is alternative for permanent state
class CountController extends GetxController {
  static CountController get to => Get.find<CountController>();

  // .obs makes it responsive state, so don't need to call update()
  RxInt count = 0.obs;

  void increment() {
    // count.value++;
    count(count.value + 1);
    // update();
  }

  // When the controller is created, it is called.
  @override
  void onInit() {
    super.onInit();

    // workers
    once(count, (state) {
      print('once : $state was updated for the first time.');
    });
    
    ever(count, (state) {
      print('ever : $state was updated.');
    });

    debounce(count, (state) {
      print('debounce : debounced $state was upated.');
    }, time: const Duration(seconds: 1));

    interval(count, (state) {
      print('interval : $state was updated.');
    }, time: const Duration(seconds: 1));
  }

  // When the controller is removed from the memory, it is called
  @override
  void onClose() {
    super.onClose();
  }
}