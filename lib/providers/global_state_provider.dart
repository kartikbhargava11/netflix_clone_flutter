import "package:flutter/material.dart";


class GlobalData with ChangeNotifier {
   var scrollOffset = 0.0;

   void updateScrollOffset(double val) {
      scrollOffset = val;
      notifyListeners();
   }

}