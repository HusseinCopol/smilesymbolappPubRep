

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'MainPage/MainPage.dart';
import 'MainPage/BlueTooth.dart';
//import 'package:flutterapp2/Admin/AdminBottomNavigator.dart';
import 'MainPage/BlueTooth.dart';
//import 'package:flutterapp2/Worker/Worker/WorkerMainPage.dart';
//Global variables
//List <OrderandOutputDiffrenceObj> _items=[];



//String _role;
TextEditingController customControllerUsername = TextEditingController();
TextEditingController customControllerPassword = TextEditingController();

///////////////////////////////



///////////////////////////


//maybe put it in anther class
///////////////////////////////////////////
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'You Smile Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPageMain(),
    );





  }
}



///////////////////////////////////////////


class LoginPageMain extends StatefulWidget {

  @override
  _LoginPageMainState createState() => _LoginPageMainState();
}

class _LoginPageMainState extends State<LoginPageMain> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchItems();
  }



  @override
  Widget build(BuildContext context) {
    return

      Container(
        //color: Colors.white,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("Images/back2.jpg"), fit: BoxFit.cover)),
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
             Image.asset(
               'Images/YouSmilelogo.png',
               width: 400,
               height: 290,
             ),

              SizedBox(
                height: 5,
              ),
              SizedBox(
                width: 270,
                child: Column(

                  children: [

                    TextField(

                      style: new TextStyle(color: Colors.white),
                      keyboardType: TextInputType.text,
                      decoration: new InputDecoration(

                        //border: InputBorder.none,
                        // focusedBorder: InputBorder.none,
                        //  enabledBorder: InputBorder.none,
                        //  errorBorder: InputBorder.none,
                        //   disabledBorder: InputBorder.none,

                        contentPadding:
                        EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                        //    focusedBorder: OutlineInputBorder(
                        //      borderSide: BorderSide(color: Colors.white),
                        //      borderRadius: BorderRadius.circular(25.7),
                        //    ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(25.7),
                        ),
                        hintText: "user name",
                        hintStyle: TextStyle(fontSize: 15.0, color: Colors.white30),


                      ),
                      controller:customControllerUsername ,
                    ),
                    SizedBox(
                      height: 75,
                    ),
                    TextField(

                      style: new TextStyle(color: Colors.white),
                      keyboardType: TextInputType.text,
                      decoration: new InputDecoration(

                        //border: InputBorder.none,
                        // focusedBorder: InputBorder.none,
                        //  enabledBorder: InputBorder.none,
                        //  errorBorder: InputBorder.none,
                        //   disabledBorder: InputBorder.none,

                        contentPadding:
                        EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                        //    focusedBorder: OutlineInputBorder(
                        //      borderSide: BorderSide(color: Colors.white),
                        //      borderRadius: BorderRadius.circular(25.7),
                        //    ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(25.7),
                        ),
                        hintText: "password",
                        hintStyle: TextStyle(fontSize: 15.0, color: Colors.white30),


                      ),
                      controller:customControllerPassword ,
                    ),
                    SizedBox(
                      height: 90,
                    ),
                    MaterialButton(

                      color: Colors.orangeAccent,
                      elevation: 5.0,
                      child: Text("login"
                        ,style: TextStyle(color: Colors.white,fontSize: 16),),
                      onPressed: () async{
                        String username=customControllerUsername.text.toString();
                        String password=customControllerPassword.text.toString();
                        var role = "admin";
                        print(role);
                        if(role =="admin")
                        {
                          print("koko");
                         Navigator.of(context).push(MaterialPageRoute(
                             builder: (context)=>BlueTooth()
                         ));
                        }

                      },
                    ) ,
                    SizedBox(
                      height: 50,
                    ),

                  ],

                ),
              ),

            ],
          ),
        ),

      )
    ;
  }
  //connection to server
  void fetchItems() async
  {
    // _items.clear();
    // //for the order list
    // String url ="http://www.husseincopol.com/copolapi/selectDiffrenceOrderOutputForAdmin.php";
    // Response response =await get(url);
    // setState(() {
    //   var productJson=json.decode(utf8.decode(response.bodyBytes));

    //   for (var i in productJson)
    //   {
    //   //  var diffItem=OrderandOutputDiffrenceObj(i["name"],i["OUTQ"],i["ORDQO"],i["DIFF"]);
    //    // _items.add(diffItem);
    //   }
    // });


  }

}





