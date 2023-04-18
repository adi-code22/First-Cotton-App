import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:first_cotton/helpers/theme.dart';
import 'package:first_cotton/services/local/sharedPreferences.dart';
import 'package:first_cotton/views/bottomNavigation.dart';
import 'package:first_cotton/views/chat/chat.dart';
import 'package:first_cotton/views/login/login.dart';
import 'package:first_cotton/views/myLots/myLots.dart';
import 'package:first_cotton/views/myprofile/myprofile.dart';
import 'package:first_cotton/views/newUserRegistration.dart/newUser.dart';
import 'package:first_cotton/views/profile/profile.dart';
import 'package:first_cotton/views/support/support.dart';
import 'package:first_cotton/views/waitingScreen/waitingScreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'firebase_options.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:io';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    "high_importance_channel", // id
    "High Importance Notifications", // title
    importance: Importance.high,
    playSound: true);
FirebaseMessaging messaging = FirebaseMessaging.instance;
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (kDebugMode) {
    print("a bg message just came ${message.messageId}");
    print(message.notification!.body);
    print(message.notification!.title);
    print(message.notification!.android);
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future main() async {
  await dotenv.load(fileName: "lib/helpers/.env");
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  String? token = await FirebaseMessaging.instance.getToken();
  SharedPrefs().saveFcmToken(token!);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  runApp(
    //device preview lets you view ui in different screens sizes
    DevicePreview(
      enabled: false,
      builder: (context) => const MyApp(),
    ),
  );
}

// -> default runApp() snippet

// void main() {
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
          theme: CustomTheme.lightTheme,
          routes: {
            '/chat': ((context) => const Chat()),
            '/profile': ((context) => const Profile()),
            '/login': ((context) => const LoginPage()),
            '/waiting': ((context) => const WaitingScreen()),
            '/mylot': (context) => const MyLots(),
            '/myprofile': ((context) => const MyProfile()),
            '/support': (context) => const Support()
            // '/chatscreen': (context) => const ChatScreen(),
            // '/lotdetailspage': (context) => c LotDetailsPage(),
          },
          title: 'First Cotton',
          home: FutureBuilder(
            future: SharedPrefs().getToken(),
            builder: (ctx, snapshot) {
              if (snapshot.hasData) {
                return const BottomNavigation();
              } else {
                return const LoginPage();
              }
            },
          ));
    });
  }
}
