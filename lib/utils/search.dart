import 'package:bybugpm/services/get_data.dart';
import 'package:bybugpm/variables/textediting.dart';
import 'package:bybugpm/variables/value.dart';
import 'package:bybugpm/widget/item.dart';

void setSearch() {
//websiteData["ogImage"],
//websiteData["title"],
//websiteData["description"],
//siteNew.text,
//emailNew.text,
//passwordNew.text,
//CosmosTime.getNowTimeString(),
  accountsFilter.value = dataList.value.where((row) {
    return row[1]
            .toString()
            .toLowerCase()
            .contains(searchBar.text.toLowerCase()) ||
        row[3]
            .toString()
            .toLowerCase()
            .contains(searchBar.text.toLowerCase()) ||
        row[4].toString().toLowerCase().contains(searchBar.text.toLowerCase());
  }).toList();

  accountsFilter.value = accountsFilter.value.take(100).toList();
  accounts.value.clear();
  for (List element in accountsFilter.value) {
    accounts.value.add(
      item(
        getImage(element[3]),
        element[1],
        element[4],
        element[element.length - 1],
      ),
    );
  }
  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  accounts.notifyListeners();
}
