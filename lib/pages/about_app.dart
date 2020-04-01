import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

List<Widget> myLinks() => [
      bottomButtonsWidget('Github', 'https://github.com/iambaljeet'),
      SizedBox(
        width: 10,
      ),
      bottomButtonsWidget('AngelList', 'https://angel.co/imbaljeet'),
      SizedBox(
        width: 10,
      ),
      bottomButtonsWidget(
          'Linkedin', 'https://www.linkedin.com/in/baljeet-singh-402303116/'),
      SizedBox(
        width: 10,
      ),
      bottomButtonsWidget('Twitter', 'https://twitter.com/baljeet_dev'),
      SizedBox(
        width: 10,
      ),
      bottomButtonsWidget('Facebook', 'https://www.facebook.com/ibaljeetsingh'),
      SizedBox(
        width: 10,
      ),
      bottomButtonsWidget(
          'Instagram', 'https://www.instagram.com/iam.baljeet/'),
    ];

class AboutApp extends StatefulWidget {
  @override
  _AboutAppState createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
          child: Column(
            children: <Widget>[
              _cardView(
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          width: 80,
                          height: 80,
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/my_image.jpg'),
                          ),
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Flexible(
                          child: Text(
                            'Software Engineer and Mobile Application Developer in Gurgaon, Haryana, India',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Wrap(
                      children: myLinks(),
                    ),
                  ],
                ),
              ),
              _cardView(
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          width: 30,
                          height: 30,
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                                'assets/images/covid_19_india_icon.png'),
                          ),
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Flexible(
                          child: Text(
                            'Api used is provided by https://www.covid19india.org/',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 100.0),
                child: _cardView(
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Flexible(
                            child: Text(
                              'All other Informative data used is fetched from internet. '
                              'For any kind of credits and removal please contact '
                              'application developer.',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _cardView(Widget childWidget) {
  return Container(
    width: double.maxFinite,
    child: Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: childWidget,
      ),
    ),
  );
}

Widget bottomButtonsWidget(String text, String url) {
  return InkWell(
    onTap: () => _launchURL(url),
    child: Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 12.0),
      ),
    ),
  );
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
