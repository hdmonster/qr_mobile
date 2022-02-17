import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constant.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: appBarTheme,
    iconTheme: IconThemeData(
      color: kContentColorLightTheme,
    ),
    textTheme: GoogleFonts.openSansTextTheme(Theme.of(context).textTheme)
        .apply(bodyColor: kContentColorLightTheme),
    colorScheme: ColorScheme.light(
      primary: kPrimaryColor,
      secondary: kPurple,
      error: kRed,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: kContentColorLightTheme.withOpacity(.7),
      unselectedItemColor: kContentColorLightTheme.withOpacity(.32),
      selectedIconTheme: IconThemeData(color: kPrimaryColor),
    ),
  );
}

Container sheetLine() {
  return Container(
    width: 40,
    height: 4,
    decoration: BoxDecoration(
      color: kGrey,
      borderRadius: BorderRadius.circular(2),
    ),
  );
}

BoxDecoration sheetDecoration() {
  return BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: kPrimaryColor.withOpacity(.25),
          blurRadius: 4,
          offset: Offset(0, 1),
        )
      ]);
}

final appBarTheme = AppBarTheme(
  centerTitle: false,
  titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
  elevation: 0,
);
