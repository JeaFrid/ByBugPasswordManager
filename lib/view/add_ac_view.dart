import 'package:bybugpm/page/home.dart';
import 'package:bybugpm/services/add_item.dart';
import 'package:bybugpm/services/get_site.dart';
import 'package:bybugpm/theme/color.dart';
import 'package:bybugpm/variables/textediting.dart';
import 'package:cosmos/cosmos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget addAccountView(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        padding: const EdgeInsets.all(20),
        width: width(context) < 600 ? widthPercentage(context, 0.8) : 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: bg,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Yeni Bir Hesap Ekleyin",
                  style: TextStyle(
                    color: textColor,
                    fontSize: 14,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close,
                    size: 15,
                    color: textColor,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Sitede kullandığınız şifreyi kaydettiğinizden emin olun.",
                    style: TextStyle(
                      color: textColor.withOpacity(0.7),
                      fontSize: 12,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              width:
                  (width(context) < 600 ? widthPercentage(context, 0.8) : 400) -
                      30,
              padding: const EdgeInsets.only(
                right: 8,
                left: 8,
                top: 4,
                bottom: 6,
              ),
              margin: const EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: textColor.withOpacity(0.1),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Icon(
                      Icons.link,
                      color: textColor.withOpacity(0.5),
                      size: 18,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: TextField(
                        controller: siteNew,
                        style: GoogleFonts.ubuntu(
                          color: textColor.withOpacity(0.9),
                          fontSize: 14,
                        ),
                        cursorColor: defaultColor,
                        decoration: InputDecoration(
                          isDense: true,
                          border: InputBorder.none,
                          errorBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          contentPadding: const EdgeInsets.all(0),
                          hintStyle: GoogleFonts.ubuntu(
                            color: textColor.withOpacity(0.5),
                            fontSize: 14,
                          ),
                          hintText: "Site URL",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width:
                  (width(context) < 600 ? widthPercentage(context, 0.8) : 400) -
                      30,
              padding: const EdgeInsets.only(
                right: 8,
                left: 8,
                top: 4,
                bottom: 6,
              ),
              margin: const EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: textColor.withOpacity(0.1),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Icon(
                      Icons.alternate_email_outlined,
                      color: textColor.withOpacity(0.5),
                      size: 18,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: TextField(
                        controller: emailNew,
                        style: GoogleFonts.ubuntu(
                          color: textColor.withOpacity(0.9),
                          fontSize: 14,
                        ),
                        cursorColor: defaultColor,
                        decoration: InputDecoration(
                          isDense: true,
                          border: InputBorder.none,
                          errorBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          contentPadding: const EdgeInsets.all(0),
                          hintStyle: GoogleFonts.ubuntu(
                            color: textColor.withOpacity(0.5),
                            fontSize: 14,
                          ),
                          hintText: "E-Posta",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width:
                  (width(context) < 600 ? widthPercentage(context, 0.8) : 400) -
                      30,
              padding: const EdgeInsets.only(
                right: 8,
                left: 8,
                top: 4,
                bottom: 6,
              ),
              margin: const EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: textColor.withOpacity(0.1),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Icon(
                      Icons.key_outlined,
                      color: textColor.withOpacity(0.5),
                      size: 18,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: TextField(
                        controller: passwordNew,
                        style: GoogleFonts.ubuntu(
                          color: textColor.withOpacity(0.9),
                          fontSize: 14,
                        ),
                        cursorColor: defaultColor,
                        decoration: InputDecoration(
                          isDense: true,
                          border: InputBorder.none,
                          errorBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          contentPadding: const EdgeInsets.all(0),
                          hintStyle: GoogleFonts.ubuntu(
                            color: textColor.withOpacity(0.5),
                            fontSize: 14,
                          ),
                          hintText: "Parola",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () async {
                    await addItem(context);
                  },
                  borderRadius: BorderRadius.circular(10),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Kaydet",
                      style: TextStyle(
                        color: textColor.withOpacity(0.7),
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}
