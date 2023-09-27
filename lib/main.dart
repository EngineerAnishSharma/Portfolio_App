import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Portfolio(),
    );
  }
}
class Portfolio extends StatefulWidget {
  const Portfolio({super.key});

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  Color topColor=Colors.red;
  Color bottomColor=Colors.green;
  var colorList=[
    Colors.pink,
    Colors.blue,
    Colors.amber,
    Colors.deepPurple,
    Colors.deepPurpleAccent,
    Colors.deepOrangeAccent
  ];
  var index=0;
  late Uri link;

  Future<void> _launchUrl(link) async {
    if (!await launchUrl(link)) {
      throw Exception('Could not launch $link');
    }
  }
  @override
  Widget build(BuildContext context) {


    Future.delayed(const Duration(seconds: 3),(){
      setState(() {
        bottomColor=Colors.pink;
      });
    }
    );
    return Scaffold(
      body: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 2),
            onEnd: (){
              setState(() {
                index++;
                bottomColor=colorList[index % colorList.length];
                topColor=colorList[(index+1) % colorList.length];
              });
            },
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  topColor,
                  bottomColor,
                ]
              )
            ),


            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/profile-pic.png',
                  width: 200,
                ),
                SizedBox(height: 10,),
                Text(
                  'Anish Sharma',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  'App & Web Developer | AI ML',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          link=Uri.parse("https://www.github.com/EngineerAnishSharma");
                          _launchUrl(link);
                        },
                        icon: Image.asset('assets/github_icon.png'),
                      color: Colors.white,
                    ),
                    IconButton(
                      onPressed: (){
                        link=Uri.parse("https://www.linkedin.com/in/engineer-anish/");
                        _launchUrl(link);
                    },
                      icon: Image.asset('assets/linkedin_icon.png'),
                      color: Colors.white,
                    ),
                    IconButton(
                      onPressed: () {
                        link=Uri.parse('tel:1234567890');
                        _launchUrl(link);
                      },
                      icon: Image.asset('assets/call_icon.png'),
                      color: Colors.white,
                    ),
                    IconButton(
                      onPressed: () {
                        link=Uri.parse("mailto:engineeranish10000@gmail.com");
                        _launchUrl(link);
                      },
                      icon: Image.asset('assets/gmail_icon.png'),
                      color: Colors.white,
                    ),
                    IconButton(
                      onPressed: () async{
                        link=Uri.parse("https://www.youtube.com/@_Anish_Sharma_");
                        _launchUrl(link);
                      },
                      icon: Image.asset('assets/yt_icon.png'),
                      color: Colors.white,
                    )
                  ],
                )
              ],
            ),
          ),
        ]
      ),
    );
  }
}



