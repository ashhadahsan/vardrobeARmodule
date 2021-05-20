import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ArCoreController arCoreController;
  ArCoreNode node;

  void dipsose(){
    super.dispose();
    arCoreController.dispose();
  }

  _onArCoreViewCreated(ArCoreController controller){
    arCoreController = controller;

    //IDR CONDITIONS DALKR SHOW KRWA DEN WRNA DONO AKHTAY SHOW HUNGE
    _addDuck(arCoreController); //For the Duck model
    _addGator(arCoreController);
    //arCoreController.onPlaneDetected = _handleOnPlaneDetected;
  }

  _addGator(ArCoreController controller)
  {
    final node = ArCoreReferenceNode(
      name: 'Toon',
        object3DFileName: 'Toon.sfb',
      scale: vector.Vector3(0.5,0.5,0.5),
      position: vector.Vector3(0,-1,-1),
      rotation: vector.Vector4(0,180,0,0),
    );
    controller.addArCoreNode(node);
  }



  _addDuck(ArCoreController controller){
    final node = ArCoreReferenceNode(
      name: 'Duck',
        objectUrl:
        "https://github.com/KhronosGroup/glTF-Sample-Models/raw/master/2.0/Duck/glTF/Duck.gltf",
      scale: vector.Vector3(0.5,0.5,0.5),
      position: vector.Vector3(0,-1,-1),
      rotation: vector.Vector4(0,180,0,0),
    );
    controller.addArCoreNode(node);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ArCoreView(onArCoreViewCreated: _onArCoreViewCreated,
        enableUpdateListener: true,),
    );
  }
}