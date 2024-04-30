import 'package:bybugpm/page/addaccount.dart';
import 'package:bybugpm/theme/color.dart';
import 'package:bybugpm/utils/search.dart';
import 'package:bybugpm/variables/textediting.dart';
import 'package:bybugpm/view/all_delete_view.dart';
import 'package:cosmos/cosmos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:window_manager/window_manager.dart';

GestureDetector top(BuildContext context) {
  return GestureDetector(
    onPanUpdate: (details) {
      windowManager.startDragging();
    },
    child: Container(
      //margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Colors.transparent,
        //  borderRadius: BorderRadius.circular(10),
      ),
      width: width(context),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Text(
            "ByBug Password Manager",
            style: GoogleFonts.poppins(
              color: defaultColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 18),
          Expanded(
            child: Container(
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
                      Icons.search,
                      color: textColor.withOpacity(0.5),
                      size: 18,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: TextField(
                        controller: searchBar,
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
                            hintText: "Hesaplar arasında ara..."),
                        onChanged: (value) {
                          setSearch();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 18),
          Icon(
            Icons.archive_outlined,
            color: textColor.withOpacity(0.5),
            size: 20,
          ),
          const SizedBox(width: 10),
          Icon(
            Icons.find_replace_sharp,
            color: textColor.withOpacity(0.5),
            size: 20,
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              CosmosAlert.showCustomAlert(context, allDeleteView(context));
            },
            child: Icon(
              Icons.folder_delete_sharp,
              color: textColor.withOpacity(0.5),
              size: 20,
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () async {
              addAccount(context);
            },
            child: Opacity(
              opacity: 0.7,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: navColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 8),
                    Text(
                      "Yeni Hesap",
                      style: GoogleFonts.poppins(
                        color: textColor,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Icon(
                      Icons.add,
                      color: textColor,
                      size: 16,
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 30),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  windowManager.minimize();
                },
                child: Container(
                  width: 18,
                  height: 18,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 56, 151, 59),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              const SizedBox(width: 5),
              GestureDetector(
                onTap: () {
                  windowManager.close();
                },
                child: Container(
                  width: 18,
                  height: 18,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
        ],
      ),
    ),
  );
}
