import 'package:bybugpm/theme/color.dart';
import 'package:bybugpm/variables/textediting.dart';
import 'package:bybugpm/variables/value.dart' as valuelistenable;
import 'package:cosmos/cosmos.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget item(String image, String title, String subtitle, String id) {
  return GestureDetector(
    onTap: () async {
      SharedPreferences db = await SharedPreferences.getInstance();
      List<String> getData = db.getStringList(id)!;
      email.text = getData[4];
      password.text = getData[5];
      valuelistenable.image.value = getData[0];
      valuelistenable.timestamp.value = getData[6];
      valuelistenable.title.value = getData[1];
      valuelistenable.about.value = getData[2];
      valuelistenable.link.value = getData[3];
      valuelistenable.key.value = id;
      valuelistenable.securtiy.value = getData[7] == "+"
          ? true
          : getData[7] == "-"
              ? false
              : false;

      if (valuelistenable.securtiy.value == true) {
        valuelistenable.securityText.value = "Güvenli";
      } else if (valuelistenable.securtiy.value == false) {
        valuelistenable.securityText.value = "Güvenli Değil";
      }
    },
    child: Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 2,
      ),
      width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: bg,
      ),
      child: Row(
        children: [
          CosmosImage(
            image,
            width: 35,
            height: 35,
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.ubuntu(
                    color: textColor,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.ubuntu(
                    color: textColor.withOpacity(0.5),
                    fontSize: 12,
                    height: 0.8,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
