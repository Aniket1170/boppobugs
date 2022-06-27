import 'package:boppo_stream/Sizer/sizer.dart';
import 'package:boppo_stream/screens/Splash/splash_screen.dart';
import 'package:boppo_stream/utils/const.dart';
import 'package:boppo_stream/utils/notification.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? _token;

  void _getToken() async {
    // Get the token each time the application loads
    _token = await FirebaseMessaging.instance.getToken();
  }

  final _firebaseMessaging = FCM();

  String notificationTitle = 'No Title';
  String notificationBody = 'No Body';
  String notificationData = 'No Data';

  // _changeData(String msg) => setState(() => notificationData = msg);
  // _changeBody(String msg) => setState(() => notificationBody = msg);
  // _changeTitle(String msg) => setState(() => notificationTitle = msg);

  Future<bool> _forcePortrait() async {
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return false;
  }

  @override
  void initState() {
    _forcePortrait();
    _firebaseMessaging.init();
    _firebaseMessaging.initFCMSettings();
    _firebaseMessaging.setNotifications();
    _getToken();

    // firebaseMessaging.streamCtlr.stream.listen(_changeData);
    // firebaseMessaging.bodyCtlr.stream.listen(_changeBody);
    // firebaseMessaging.titleCtlr.stream.listen(_changeTitle);
    super.initState();
  }

  @override
  void dispose() {
    _firebaseMessaging.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Sizer(
        builder: (context, orientation, deviceType) => MaterialApp(
          title: appName,
          // theme: ThemeData.light().copyWith(
          //   textTheme:
          //       ThemeData.light().textTheme.apply(fontFamily: primaryFont),
          //   primaryTextTheme:
          //       ThemeData.light().textTheme.apply(fontFamily: primaryFont),
          //   backgroundColor: Colors.white,
          //   primaryColor: Colors.black,
          //   primaryColorLight: Colors.white,
          //   primaryColorDark: Color(0xff242B2E),
          //   appBarTheme: AppBarTheme(
          //       backgroundColor: Colors.white,
          //       iconTheme: IconThemeData(color: Colors.black),
          //       elevation: 0,
          //       titleTextStyle: TextStyle(
          //           color: Colors.black,
          //           fontSize: 20.0,
          //           fontWeight: FontWeight.w600)),
          //   progressIndicatorTheme:
          //       ProgressIndicatorThemeData(color: Colors.black),
          //   inputDecorationTheme: InputDecorationTheme(
          //     border: UnderlineInputBorder(
          //         borderSide: BorderSide(color: Colors.black)),
          //     labelStyle:
          //         TextStyle(fontSize: 8.sp, fontWeight: FontWeight.w400),
          //     hintStyle: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.w400),
          //   ),
          //   brightness: Brightness.light,
          //   iconTheme: IconThemeData(
          //     color: Colors.black,
          //     size: 30.0,
          //   ), //opacity: 10
          //   visualDensity: VisualDensity.adaptivePlatformDensity,
          //   toggleableActiveColor: Colors.blue[900],
          //   buttonTheme: ButtonThemeData(buttonColor: Colors.lightBlue),
          //   elevatedButtonTheme: ElevatedButtonThemeData(
          //     style: ElevatedButton.styleFrom(
          //         primary: primaryColor, // Button color
          //         onPrimary: Colors.white,
          //         textStyle: TextStyle(
          //             fontSize: 12.sp,
          //             fontWeight: FontWeight.w600,
          //             color: Colors.white) // Text color
          //         ),
          //   ),
          //   textButtonTheme: TextButtonThemeData(
          //     style: ElevatedButton.styleFrom(
          //         primary: Colors.transparent, // Button color
          //         onPrimary: Colors.black,
          //         textStyle: TextStyle(
          //             fontSize: 8.sp,
          //             fontWeight: FontWeight.w600,
          //             color: Colors.white) // Text color
          //         ),
          //   ),
          //   bottomAppBarColor: Colors.white,

          //   listTileTheme: ListTileThemeData(selectedColor: primaryColor),
          //   primaryIconTheme: IconThemeData(color: Colors.black),
          //   cardColor: Colors.white,
          //   dialogBackgroundColor: Colors.white,
          //   scaffoldBackgroundColor: Colors.white,
          //   colorScheme: ColorScheme.light(onPrimary: Colors.black),
          // ),
          theme: ThemeData.light().copyWith(
            textTheme:
                ThemeData.dark().textTheme.apply(fontFamily: primaryFont),
            primaryTextTheme:
                ThemeData.dark().textTheme.apply(fontFamily: primaryFont),
            primaryColor: Colors.white,
            primaryColorLight: Colors.white,
            primaryColorDark: primarybackgroundColor,
            appBarTheme: AppBarTheme(
                backgroundColor: primarybackgroundColor,
                iconTheme: IconThemeData(color: Colors.white),
                elevation: 0,
                titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600)),
            progressIndicatorTheme:
                ProgressIndicatorThemeData(color: Colors.white),
            inputDecorationTheme: InputDecorationTheme(
              border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              labelStyle:
                  TextStyle(fontSize: 8.sp, fontWeight: FontWeight.w400),
              hintStyle: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.w400),
            ),
            // accentColorBrightness: Brightness.light,
            toggleableActiveColor: Colors.blue[900],
            bottomAppBarColor: Colors.black87,
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: Colors.white,
                selectedIconTheme: IconThemeData(color: primarybuttonColor),
                unselectedIconTheme: IconThemeData(color: Colors.black),
                selectedItemColor: primarybackgroundColor,
                unselectedItemColor: Colors.black,
                selectedLabelStyle: TextStyle(
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w600,
                    color: primarybackgroundColor),
                unselectedLabelStyle: TextStyle(
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w600,
                    color: primarybackgroundColor)),
            buttonTheme: ButtonThemeData(buttonColor: primarybuttonColor),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  primary: primarybuttonColor, // Button color
                  onPrimary: Colors.white,
                  maximumSize: Size(100.w, 6.h),
                  minimumSize: Size(30.w, 6.h),
                  textStyle: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white) // Text color
                  ),
            ),
            textButtonTheme: TextButtonThemeData(
              style: ElevatedButton.styleFrom(
                  primary: Colors.transparent, // Button color
                  onPrimary: Colors.white,
                  textStyle: TextStyle(
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white) // Text color
                  ),
            ),
            brightness: Brightness.dark,
            iconTheme: IconThemeData(
              color: Colors.white,
              size: 6.w,
            ), //opacity: 10
            visualDensity: VisualDensity.adaptivePlatformDensity,
            // accentIconTheme: IconThemeData(color: Colors.white),
            listTileTheme:
                ListTileThemeData(selectedColor: primarybackgroundColor),
            cardColor: primarybackgroundColor,
            backgroundColor: primarybackgroundColor,
            dialogBackgroundColor: primarybackgroundColor,
            scaffoldBackgroundColor: primarybackgroundColor,
            colorScheme: ColorScheme.dark(
                onPrimary: primarybackgroundColor,
                surface: primarybackgroundColor,
                primary: Colors.white,
                secondary: Colors.white),
            canvasColor: primarybackgroundColor,
          ),
          darkTheme: ThemeData.dark().copyWith(
            textTheme:
                ThemeData.dark().textTheme.apply(fontFamily: primaryFont),
            primaryTextTheme:
                ThemeData.dark().textTheme.apply(fontFamily: primaryFont),
            primaryColor: Colors.white,
            primaryColorLight: Colors.white,
            primaryColorDark: Color(0xff242B2E),
            appBarTheme: AppBarTheme(
                backgroundColor: primarybackgroundColor,
                iconTheme: IconThemeData(color: Colors.white),
                elevation: 0,
                titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600)),
            progressIndicatorTheme:
                ProgressIndicatorThemeData(color: Colors.white),
            inputDecorationTheme: InputDecorationTheme(
              border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              labelStyle:
                  TextStyle(fontSize: 8.sp, fontWeight: FontWeight.w400),
              hintStyle: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.w400),
            ),
            // accentColorBrightness: Brightness.light,
            toggleableActiveColor: Colors.blue[900],
            bottomAppBarColor: Colors.black87,
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: Colors.white,
                selectedIconTheme: IconThemeData(color: primarybuttonColor),
                unselectedIconTheme: IconThemeData(color: Colors.black),
                selectedItemColor: primarybackgroundColor,
                unselectedItemColor: Colors.black,
                selectedLabelStyle: TextStyle(
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w600,
                    color: primarybackgroundColor),
                unselectedLabelStyle: TextStyle(
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w600,
                    color: primarybackgroundColor)),
            buttonTheme: ButtonThemeData(buttonColor: primarybuttonColor),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  primary: primarybuttonColor, // Button color
                  onPrimary: Colors.white,
                  maximumSize: Size(100.w, 6.h),
                  minimumSize: Size(30.w, 6.h),
                  textStyle: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white) // Text color
                  ),
            ),
            textButtonTheme: TextButtonThemeData(
              style: ElevatedButton.styleFrom(
                  primary: Colors.transparent, // Button color
                  onPrimary: Colors.white,
                  textStyle: TextStyle(
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white) // Text color
                  ),
            ),
            brightness: Brightness.dark,
            iconTheme: IconThemeData(
              color: Colors.white,
              size: 6.w,
            ), //opacity: 10
            visualDensity: VisualDensity.adaptivePlatformDensity,
            // accentIconTheme: IconThemeData(color: Colors.white),
            listTileTheme:
                ListTileThemeData(selectedColor: primarybackgroundColor),
            cardColor: primarybackgroundColor,
            backgroundColor: primarybackgroundColor,
            dialogBackgroundColor: primarybackgroundColor,
            scaffoldBackgroundColor: primarybackgroundColor,
            colorScheme: ColorScheme.dark(
                onPrimary: primarybackgroundColor,
                surface: primarybackgroundColor,
                primary: Colors.white,
                secondary: Colors.white),
            canvasColor: primarybackgroundColor,
          ), // standard dark theme
          themeMode: ThemeMode.system, // device controls theme
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
          // home: LoginPage(),
          // routes: {
          // '/': (context) => LoginPage(),
          // HomeTabPageRoute: (context) => HomeTabPage(),
          // ContinueWatchingPageRoute: (context) => ContinueWatchingPage(),
          // TrendingPageRoute: (context) => TrendingPage(),
          // DetailsScreenPageRoute: (context) => DetailsPage(),
          // SignInPageRoute: (context) => LoginPage(),
          // PlayersPageRoute: (context) => PlayersPage(),
          // OtpPageRoute: (context) => OtpPage(),
          // },
        ),
      );
}
