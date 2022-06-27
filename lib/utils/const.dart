import 'package:flutter/material.dart';

/// On Android the titles appear above the task manager's app snapshots which are displayed when the user presses the "recent apps" button.
const appName = 'Boppo Stream';

/// validation constants
const String EMPTY_FIELD_MESSAGE = 'Field is empty';
const String NAME_VALIDATION_MESSAGE = 'Enter valid name';
const String PHONE_VALIDATION_MESSAGE = 'Enter valid mobile number';
const String EMAIL_VALIDATION_MESSAGE = 'Enter valid email id';
const String PASSWORD_VALIDATION_MESSAGE =
    'Password should be greater than 8 characters';

/// constant messages
const SERVER_ERROR = "Something went wrong, please try again later";
const INTERNET_LOST = "Internet Connectivity Lost";
const PASSWORD_RESET_TEXT =
    "Your password has been reset successfully, please check your email for your new password, which you can change later on from settings.";

const int START_TIMING = 59;
const String EXCEPTIONAL_MESSAGE = 'Please try again';

const String rupeeSymbol = '₹';

const kPlaceHolderImageUrl = 'https://cdn.bollywoodmdb.com/images/poster-2.png';
const kImageBaseUrl = 'https://d28qk5m15i8chy.cloudfront.net/';
const kDummyVideoUrl =
    'https://d28qk5m15i8chy.cloudfront.net/movie/ShiddatOfficialTrailerSunnyKaushalRadhikaMadanMohitRainaDianaPenty1stOctober_1638267513010.mp4';

const kSplashImage = 'assets/images/stream_placeholder.png';
// const kPlaceholder = 'assets/images/stream_placeholder.png';
const kPlaceholder = 'assets/gifs/loader.gif';

const refreshToken = 'refresh_token';
const token = 'token';

const primaryFont = 'Axiforma';
// const primaryColor = Color(0xFF3257A6);
const primarybuttonColor = Color(0xFF3257A6);
const primarybackgroundColor = Color(0xFF09152A);
const backgroundColor = Color(0xFF09152A);
const tileColor = Color(0xFF1E293C);

const movieContentTypeId = 1;

const blackGradient = LinearGradient(
  colors: [
    Color(0xFFFFFFFF),
    Color(0xFF09152A),
    Color(0xFF000000),
  ],
  stops: [
    0.02,
    0.3,
    0.4,
  ],
  begin: Alignment.topLeft,
  end: Alignment.topRight,
  tileMode: TileMode.clamp,
);

const blueGradient = LinearGradient(
  colors: [
    Color(0xFFFFFFFF),
    Color(0xFF183F92),
    Color(0xFF173470),
  ],
  stops: [
    0.01,
    0.09,
    0.4,
  ],
  begin: Alignment.topLeft,
  end: Alignment.topRight,
  tileMode: TileMode.clamp,
);
