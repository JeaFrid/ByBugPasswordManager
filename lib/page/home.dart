import 'package:bybugpm/page/schema.dart';
import 'package:bybugpm/services/get_data.dart';
import 'package:bybugpm/variables/value.dart';
import 'package:bybugpm/view/sideview.dart';
import 'package:bybugpm/view/topview.dart';
import 'package:bybugpm/view/pageview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  get() async {}

  @override
  void initState() {
    super.initState();
    setUIAllAccount();
  }

  @override
  Widget build(BuildContext context) {
    return Shcema(
      top: false,
      child: Expanded(
        child: Column(
          children: [
            const SizedBox(height: 8),
            top(context),
            Expanded(
              child: Row(
                children: [
                  side(context),
                  Expanded(
                    child: ValueListenableBuilder(
                      valueListenable: image,
                      builder: (context, value, child) {
                        if (image.value == "" &&
                            timestamp.value == "" &&
                            title.value == "" &&
                            about.value == "" &&
                            link.value == "") {
                          return const SizedBox();
                        } else {
                          return page(
                            context,
                            image.value,
                            timestamp.value,
                            title.value,
                            about.value,
                            link.value,
                            securityText.value,
                            key.value,

                          );
                        }
                      },
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
}
