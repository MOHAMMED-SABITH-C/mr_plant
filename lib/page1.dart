// import 'dart:js_interop';



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mr_plant/plant.dart';

class homepage extends StatefulWidget {
   homepage({super.key});
  CollectionReference plants=FirebaseFirestore.instance.collection('plants');

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
    // 'lib/assets/p1.png','lib/assets/p2.png',
  //  List<String> images =[
  //   'lib/assets/p3.png',
  //   'lib/assets/p4.png','lib/assets/p5.png','lib/assets/p6.png',
  //   'lib/assets/p7.png','lib/assets/p8.png','lib/assets/p9.png',
  //   'lib/assets/p10.png','lib/assets/p11.png','lib/assets/p12.png',
  //   'lib/assets/p13.png','lib/assets/p14.png','lib/assets/p15.png',
  //   'lib/assets/p16.png','lib/assets/p17.png','lib/assets/p18.png',
  //   'lib/assets/p19.png','lib/assets/p20.png','lib/assets/p21.png',
  //   'lib/assets/p22.png','lib/assets/p23.png','lib/assets/p24.png',
  //   'lib/assets/p25.png','lib/assets/p26.png','lib/assets/p27.png',
  //   'lib/assets/p28.png','lib/assets/p29.png','lib/assets/p30.png',
  //   'lib/assets/p31.png','lib/assets/p32.png','lib/assets/p33.png',
  //   'lib/assets/p34.png','lib/assets/p35.png','lib/assets/p36.png',
  //   'lib/assets/p37.png','lib/assets/p38.png',

  // ];
  //   // 55,65,
  // List<int> price=[
  //   100,120,20,60,10,30,40,30,80,60,70,60,50,70,80,20,90,30,500,20,80,70,90,60,70,100,80,120,100,80,100,80,60,50,70,100
  // ];
  // List<int> favor=[//0,0,
  // 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];

