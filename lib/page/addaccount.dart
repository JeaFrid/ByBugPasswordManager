import 'package:bybugpm/view/add_ac_view.dart';
import 'package:cosmos/cosmos.dart';
import 'package:flutter/material.dart';

void addAccount(BuildContext context) {
  CosmosAlert.showCustomAlert(context, addAccountView(context));
}
