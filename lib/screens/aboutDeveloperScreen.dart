import 'package:coder_status/components/colorscheme.dart';
import 'package:coder_status/components/myAppBar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

class AboutDeveloperScreen extends StatefulWidget {
  @override
  _AboutDeveloperScreenState createState() => _AboutDeveloperScreenState();
}

class _AboutDeveloperScreenState extends State<AboutDeveloperScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.08),
        child: MyAppBarWithBack('About Developer'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('images/MyAvatar.jpg'),
              radius: MediaQuery.of(context).size.height * 0.1,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    style: TextStyle(
                        fontFamily: 'young',
                        color: ColorSchemeClass.lightgrey,
                        fontSize: MediaQuery.of(context).size.height * 0.03),
                    children: [
                      TextSpan(text: 'Hey there, I\'m'),
                      TextSpan(
                          text: '\nYuvraj Singh',
                          style: TextStyle(
                              color: ColorSchemeClass.primarygreen,
                              fontFamily: 'headline',
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.05)),
                      TextSpan(
                          text:
                              '\n\nI\'m a Flutter Developer, a newbie\nat Competitive Programming\nand I also draw  vector Illustrations as a hobby',
                          style: TextStyle(
                              color:
                                  ColorSchemeClass.lightgrey.withOpacity(0.8),
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.018)),
                    ])),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Container(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: ColorSchemeClass.unactivatedblack,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.link,
                        color: ColorSchemeClass.primarygreen,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      Text(
                        'Connect With Me',
                        style: TextStyle(
                            fontFamily: 'young',
                            fontWeight: FontWeight.bold,
                            color: ColorSchemeClass.primarygreen,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.03),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.height * 0.25,
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: GridView.count(
                      crossAxisSpacing:
                          MediaQuery.of(context).size.height * 0.05,
                      mainAxisSpacing:
                          MediaQuery.of(context).size.height * 0.03,
                      crossAxisCount: 3,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            const url = 'https://github.com/curiousyuvi';

                            await launch(url);
                          },
                          child: Container(
                              width: MediaQuery.of(context).size.height * 0.07,
                              height: MediaQuery.of(context).size.height * 0.07,
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: FaIcon(
                                  FontAwesomeIcons.github,
                                  color: ColorSchemeClass.primarygreen,
                                  size: MediaQuery.of(context).size.height *
                                      0.043,
                                ),
                              )),
                        ),
                        GestureDetector(
                          onTap: () async {
                            const url =
                                'https://www.instagram.com/curiousyuvi/';

                            await launch(url);
                          },
                          child: Container(
                              width: MediaQuery.of(context).size.height * 0.07,
                              height: MediaQuery.of(context).size.height * 0.07,
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: FaIcon(
                                  FontAwesomeIcons.instagram,
                                  color: ColorSchemeClass.primarygreen,
                                  size: MediaQuery.of(context).size.height *
                                      0.043,
                                ),
                              )),
                        ),
                        GestureDetector(
                          onTap: () async {
                            const url =
                                'https://www.linkedin.com/in/yuvraj-singh-b85ab71b9/';

                            await launch(url);
                          },
                          child: Container(
                              width: MediaQuery.of(context).size.height * 0.07,
                              height: MediaQuery.of(context).size.height * 0.07,
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: FaIcon(
                                  FontAwesomeIcons.linkedin,
                                  color: ColorSchemeClass.primarygreen,
                                  size: MediaQuery.of(context).size.height *
                                      0.043,
                                ),
                              )),
                        ),
                        GestureDetector(
                          onTap: () async {
                            const url = 'https://twitter.com/curiousyuvi007';
                            await launch(url);
                          },
                          child: Container(
                              width: MediaQuery.of(context).size.height * 0.07,
                              height: MediaQuery.of(context).size.height * 0.07,
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: FaIcon(
                                  FontAwesomeIcons.twitter,
                                  color: ColorSchemeClass.primarygreen,
                                  size: MediaQuery.of(context).size.height *
                                      0.043,
                                ),
                              )),
                        ),
                        GestureDetector(
                          onTap: () async {
                            const url =
                                'https://www.facebook.com/profile.php?id=100067497900821';
                            await launch(url);
                          },
                          child: Container(
                              width: MediaQuery.of(context).size.height * 0.07,
                              height: MediaQuery.of(context).size.height * 0.07,
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: FaIcon(
                                  FontAwesomeIcons.facebook,
                                  color: ColorSchemeClass.primarygreen,
                                  size: MediaQuery.of(context).size.height *
                                      0.043,
                                ),
                              )),
                        ),
                        GestureDetector(
                          onTap: () {
                            Clipboard.setData(
                                ClipboardData(text: 'ysgaur9919@gmail.com'));
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor: ColorSchemeClass.primarygreen,
                                content: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.check,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.04,
                                    ),
                                    Text(
                                      'Email copied to clipboard',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: 'young',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.025),
                                    ),
                                  ],
                                )));
                          },
                          child: Container(
                              width: MediaQuery.of(context).size.height * 0.07,
                              height: MediaQuery.of(context).size.height * 0.07,
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: Icon(
                                  Icons.mail,
                                  color: ColorSchemeClass.primarygreen,
                                  size: MediaQuery.of(context).size.height *
                                      0.043,
                                ),
                              )),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
