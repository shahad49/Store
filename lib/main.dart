import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shahadproject/pages/SplashPage.dart';
import 'package:shahadproject/pages/home.dart';
import 'package:shahadproject/servies/Dio_helper.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(ProviderScope(child: EMI()));
}
class EMI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home:SplashPage(),
    );
  }
}



