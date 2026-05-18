import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        
        body:Container(
          height:double.infinity,
          
          width:double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin:Alignment.topLeft,
              end:Alignment.bottomRight,
              colors:[
                Color(0xff6F1DFF), 
                Color(0xff4B179C), 
                Color(0xff140B34),
              ]
            )
          ),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("V1.0",style:TextStyle(
                    color:Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  ),),
                ],),
              SizedBox(height: h*0.2,),
              Image.asset("assets/logo.png",height:0.3*h,width:0.6*w,),
              SizedBox(height: h*0.02,),
              Text("VELORA",style:TextStyle(
                color:Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height: h*0.3,),
              Text(
                "© 2026 Velora",
                style: TextStyle(
                  color: Colors.white60,
                  fontSize: 13,
                ),
              ),
              Text(
                "Version 1.0.0",
                style: TextStyle(
                  color: Colors.white38,
                  fontSize: 12,
                ),
              ),



            ]
          )
        )
      )
    );
  }
}
