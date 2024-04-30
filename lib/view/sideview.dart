import 'package:bybugpm/theme/color.dart';
import 'package:bybugpm/variables/value.dart';
import 'package:cosmos/cosmos.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

SizedBox side(BuildContext context) {
  return SizedBox(
    width: 250,
    child: Container(
      height: height(context) - 50,
      margin: const EdgeInsets.only(
        left: 10,
        right: 5,
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
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  "Tüm Hesaplar",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.ubuntu(
                    color: textColor,
                    fontSize: 14,
                    height: 0.8,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          ValueListenableBuilder(
            valueListenable: accounts,
            builder: (context, value, child) {
              return Column(children: value);
            },
          ),
        ],
      ),
    ),
  );
}
