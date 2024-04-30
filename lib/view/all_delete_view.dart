import 'package:bybugpm/page/home.dart';
import 'package:bybugpm/theme/color.dart';
import 'package:cosmos/cosmos.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget allDeleteView(BuildContext context) {
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
                  "Tüm verileri sil!",
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
                    "Tüm veriler, sonsuza dek silinecek ve uygulama ilk yüklediğiniz hale getirilecek. Bu konuda ciddi olduğunuzdan emin olun çünkü bu işlem geri alınamaz. Emin misiniz?",
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
                    db.clear().then((value) {
                      CosmosNavigator.pushDownFromTopReplacement(
                          context, const HomePage());
                      CosmosAlert.showMessage(
                        context,
                        "Tüm veriler silindi.",
                        "Sistemde varolan tüm verilerinizi temizledik. ByBug Password Manager olarak sizin hesap verilerinizi toplamayız ve yerel veritabanınızda saklarız. Az önce veritabanınızı sıfırladık. O veriler artık kurtarılamaz.",
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
