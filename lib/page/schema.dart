import 'package:bybugpm/theme/color.dart';
import 'package:cosmos/cosmos.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:window_manager/window_manager.dart';

class Shcema extends StatefulWidget {
  final Widget child;
  final bool top;
  const Shcema({super.key, required this.child, required this.top});

  @override
  State<Shcema> createState() => _ShcemaState();
}

class _ShcemaState extends State<Shcema> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SizedBox(
        width: width(context),
        height: height(context),
        child: Column(
          children: [
            Visibility(visible: widget.top,
              child: GestureDetector(
                onPanUpdate: (details) {
                  windowManager.startDragging();
                },
                onDoubleTap: () async {
                  await windowManager.isMaximized().then(
                    (value) {
                      if (value == true) {
                        windowManager.unmaximize();
                      } else {
                        windowManager.maximize();
                      }
                    },
                  );
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () async {},
                            child: Text(
                              "ByBug Password Manager",
                              style: GoogleFonts.poppins(
                                color: defaultColor,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              windowManager.minimize();
                            },
                            child: Container(
                              width: 15,
                              height: 15,
                              decoration: const BoxDecoration(
                                color: Colors.green,
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
                              width: 15,
                              height: 15,
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // ignore: prefer_const_constructors
            Expanded(
              child: Column(
                children: [
                  widget.child,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
