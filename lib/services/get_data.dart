import 'package:bybugpm/variables/value.dart';
import 'package:bybugpm/widget/item.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<List> getDataInDatabase() async {
  SharedPreferences db = await SharedPreferences.getInstance();
  if ([].toString() == db.getKeys().toList().toString()) {
    return [];
  } else {
    return db.getKeys().toList();
  }
}

Future<void> setUIAllAccount() async {
  List<Widget> widgetList = [];
  SharedPreferences db = await SharedPreferences.getInstance();
  List allData = await getDataInDatabase();
  if (allData != []) {
    for (String element in allData) {
      List<String> gotData = db.getStringList(element)!;
      List sendElement = gotData;
      sendElement.add(element);
      dataList.value.add(sendElement);
      widgetList.add(
        item(
          getImage(gotData[3]),
          gotData[1],
          gotData[4],
          element,
        ),
      );
    }
    accounts.value = widgetList;
    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
    accounts.notifyListeners();
  }
}

String getImage(String link) {
  if (link.contains("youtube")) {
    return "assets/youtube.png";
  } else if (link.contains("ea")) {
    return "assets/electronics-arts.png";
  } else if (link.contains("mail.google")) {
    return "assets/gmail.png";
  } else if (link.contains("drive")) {
    return "assets/google-drive.png";
  } else if (link.contains("pay")) {
    return "assets/google-pay.png";
  } else if (link.contains("google")) {
    return "assets/google.png";
  } else if (link.contains("map")) {
    return "assets/map.png";
  } else if (link.contains("microsoft")) {
    return "assets/microsoft.png";
  } else if (link.contains("netflix")) {
    return "assets/netflix.png";
  } else if (link.contains("xbox")) {
    return "assets/xbox.png";
  } else if (link.contains("youtube")) {
    return "assets/youtube.png";
  } else if (link.contains("steam")) {
    return "assets/Steam_Logo.png";
  } else if (link.contains("bybug")) {
    return "assets/logo-classic.png";
  } else {
    return "assets/passmanager_512.jpg";
  }
}
