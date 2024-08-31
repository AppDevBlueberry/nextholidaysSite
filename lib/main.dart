import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

String textTitle = "Download now &\nstart exploring";
String textDec =
    "Get all your bookings and travel packages on one platform. Download the app now!";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: ResponsiveLayout(),
        ),
      ),
    );
  }
}

class ResponsiveLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey.withOpacity(0.2),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 800) {
            return Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        opacity: 0.05,
                        image: AssetImage(
                            'assets/Screenshot 2024-08-31 at 3.03.54 PM.png'))),
                child: DesktopView());
          } else {
            return MobileView();
          }
        },
      ),
    );
  }
}

class DesktopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(110.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  textTitle,
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[900],
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  textDec,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _launchUrl(
                            'https://apps.apple.com/in/app/next-holidays/id6444337009');
                      },
                      child: SvgPicture.asset(
                        'assets/app-store.svg', // Add the App Store badge image here
                        height: 55,
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        _launchUrl(
                            'https://play.google.com/store/apps/details?id=com.nextholidays.app&hl=en-IN');
                      },
                      child: SvgPicture.asset(
                        'assets/google-play.svg', // Add the Google Play badge image here
                        height: 55,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Image.asset(
            'assets/AppBanner.png', // Add the phone mockup image here
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}

class MobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          textTitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Colors.blue[900],
          ),
        ),
        SizedBox(height: 15),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Text(
            textDec,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(height: 20),
        Image.asset(
          'assets/AppBanner.png', // Add the phone mockup image here
          height: 450,
          fit: BoxFit.contain,
        ),
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  _launchUrl(
                      'https://apps.apple.com/in/app/next-holidays/id6444337009');
                },
                child: SvgPicture.asset(
                  'assets/app-store.svg', // Add the App Store badge image here
                  height: 45,
                ),
              ),
              SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  _launchUrl(
                      'https://play.google.com/store/apps/details?id=com.nextholidays.app&hl=en-IN');
                },
                child: SvgPicture.asset(
                  'assets/google-play.svg', // Add the Google Play badge image here
                  height: 45,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 50),
      ],
    );
  }
}

Future<void> _launchUrl(String url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw Exception('Could not launch $url');
  }
}
