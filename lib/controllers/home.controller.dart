import 'package:flutter/widgets.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends ChangeNotifier {
  HomeController() {
    initOneSignal();
  }

  void initOneSignal() {
    OneSignal.shared.init("e382cbd3-3b11-4706-a5e3-1a2944ea61bf");
  }

  Future<bool> usuarioLogado() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool response = sharedPreferences.containsKey("usuario");

    print(sharedPreferences.get("usuario"));

    return response;
  }
}
