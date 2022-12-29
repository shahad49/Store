import 'package:flutter/material.dart';
import 'package:shahadproject/shared/components/slide.dart';
import 'package:shahadproject/shared/components/dot.dart';
import 'login_page.dart';

class lOnBoarding {
  String image;
  String title;
  String subtitle;

  lOnBoarding({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}

final onBoardingList = [
  lOnBoarding(
    image: 'assets/images/1.png',
    title: 'Find Favorite Items',
    subtitle: 'Find your favorite products that you want to buy easily',
  ),
  lOnBoarding(
    image: 'assets/images/Successful purchase-cuate.png',
    title: ' Easy and Safe Payment ',
    subtitle: 'Pay for your products you buy safely and easily',
  ),
  lOnBoarding(
    image: 'assets/images/In no time-pana.png',
    title: ' Fast Delivery ',
    subtitle: 'Your product is delivered to your home safely and securely',
  ),
];

class OnBoarding extends StatefulWidget {
  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int active = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
            itemCount: onBoardingList.length,
            onPageChanged: (index) {
              print('index:$index');
              setState(() {
                active = index;
              });
            },
            itemBuilder: (BuildContext context, int index) {
              return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Slide(
                        image: onBoardingList[index].image,
                        title: onBoardingList[index].title,
                        subtitle: onBoardingList[index].subtitle),
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          onBoardingList.length,
                          (index) => dot(
                                index: index,
                                active: active,
                              )),
                    ),

                    Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.teal,
                          fixedSize: Size(
                            MediaQuery.of(context).size.width,
                            45,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        onPressed: () {
                          if (active < onBoardingList.length - 1 )
                          {
                            pageController.nextPage(
                                // active + 1,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeIn
                            );
                          } else {
                            // navigator
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(builder: (context) => LoginScreen1()),
                                    (route) => false);
                          }
                        },
                        child: Text(
                          active == onBoardingList.length - 1 ? 'Start' : 'Next',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => LoginScreen1()),
                            (route) => false);
                      },
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          color: Colors.teal,
                        ),
                      ),
                    ),
                  ]);
            }));
  }
}
