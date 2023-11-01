import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class plant extends StatelessWidget {
   plant({super.key,required this.id});

   late String id;
   CollectionReference plants=FirebaseFirestore.instance.collection('plants');
//  List<String> images =[
//     'lib/assets/p1.png','lib/assets/p2.png','lib/assets/p3.png',
//     'lib/assets/p4.png','lib/assets/p5.png','lib/assets/p6.png',
//     'lib/assets/p7.png','lib/assets/p8.png','lib/assets/p9.png',
//     'lib/assets/p10.png','lib/assets/p11.png','lib/assets/p12.png',
//     'lib/assets/p13.png','lib/assets/p14.png','lib/assets/p15.png',
//     'lib/assets/p16.png','lib/assets/p17.png','lib/assets/p18.png',
//     'lib/assets/p19.png','lib/assets/p20.png','lib/assets/p21.png',
//     'lib/assets/p22.png','lib/assets/p23.png','lib/assets/p24.png',
//     'lib/assets/p25.png','lib/assets/p26.png','lib/assets/p27.png',
//     'lib/assets/p28.png','lib/assets/p29.png','lib/assets/p30.png',
//     'lib/assets/p31.png','lib/assets/p32.png','lib/assets/p33.png',
//     'lib/assets/p34.png','lib/assets/p35.png','lib/assets/p36.png',
//     'lib/assets/p37.png','lib/assets/p38.png',

//   ];
//   List<int> price=[
//     55,65,100,120,20,60,10,30,40,30,80,60,70,60,50,70,80,20,90,30,500,20,80,70,90,60,70,100,80,120,100,80,100,80,60,50,70,100
//   ];
//   List<int> favor=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: plants.doc(id).snapshots(),
      builder: (context,AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return new Text("Loading");
        }
        final plantdata=snapshot.data;
        return Scaffold(
          appBar: AppBar(actions: [IconButton(onPressed: (){}, icon: Icon(Icons.add_shopping_cart_sharp))],),
            body: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height/1.8,
                  child: Image.asset(plantdata['image']),
                ),
                !plantdata.data().containsKey("Name")?Text('plant $id',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25 )):Text(plantdata['Name'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25 )),
                !plantdata.data().containsKey("disc")?Text('Money plant'):Text(plantdata['disc']),
                Container(
                  height: (MediaQuery.of(context).size.height-(MediaQuery.of(context).size.height/1.8))-170,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.green),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Icon(Icons.height_outlined),
                                Text('Height'),
                                !plantdata.data().containsKey("height")?Text(''):Text(plantdata['height'])
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Icon(Icons.thermostat),
                              Text('Temperature'),
                              !plantdata.data().containsKey("Temp")?Text(''):Text(plantdata['Temp'])
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.takeout_dining_sharp),
                              Text('Pot'),
                              !plantdata.data().containsKey("pot")?Text(''):Text(plantdata['pot'])
                            ],
                          )
                        ],
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Text('Total Price'),
                          Padding(
                            padding: const EdgeInsets.only(left:10.0),
                            child: Text('Total Price \n\$${plantdata['price']}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25 )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right:10.0,bottom: 10),
                            child: InkWell(
                              child: Container(
                                height: 80,
                                width: 180,
                                child: Center(child: Text('Add to Cart',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20 ))),
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color:Colors.green[900] ),
                              ),
                            )
                            // TextButton(onPressed: (){
                              
                            // }, child: Container(
                            
                            //   height: 50,
                            //   child: Center(child: Text('Add to Cart',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20 )))),
                            //   style:ButtonStyle(minimumSize:MaterialStateProperty.all(Size(200, 80)) ,
                            //   backgroundColor: MaterialStateProperty.all(Colors.green[900]),iconSize: MaterialStateProperty.all(210),),),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
        );
      }
    );
  }
}