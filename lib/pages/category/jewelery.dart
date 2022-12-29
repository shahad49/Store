import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shahadproject/pages/details.dart';
import '../../model/data/electronics.dart';
import '../../model/data/jewelery.dart';
import '../../repositories/home_repositories.dart';

class JeweleryPage extends ConsumerWidget {

  List<Jewelery> jeweleryData = [];

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    AsyncValue<Response> jewelery= ref.watch(JeweleryProvider );
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: SingleChildScrollView(
        child: Column(
            children: [
              jewelery .when(
                  data: (response) {
                    var result = response.data;
                    for (var element in (result as List)) {
                      jeweleryData.add(Jewelery.fromJson(element));
                    };
                    return Container(
                            color:Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(0),
                              child: GridView.count(
                                shrinkWrap:true,
                                physics: NeverScrollableScrollPhysics(),
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                childAspectRatio: 1 / 1.1,
                                crossAxisCount: 2,
                                children: List.generate(
                                    jeweleryData.length,
                                        (index) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal:5 ,
                                      ),
                                      child: InkWell(
                                        onTap: (){Navigator.of(context).push(
                                            MaterialPageRoute(builder: (context) => Details(item:jeweleryData[index],))
                                        );
                                        },
                                        child: Container(
                                          // alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.blueGrey.withOpacity(0.3),
                                                  spreadRadius: 2,
                                                  blurRadius: 8,
                                                ),
                                              ]
                                          ),

                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Column(
                                              children: [
                                                Image(
                                                  image:NetworkImage(jeweleryData[index].image!),
                                                  height: 140,
                                                ),
                                                Spacer(),
                                                Container(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(jeweleryData[index].title!,
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                      height: 2,
                                                      fontStyle: FontStyle.italic,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      '\$ ${jeweleryData[index].price!.toString()}',
                                                      overflow: TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.teal,
                                                        // fontStyle: FontStyle.italic,
                                                      ),
                                                    ),
                                                    Spacer(),
                                                    const Icon(
                                                      Icons.star,
                                                      color: Color.fromARGB(255, 202, 184, 20),
                                                      size: 15,
                                                    ),
                                                    Text(
                                                      jeweleryData[index]
                                                          .rating!
                                                          .rate
                                                          .toString(),
                                                      overflow: TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.grey,
                                                        fontStyle: FontStyle.italic,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Text(
                                                      ' (${jeweleryData[index].rating!.count.toString()})' ,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.grey,
                                                        fontStyle: FontStyle.italic,
                                                      ),
                                                    ),

                                                  ],
                                                ),

                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )),
                              ),
                            ),
                          );
                  },
                  error: (err, stack) => Text('Error:$err'),
                  loading: () {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                            child:CircularProgressIndicator()
                        ),
                      ],
                    );
                  }
              ),
            ]
        ),
      ),
    );
  }
}
