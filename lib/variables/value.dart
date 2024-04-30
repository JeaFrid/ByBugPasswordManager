import 'package:flutter/cupertino.dart';

//String
ValueNotifier<String> image = ValueNotifier("");
ValueNotifier<String> timestamp = ValueNotifier("");
ValueNotifier<String> title = ValueNotifier("");
ValueNotifier<String> about = ValueNotifier("");
ValueNotifier<String> link = ValueNotifier("");
ValueNotifier<String> key = ValueNotifier("");
ValueNotifier<String> securityText = ValueNotifier("");


//List Widget
ValueNotifier<List<Widget>> accounts = ValueNotifier([]);
ValueNotifier<List> accountsFilter = ValueNotifier([]);
ValueNotifier<List> dataList = ValueNotifier([]);

//Bool
ValueNotifier<bool> privPassword = ValueNotifier(false);
ValueNotifier<bool> securtiy = ValueNotifier(false);


