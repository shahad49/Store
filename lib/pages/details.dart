import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


int n=1;
final countStateProvider=StateProvider<int>((ref){return n;});

class Details extends ConsumerWidget {
  final dynamic item;
  // final dynamic item1;


  const Details( {Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    var value=ref.watch(countStateProvider);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.teal,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'Back',
            style: TextStyle(
              fontSize: 13,
              fontStyle: FontStyle.italic,
              color: Colors.teal,
            ),
          ),
        ),
        body: Container(
          color: Colors.teal,
          child: Column(
            children: [
              Container(
                width:size.width,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    )),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      height: size.width * 1.1,
                      child: Stack(children: [
                        Column(
                          children: [
                            Image(
                              image: NetworkImage(item.image!),
                              height: 330,
                              width: size.width,
                            ),
                            SizedBox(height: 5,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal:20, ),
                              child: Text(
                                item.title!,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 14,
                                  height: 1,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            // SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Color.fromARGB(255, 202, 184, 20),
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  item.rating!.rate.toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  ' (${item.rating!.count.toString()})',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ]),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal:20),
                    child: Text(item.description!,
                    style: TextStyle(
                      fontStyle:FontStyle.italic,
                      fontSize: 14,
                      height: 1.4,
                    ),
                    ),
                  ),
                ),
              ),
             
             Padding(
               padding: const EdgeInsets.only(bottom:15.0),
               child: Row(
                    children: [
                      Container(
                        width:size.width,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 20,
                                child:
                                FloatingActionButton(
                                  onPressed: () {ref.read(countStateProvider.state).state--;},

                                  child: Icon(Icons.remove,
                                  color: Colors.black,
                                  size: 15,),
                                  heroTag: value,
                                  backgroundColor: Colors.white,



                                ),
                              ),
                              SizedBox(width: 15,),
                              Text(
                                value.toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 15,),
                              Container(
                                width: 20,
                                child:FloatingActionButton(
                                  onPressed: ()=>ref.read(countStateProvider.state).state++,
                                  child: Icon(Icons.add,
                                    color: Colors.black,
                                    size: 15,),
                                  heroTag: value,
                                  backgroundColor: Colors.white,


                                ),
                                ),

                             // SizedBox(width: 50,),
                              Spacer(),
                              Container(
                                width: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.white,
                                ),
                                child: MaterialButton(
                                  onPressed: (){},
                                  child: Text('Add To Cart'),
                                ),
                              ),

                            ],
                          ),
                        ),

                      ),
                    ],
                  ),
             ),
       ],
          ),
        ));
  }
}


