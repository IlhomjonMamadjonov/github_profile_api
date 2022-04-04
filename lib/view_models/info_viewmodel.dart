import 'package:architecture_github/models/user_model.dart';
import 'package:architecture_github/services/http_service.dart';
import 'package:flutter/cupertino.dart';

class InfoViewModel extends ChangeNotifier {
  User user = User();
  bool isLoading = false;

  Future apiLoadUser() async {
    isLoading = true;
    notifyListeners();

    var users = await Network.GET(Network.API_USER, {});
    if (users != null) {
      user = Network.parseUser(users);
      isLoading = false;
    }
    notifyListeners();
  }
}
