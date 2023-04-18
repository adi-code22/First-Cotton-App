import 'package:first_cotton/services/local/sharedPreferences.dart';
import 'package:first_cotton/views/dashboard/dashboard.dart';
import 'package:first_cotton/views/login/login.dart';
import 'package:first_cotton/views/myGroups/mygroups.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool contractactive = false;
  bool mygroupaactive = true;
  bool settingsactive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Profile",
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          // Profile Name
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/myprofile');
            },
            leading: Icon(
              Icons.account_circle_rounded,
              size: 24.sp,
            ),
            title: Text(
              userName,
              style: GoogleFonts.inter(fontSize: 14.sp),
            ),
          ),
          const Divider(
            color: Color.fromRGBO(231, 231, 231, 1),
          ),

          // My Lots
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/mylot');
            },
            child: ListTile(
              leading: Icon(
                Icons.storefront_sharp,
                size: 24.sp,
              ),
              title: Text(
                'My Lots',
                style: GoogleFonts.inter(fontSize: 14.sp),
              ),
            ),
          ),
          const Divider(
            color: Color.fromRGBO(231, 231, 231, 1),
          ),

          // My contracts
          ListTile(
            leading: Icon(Icons.edit_note_outlined,
                size: 24.sp,
                color: contractactive ? Colors.black : Colors.grey[400]),
            title: Text(
              'My Contracts',
              style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  color: contractactive ? Colors.black : Colors.grey[400]),
            ),
          ),
          const Divider(
            color: Color.fromRGBO(231, 231, 231, 1),
          ),

          // Groups
          GestureDetector(
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: ((context) => MyGroups()))),
            child: ListTile(
              leading: Icon(Icons.groups_sharp,
                  size: 24.sp,
                  color: mygroupaactive ? Colors.grey : Colors.grey[400]),
              title: Text(
                'My Groups',
                style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    color: mygroupaactive ? Colors.black : Colors.grey[400]),
              ),
            ),
          ),
          const Divider(
            color: Color.fromRGBO(231, 231, 231, 1),
          ),

          // Settings
          ListTile(
            leading: Icon(Icons.settings,
                size: 24.sp,
                color: settingsactive ? Colors.black : Colors.grey[400]),
            title: Text(
              'Settings',
              style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  color: settingsactive ? Colors.black : Colors.grey[400]),
            ),
          ),
          const Divider(
            color: const Color.fromRGBO(231, 231, 231, 1),
          ),

          // Support
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/support');
            },
            child: ListTile(
              leading: Icon(
                Icons.call,
                size: 24.sp,
              ),
              title: Text(
                'Support',
                style: GoogleFonts.inter(fontSize: 14.sp),
              ),
            ),
          ),
          const Divider(
            color: Color.fromRGBO(231, 231, 231, 1),
          ),

          // Privacy Policy
          ListTile(
            onTap: () async {
              final Uri _url =
                  Uri.parse('https://firstcotton.app/privacy-policy');
              if (!await launchUrl(_url, mode: LaunchMode.externalApplication))
                throw 'Could not launch $_url';
            },
            leading: Icon(Icons.account_circle_rounded,
                size: 24.sp, color: Colors.transparent),
            title: Text(
              'Privacy Policy',
              style: GoogleFonts.inter(fontSize: 14.sp),
            ),
          ),
          const Divider(
            color: Color.fromRGBO(231, 231, 231, 1),
          ),

          // Logout
          ListTile(
            onTap: () {
              SharedPrefs().removeToken();
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const LoginPage()));
            },
            leading: Icon(
              Icons.account_circle_rounded,
              size: 24.sp,
              color: Colors.transparent,
            ),
            title: Text(
              'Logout',
              style: GoogleFonts.inter(fontSize: 14.sp, color: Colors.red),
            ),
          ),
          const Divider(
            color: Color.fromRGBO(231, 231, 231, 1),
          )
        ],
      )),
    );
  }
}
