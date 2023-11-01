// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mr_plant/page1.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  late int flag=1;
  void initState() {
    setState(() {
      
    flag=1;
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    if (flag==4){
    setState(() {
      flag=1;
    });

    }
    return Scaffold(
      appBar: AppBar(actions: [TextButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>homepage()));},
      child: Text('SKIP'))],),
      body: Column(
        children: [
          Center(child: Container(
            height: MediaQuery.of(context).size.height/1.8,
            child: Image(image: AssetImage(flag==1?'lib/assets/image1.png':flag==2?'lib/assets/image2.png':'lib/assets/image3.png')),)),
          SizedBox(height: 20,child: Container(
            child: Wrap(children: [
              InkWell(
                child: Container(
                  width:flag==1?20:8 ,
                  height: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  color: Colors.grey,
                  ),
                ),
                onTap: (){
                  setState(() {
                    if(flag==2){
                      flag--;
                    }
                      else if(flag==3){
                        flag-=2;
                      }
                  });
                },
              ),
              SizedBox(width: 5,),
              InkWell(
                child: Container(
                  height: 8,
                   decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  color: Colors.grey,
                  ),
                  width:flag==2?20:8 ,
                ),
                onTap: (){
                  setState(() {
                    if(flag==1){
                      flag++;
                    }
                      else if(flag==3){
                        flag--;
                      }
                  });
                },
              ),
              SizedBox(width: 5,),
              InkWell(
                child: Container(
                  height: 8,
                   decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  color: Colors.grey,
                  ),
                  width:flag==3?20:8 ,
                ),
                onTap: (){
                  setState(() {
                    if(flag==2){
                      flag++;
                    }
                      else if(flag==1){
                        flag+=2;
                      }
                  });
                },
              )
            ]),
          ),),
          // RichText(text: text)
          Text('Enjoy your \nLife with Plants',style: TextStyle(fontSize: 40),)
        ],
      ),
  floatingActionButton: FloatingActionButton(
    onPressed: (){
      if (flag+1==4){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>homepage()));
      }
      setState(() {
      flag++;
        
      });
      
    },
    child: Icon(Icons.arrow_forward_rounded),),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
    
  }
}