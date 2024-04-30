import 'package:bybugpm/theme/color.dart';
import 'package:bybugpm/variables/textediting.dart';
import 'package:bybugpm/variables/value.dart';
import 'package:bybugpm/variables/value.dart' as variables;
import 'package:bybugpm/view/delete_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cosmos/cosmos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Expanded page(BuildContext context, String image, String timestamp,
    String title, String about, String link, String security, String key) {
  return Expanded(
    child: Container(
      height: height(context) - 50,
      margin: const EdgeInsets.only(
        left: 5,
        right: 10,
        bottom: 10,
        top: 5,
      ),
      decoration: BoxDecoration(
        color: navColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(5),
      ),
      child: CosmosBody(
        scrollable: true,
        scrollDirection: Axis.vertical,
        children: [
          const SizedBox(height: 10),
          Opacity(
            opacity: 0.5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Icon(
                  //   Icons.edit,
                  //   color: textColor,
                  //   size: 16,
                  // ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () async {
                      await CosmosAlert.showCustomAlert(
                        context,
                        singleDeleteView(context, key),
                      );
                    },
                    child: Icon(
                      Icons.delete_sweep_outlined,
                      color: textColor,
                      size: 16,
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      variables.image.value = "";
                      variables.timestamp.value = "";
                      variables.title.value = "";
                      variables.about.value = "";
                      variables.link.value = "";
                      variables.securityText.value = "";
                      variables.key.value = "";
                    },
                    child: Icon(
                      Icons.close,
                      color: textColor,
                      size: 16,
                    ),
                  ),
                  const SizedBox(width: 12),
                ],
              ),
            ),
          ),
          image != ""
              ? Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 2,
                        color: defaultColor,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 200,
                        errorWidget: (context, url, error) =>
                            const SizedBox(height: 20),
                      ),
                    ),
                  ),
                )
              : const SizedBox(height: 20),
          Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                child: Text(
                  timestamp,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.ubuntu(
                    color: textColor.withOpacity(0.4),
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: SizedBox(
              width: double.infinity,
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.ubuntu(
                  color: defaultColor,
                  fontSize: 20,
                  height: 0.8,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  Text(
                    security,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.ubuntu(
                      color: security == "Güvenli" ? Colors.green : Colors.red,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 5),
                  CosmosInfo(
                    margin: const EdgeInsets.symmetric(horizontal: 100),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: bg,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    message: security == "Güvenli"
                        ? "Bu site SSL sertifikasına sahip ve güvenli gibi görünüyor."
                        : "Bu site, SSL sertifikasını doğrulayamıyor. Bu da güvenli olmayabilir demek ve verilerinizi riske atabilieceği anlamına geliyor. Lütfen dikkatli olun!",
                    child: Icon(
                      Icons.info_outline,
                      color: security == "Güvenli" ? Colors.green : Colors.red,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: SizedBox(
              width: double.infinity,
              child: Text(
                about,
                style: GoogleFonts.ubuntu(
                  color: textColor.withOpacity(0.5),
                  fontSize: 14,
                  height: 1.2,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              openUrl(link);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 10,
              ),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  link,
                  style: GoogleFonts.ubuntu(
                    color: Colors.blue.withOpacity(0.5),
                    fontSize: 14,
                    height: 1.2,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 300,
                      padding: const EdgeInsets.only(
                        right: 8,
                        left: 8,
                        top: 4,
                        bottom: 6,
                      ),
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
                                controller: email,
                                style: GoogleFonts.ubuntu(
                                  color: textColor.withOpacity(0.9),
                                  fontSize: 14,
                                ),
                                readOnly: true,
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
                    const SizedBox(height: 5),
                    Container(
                      width: 300,
                      padding: const EdgeInsets.only(
                        right: 8,
                        left: 8,
                        top: 4,
                        bottom: 6,
                      ),
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
                              child: ValueListenableBuilder(
                                valueListenable: privPassword,
                                builder: (BuildContext context, dynamic value,
                                    Widget? child) {
                                  return TextField(
                                    controller: password,
                                    readOnly: true,
                                    obscureText: !value,
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
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(width: 6),
                          GestureDetector(
                            onTap: () {
                              if (privPassword.value == true) {
                                privPassword.value = false;
                              } else {
                                privPassword.value = true;
                              }
                              // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
                              privPassword.notifyListeners();
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2),
                              child: ValueListenableBuilder(
                                valueListenable: privPassword,
                                builder: (BuildContext context, dynamic value,
                                    Widget? child) {
                                  return Icon(
                                    value == false
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: textColor.withOpacity(0.5),
                                    size: 18,
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
