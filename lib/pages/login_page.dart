import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'home.dart';


class LoginScreen1 extends ConsumerWidget {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body:Container(
        color: Colors.white,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              children:
                  [
                    SizedBox(height: 80,),
                    Image.asset('assets/images/login-concept-illustration_114360-739.webp',
                    scale: 10,
                    ),
                    SizedBox(
                      height:25,
                    ),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email addres',
                        enabledBorder:OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1.5,
                            color: Colors.grey,
                          ),
                        ),
                        // border:
                        prefixIcon: Icon(
                          Icons.email,
                        ),
                      ),
                    ),
                    SizedBox(
                      height:15,
                    ),
                    TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Passward',
                        enabledBorder:OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1.5,
                            color: Colors.grey,
                          ),
                        ),
                        prefixIcon: Icon(
                          Icons.lock,
                        ),
                        suffixIcon: Icon(
                          Icons.remove_red_eye,
                        ),
                      ),
                    ),
                    SizedBox(
                      height:20,
                    ),
                    Container(
                      width:double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.teal,
                          ),
                      child: MaterialButton(
                          onPressed: (){
                           Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>HomePage()),(route) => false);
                          },
                        child: Text('Login',
                        style:TextStyle(
                          color:Colors.white,
                          fontStyle: FontStyle.italic,
                        )
                        ),
                      ),
                    ),
                    SizedBox(
                      height:10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            'Don\'t have an account?',
                           style:TextStyle(
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        TextButton(onPressed:( ){ },
                          child:
                        Text(
                            'RegisterNow',
                          style:TextStyle(
                            fontWeight:FontWeight.bold,
                            color: Colors.teal,
                            fontStyle: FontStyle.italic,
                          ),



                        ),),
                      ],
                    ),
                  ]
            ),
          ),
        ),
      ),
      );
  }
}
