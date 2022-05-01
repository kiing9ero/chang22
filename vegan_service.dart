import 'package:flutter/cupertino.dart';
import 'package:vegan/lacto.dart';
import 'package:vegan/ovo.dart';
import 'package:vegan/pesco.dart';
import 'package:vegan/vegan.dart';

class VeganService extends ChangeNotifier {
  String veganLevel = 'pesco';

  late List<Map<String, dynamic>> veganLevelList;

  getList() {
    switch (veganLevel) {
      case 'vegan':
        veganLevelList = Vegan().veganList;
        break;

      case 'lacto':
        veganLevelList = Lacto().lactoList;
        break;

      case 'ovo':
        veganLevelList = Ovo().ovoList;
        break;

      case 'lacto-ovo':
        veganLevelList = Vegan().veganList;
        break;

      case 'pesco':
        veganLevelList = Pesco().pescoList;
        break;

      default:
        veganLevelList = Pesco().pescoList;
        break;
    }
  }
}
