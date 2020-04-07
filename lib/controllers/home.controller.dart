import 'package:flutter/widgets.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class HomeController extends ChangeNotifier {
  HomeController() {
    initOneSignal();
  }

  void initOneSignal() {
    OneSignal.shared.init("e382cbd3-3b11-4706-a5e3-1a2944ea61bf");
  }
}
