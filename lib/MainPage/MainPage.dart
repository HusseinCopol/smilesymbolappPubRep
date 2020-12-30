

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';






///////////////////////////
final FlutterBlue flutterBlue = FlutterBlue.instance;





///////////////////////////////////////////
class MainPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {





    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPageState(),
    );
  }
}



///////////////////////////////////////////


class MainPageState extends StatefulWidget {
  final List<BluetoothDevice> devicesList = [];
  @override
  _MainPageStateState createState() => _MainPageStateState();
}

class _MainPageStateState extends State<MainPageState> {

  @override
  void initState()  {
    // TODO: implement initState

    super.initState();

    flutterBlue.connectedDevices
        .asStream()
        .listen((List<BluetoothDevice> devices) {
      for (BluetoothDevice device in devices) {
        _addDeviceTolist(device);
      }
    });
    flutterBlue.scanResults.listen((List<ScanResult> results) {
      for (ScanResult result in results) {
        _addDeviceTolist(result.device);
      }
    });
    flutterBlue.startScan();



    //print(d);

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

          backgroundColor: Colors.transparent,

          appBar: AppBar(
            title: Text("Smile Symbol"),
          ),
          body:_buildListViewOfDevices()



        ),

      )
    ;
  }
  //connection to server



  _addDeviceTolist(final BluetoothDevice device) {
    if (!widget.devicesList.contains(device)) {
      setState(() {
        widget.devicesList.add(device);
      });
    }
  }

  ListView _buildListViewOfDevices() {
    List<Container> containers =[];
    for (BluetoothDevice device in widget.devicesList) {
      containers.add(
        Container(
          height: 50,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    Text(device.name == '' ? '(unknown device)' : device.name),
                    Text(device.id.toString()),
                  ],
                ),
              ),
              FlatButton(
                color: Colors.blue,
                child: Text(
                  'Connect',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {

                },
              ),
            ],
          ),
        ),
      );
    }

    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        ...containers,
      ],
    );
  }




}





