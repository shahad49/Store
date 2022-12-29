import 'package:flutter/material.dart';
import 'OnBoarding.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => OnBoarding()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:
            [Image.asset('assets/images/Catalogue-amico.png'),
              SizedBox(
                height:40.0,
              ),
            Text('Welcome',
              style:TextStyle(
                fontSize: 18,
                fontWeight:FontWeight.bold ,

              ),

    ),

    ]),
      ));
  }
}


