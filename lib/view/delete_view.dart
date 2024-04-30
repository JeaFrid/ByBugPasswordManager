import 'package:bybugpm/page/home.dart';
import 'package:bybugpm/theme/color.dart';
import 'package:cosmos/cosmos.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget singleDeleteView(BuildContext context, String key) {
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
          children: [
            Row(
              children: [
                Text(
                  "Hesabı Sil",
                  style: TextStyle(
                    color: textColor,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Bu hesabı sonsuza kadar silmek istediğinize emin misiniz? Bu işlem geri alınamaz.",
                    style: TextStyle(
                      color: textColor.withOpacity(0.7),
                      fontSize: 12,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () async {
                    Navigator.pop(context);
                    CosmosAlert.loadingIOS(context, color: textColor);
                    SharedPreferences db =
                        await SharedPreferences.getInstance();
                    db.remove(key).then((value) {
                      CosmosNavigator.pushDownFromTopReplacement(
                          context, const HomePage());
                      CosmosAlert.showMessage(
                        context,
                        "Hesabı sildik.",
                        "Hesabınızı ByBug Password Manager uygulamasından kaldırdık. Verilerinizi uzak sunucularımızda saklamıyoruz. Hesaplarınız, cihazınızın yerel veritabanında saklanmaktadır. Az önce silmiş olduğunuz hesap, veritabanından sonsuza kadar silindi.",
                        backgroundColor: bg,
                        color: textColor,
                        button: "Tamam",
                      );
                    });
                  },
                  borderRadius: BorderRadius.circular(10),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Evet, eminim. Sil!",
                      style: TextStyle(
                        color: Colors.red,
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
