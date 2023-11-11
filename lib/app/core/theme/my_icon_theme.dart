import 'package:annoty/app/core/constants/color/core.dart';
import 'package:annoty/app/core/constants/misc/is_it.dart';
import 'package:flutter/widgets.dart';

class MyIconTheme extends IconThemeData {
  @override
  Color get color =>
      IsIt.dark ? ConstColorMain.muteGrey : ConstColorMain.muteBlack;
}
