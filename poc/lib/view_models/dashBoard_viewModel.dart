import 'package:flutter/material.dart';
import 'package:poc/models/stuClass.dart';
import 'package:poc/services/dBase.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:poc/view/add_new_view.dart';
import 'package:stacked_services/stacked_services.dart';

class DashBoardViewModel extends ChangeNotifier{
  
  List<StuClass> stuList = [];
  String? emailId;
  String? disName;
  bool isLoading = false;

  initialise() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    emailId = prefs.getString('email') ?? '--';
    disName = prefs.getString('DisName') ?? '--';
    refresh();
  }

  Future refresh() async{
    isLoading = true;
    Dbase.instance.queryAllRows().then((value) {
        value?.forEach((element) {
          stuList.add(StuClass(
              id: element['id'], 
              name: element["name"],
              clgname: element["clgname"],
              branch: element["branch"],
              year: element["year"],
            )
          );
        });
    });
    notifyListeners();
  }

  Future delete(int? id) async {
    await Dbase.instance.delete(id!);
    stuList.removeWhere((element) => element.id == id);
    notifyListeners();
  }

}