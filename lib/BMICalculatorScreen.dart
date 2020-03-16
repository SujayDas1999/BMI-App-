import 'package:bmiapp/BMIModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bmiapp/ResultScreen.dart';

 class BMICalculatorScreen extends StatefulWidget {
   @override
   _BMICalculatorScreenState createState() => _BMICalculatorScreenState();
 }
 
 class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
   double _heightOfUser = 175.0;
   double _weightOfUser = 40.0;
   double _bmi = 0.0;

   BMIModel _bmiModel = new BMIModel(); 


   @override
   Widget build(BuildContext context) {
     return Scaffold(
       body: SingleChildScrollView(
         child:Container(
           width: double.infinity,
           padding: EdgeInsets.all(32),
           child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
           children: <Widget>[
             SvgPicture.asset("images/heart.svg",fit:BoxFit.contain,width:200.0,height:200.0),
             SizedBox(
               height: 8,
               ),
             Text("BMI Calculator", style:TextStyle(color: Colors.red, fontSize:28, fontWeight: FontWeight.w700),
             ),
             Text("We care about your health just like your mother", textAlign: TextAlign.center,  style:TextStyle(color: Colors.grey, fontSize:15, fontWeight: FontWeight.w300)),
            SizedBox(
               height: 8,
               ),
             Text("Set your height(cms)", style:TextStyle(color: Colors.pink, fontSize:24, fontWeight: FontWeight.w700),
             ),
            Container(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Slider(
                activeColor: Colors.green,
                min: 0.0,
                max: 250.0,
                onChanged: (height){
                  setState((){
                    _heightOfUser = height;
                  });
                },
              value: _heightOfUser,
              divisions: 100,
              label: "$_heightOfUser",   
              ),  
            ),
            Text("$_heightOfUser cm",style:TextStyle(color: Colors.blue, fontSize: 24, fontWeight: FontWeight.w400)),



            SizedBox(
               height: 8,
             ), 

             Text("Set your weight(kgs)", style:TextStyle(color: Colors.pink, fontSize: 24, fontWeight: FontWeight.w700)),
             SizedBox(
               height: 8,
             ),
             Container(
               padding: EdgeInsets.only(left: 16, right: 16),
               child: Slider(
                 activeColor: Colors.green,
                 min: 0.0,
                 max: 120.0,
                 onChanged: (weight){
                   setState(() {
                     _weightOfUser = weight;
                   });
                 },
                 value: _weightOfUser,
                 divisions: 100,
                 label: "$_weightOfUser",
               ), 
             ),
             Text("$_weightOfUser kg", style: TextStyle(color: Colors.blue, fontSize: 24, fontWeight: FontWeight.w400)), 

            SizedBox(
               
               height: 15,
             
             ),

             
          
              Container(
                child: FlatButton.icon(
                onPressed: (){
                  setState(() {
                    _bmi = _weightOfUser/((_heightOfUser/100)*(_heightOfUser/100));
                    
                     if(_bmi >= 18.5 && _bmi <= 25){
                       _bmiModel = BMIModel(bmi:_bmi, isNormal: true, comments:"Yes !! You  are fit!");
                    }else if(_bmi < 18){
                        _bmiModel = BMIModel(bmi: _bmi, isNormal: false, comments:"Oh No! You  are underweight");
                     }else if(_bmi > 25 && _bmi <=30){
                        _bmiModel = BMIModel(bmi: _bmi, isNormal: false, comments:"Oh No! You  are Over weight");
                     }else{
                        _bmiModel = BMIModel(bmi: _bmi, isNormal: false, comments:"Oh No! You  are Obese");
                     }    

                  });

                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => ResultScreen(bmiModel: _bmiModel,)
                  ));
                },
                icon: Icon(Icons.fast_forward, color: Colors.white,),
                label: Text("Calculate your BMI"),
                color: Colors.purpleAccent,
                textColor: Colors.white,
                ),
                width: double.infinity,
                padding: EdgeInsets.only(left:16, right:16),
              ),




           ],
           ),
       ),
         ),
     );
   }
 }