import 'package:flutter/material.dart';
import 'package:recipee_application/pages/home_page.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Colors.black,
          body: Column(
        children: [
          Container(
         
           height: 500,
            child: Image.asset("/Users/shahiyankhan/flutterVScode/recipee_application/assets/images/food_image.jpeg",
            fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
           
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,  
             children:[
                Text("Cook Like", style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),),
                const SizedBox(
                  height: 10,
                ),
                Text("a Chef 🥣", style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),),
           
            
             ],
           ),
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(onPressed: (){
           Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const HomePage()),
  );
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
            padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
            textStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ), child: Text("Get Started")),
     ],
      )),
    );
  }
}