  // late int leng=1;
  // ScrollController scrollcont=ScrollController();
  initState(){
  // leng=(images.length);
  // for(int i=0;i<36;i++){
  //   Map<String, Object> data={'image':images[i],'favor':favor[i],'price':price[i]};
  // widget.plants.add(data);

  // }
  // widget.plants=FirebaseFirestore.instance.collection('plants');
  // scrollcont=ScrollController(
  //   initialScrollOffset: leng/2 +1,//(((IMAGES.length)/2).floor()+1)
  //   // initialScrollIndex:leng/2,
  //   keepScrollOffset: true,
  // );
    super.initState();
  }
  late int flag=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Serch Products'),
        leading: IconButton(onPressed: (){Navigator.of(context).pop();}, icon: Icon(Icons.arrow_back_ios_new_outlined)),
        actions: [
          InkWell(
          child: Container(width: 50,height: 50,
            child: Center(child: Text('M',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),)),decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black)], borderRadius: BorderRadius.circular(50)),),
          onTap: (){},
          )
          ]),
      body: 
      Column(
        children: [
      Container(
        height: 40,
        width: double.infinity,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left:10.0),
              child: Container(
                width: MediaQuery.of(context).size.width-70,
                height: 50,
                child: TextField(textAlign: TextAlign.justify,decoration: InputDecoration(border: InputBorder.none,hintText: 'Search'),),
                decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.grey)],borderRadius: BorderRadius.circular(10)),),
            ),
            
            SizedBox(width: 10,),
            Container(
              height: 40,
              width:40,// MediaQuery.of(context).size.width-100,
              decoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(10)),
              child: Center(child: IconButton(onPressed: (){
              if(flag==1){
                flag=0;
              }
            }, icon: Icon(flag==1?Icons.menu:Icons.close_outlined,),)))
          ],
        ),
      ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height-150,
              width: double.infinity,
              child: Row(
                children: [
                  Expanded( 
                    child: Column(
                      children: [
                        SizedBox(height: 50,child: Text('Result found'),),
                        Expanded(
                          child: StreamBuilder(
                            stream: (widget.plants).snapshots(),
                            builder: (context, AsyncSnapshot snapshot) {
                              if(snapshot.hasData){
                              return ListView.separated(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemBuilder:((BuildContext context, index) {
                                  final DocumentSnapshot plantSnap=snapshot.data!.docs[index];
                                   return 
                                   Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: InkWell(
                                       child: Container(
                                          width: MediaQuery.of(context).size.width/2,
                                          // height: 180,
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)
                                          ,color: Colors.white30,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey
                                            )
                                          ]
                                          ),
                                          child: 
                                          Center(
                                            child: Column(
                                              children: [
                                                // Image.asset(images[index]),
                                                Image.asset(plantSnap['image']),
          
                                                Text(plantSnap['Name']),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Text("\$${plantSnap['price']}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25 ),),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Container(
                                                      height: 40,
                                                        width:  40,
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(50),
                                                        color: Colors.black
                                                      ),
                                                      child: IconButton(onPressed: (){
                                                        setState(() {
                                                          
                                                        plantSnap['favor']==1?widget.plants.doc(plantSnap.id).update({'favor':0}):widget.plants.doc(plantSnap.id).update({'favor':1});
                                                        
                                                        });
                                                      }, icon: Icon(Icons.favorite,color:plantSnap['favor']==1?Colors.pink: Colors.white,size: 25,)),
                                                    ),
                                                  ),
                                                  ],)
                                              ],
                                            ))
                                          ),
                                          onTap: (){
                                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>plant(id: plantSnap.id)));
                                          },
                                     ),
                                   );
                                  
                                }) , 
                                separatorBuilder: ((context, index) => SizedBox(height: 15,)), 
                                itemCount: ((snapshot.data!.docs.length)/2).floor(),//(images.length/2).floor()
                                );
                            }
                            return Container(
                              child: Text('sorry No elements found'),
                            );
                            }
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10,),
                    Expanded(
                      child: StreamBuilder(
                        stream: (widget.plants).snapshots(),
                        builder: (context,AsyncSnapshot snapshot) {
                          return ListView.separated(
                            shrinkWrap: true,
                            // controller: scrollcont,
                          scrollDirection: Axis.vertical,
                          itemBuilder:((BuildContext context, index) {
                            final int itemIndex = ((snapshot.data!.docs.length)/2).floor()+index;//((leng/ 2).floor())+index;
                                  final DocumentSnapshot plantSnap2=snapshot.data!.docs[itemIndex];
                                  // Map map= snapshot.data!.docs[itemIndex];
                                  // final plantsn=snapshot.data();
                                  // print(plantSnap2['Name']);
          
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    child: Container(
                                      width: MediaQuery.of(context).size.width/2,
                                      // height: 180,
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                                          // ,color: Colors.red
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey
                                            )
                                          ]
                                      ),
                                      child: Center(
                                        child: Column(
                                          children: [
                                            Image.asset(plantSnap2['image']),
                                            // plantSnap2.get('Name') == isUndefined
                                            //  snapshot.data!.docs[itemIndex].get("Name") ?Text('Welcome $itemIndex'):
                                             Text(plantSnap2['Name']),
                                            Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Text("\$${plantSnap2['price']}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25 ),),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Container(
                                                      height: 40,
                                                      width:  40,
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(50),
                                                        color: Colors.black
                                                      ),
                                                      child: IconButton(onPressed: (){
                                                        setState(() {
                                                          
                                                        // favor[itemIndex]==1?favor[itemIndex]=0:favor[itemIndex]=1;
                                                        plantSnap2['favor']==1?widget.plants.doc(plantSnap2.id).update({'favor':0}):widget.plants.doc(plantSnap2.id).update({'favor':1});
                                                        });
                                                        
                                                      }, icon: Icon(Icons.favorite,color:plantSnap2['favor']==1?Colors.pink: Colors.white,size: 25,)),
                                                    ),
                                                  ),
                                                  ],)
                                          ],
                                        ))),
                                        onTap: (){
                                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>plant(id: plantSnap2.id)));
                                          },
                                  ),
                                );
                            
                          }) , 
                          separatorBuilder: ((context, index) => SizedBox(height: 15,)), 
                          // initialScrollIndex:leng,
                          itemCount:((snapshot.data!.docs.length)/2).floor() //((images.length)/2).floor()
                          );
                        }
                      ),
                    )
                ],
              )
            ),
          ),
        ],
      ),
    );
  }
}