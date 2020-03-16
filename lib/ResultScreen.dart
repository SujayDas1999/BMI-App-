import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResultScreen extends StatelessWidget {
final bmiModel;

ResultScreen({this.bmiModel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pop(context);
        },
        child: Icon(
          Icons.backspace,
          color: Colors.white,
        )
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.all(20.0),
          child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.center, 
             children: <Widget>[
                SizedBox(
                 height:18,
               ),
               
               Container(
                 height: 200,
                 width: 200,
                 child: bmiModel.isNormal ? SvgPicture.asset('images/smile.svg', fit: BoxFit.contain) : SvgPicture.asset('images/sad.svg', fit: BoxFit.contain,)

               ),
               SizedBox(
                 height:18,
               ),
               Text('Your BMI is ${bmiModel.bmi.round()}', style:TextStyle(color: Colors.red, fontSize:34, fontWeight: FontWeight.w700),),
               
               SizedBox(
                 height:8,
               ),
               
               Text('${bmiModel.comments}',style:TextStyle(color: Colors.pink, fontSize:20, fontWeight: FontWeight.w400),),
               SizedBox(
                 height:8,
               ),
               bmiModel.isNormal ?
               Text("Hurray! Your BMI is Normal!", style: TextStyle(color: Colors.green,fontSize: 15, fontWeight: FontWeight.w700),)
                :
                Text("Sadly your BMI is not normal.", style: TextStyle(color: Colors.red,fontSize: 15, fontWeight: FontWeight.w700),),

             
             
             ], 
          ),
        ),
      );
      
  }
}