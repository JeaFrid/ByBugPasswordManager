import 'dart:io';

import 'package:bybugpm/page/home.dart';
import 'package:bybugpm/services/get_site.dart';
import 'package:bybugpm/theme/color.dart';
import 'package:bybugpm/utils/security.dart';
import 'package:bybugpm/variables/textediting.dart';
import 'package:cosmos/cosmos.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> addItem(BuildContext context) async {
  try {
    Map<String, dynamic> websiteData = await scrapeWebsiteData(siteNew.text);
    SharedPreferences db = await SharedPreferences.getInstance();
    db.setStringList(
      CosmosRandom.randomTag(),
      [
        websiteData["ogImage"] ?? "",
        websiteData["title"] ?? "Bilinmiyor",
        websiteData["description"] ?? "Açıklama yok.",
        siteNew.text,
        emailNew.text,
        passwordNew.text,
        CosmosTime.getNowTimeString(),
        "+",
      ],
    ).then((value) {
      siteNew.clear();
      emailNew.clear();
      passwordNew.clear();
      CosmosNavigator.pushDownFromTopReplacement(
        context,
        const HomePage(),
      );
    });
  } catch (e) {
    try {
      HttpOverrides.global = MyHttpOverrides();
      Map<String, dynamic> websiteData = await scrapeWebsiteData(siteNew.text);
      SharedPreferences db = await SharedPreferences.getInstance();
      db.setStringList(
        CosmosRandom.randomTag(),
        [
          websiteData["ogImage"] ?? "",
          websiteData["title"] ?? "Bilinmiyor",
          websiteData["description"] ?? "Açıklama yok.",
          siteNew.text,
          emailNew.text,
          passwordNew.text,
          CosmosTime.getNowTimeString(),
          "-",
        ],
      ).then((value) {
        siteNew.clear();
        emailNew.clear();
        passwordNew.clear();
        CosmosNavigator.pushDownFromTopReplacement(
          context,
          const HomePage(),
        );
      });
    } catch (e) {
      Navigator.pop(context);
      copy(e.toString());
      CosmosAlert.showMessage(
        context,
        "Oppss...",
        "Bir hata algılandı.\n\n$e",
        backgroundColor: bg,
        color: textColor,
        button: "Tamam",
      );
    }
  }
}
