import 'package:flutter/material.dart';
import 'package:list_android_os/AndroidOs.dart';
import 'package:list_android_os/StatefullScreen.dart';

final List<AndroidOs> listAndroid = [
  AndroidOs("Kitkat", "4.4", "assets/images/kitkat.png"),
  AndroidOs("Lollipop", "5.0", "assets/images/lolipop.png"),
  AndroidOs("Marshmallow", "6.0", "assets/images/marshmallow.png"),
  AndroidOs("Nougat", "7.0", "assets/images/nougat.png"),
  AndroidOs("Oreo", "8.0", "assets/images/oreo.png"),
  AndroidOs("Pie", "9.0", "assets/images/pie.png"),
  AndroidOs("Android 10", "10.0", "assets/images/android_10.png"),
  AndroidOs("Android 11", "11.0", "assets/images/android_11.png"),
  AndroidOs("Android 12", "12.0", "assets/images/android_12.png"),
  AndroidOs("Android 13", "13.0", "assets/images/android_13.png"),
];

void main() {
  runApp(MyApp(listAndroid));
}

class MyApp extends StatelessWidget {
  final List<AndroidOs> list;

  const MyApp(this.list, {super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'List Android Home Page', list: list,),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final List<AndroidOs> list;

  const MyHomePage({super.key, required this.title, required this.list});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
          actions: [
            IconButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const StatefullScreen();
              }));
            }, icon: const Icon(Icons.navigate_next)),
          ],
        ),
        body: ListView.builder(
          itemCount: listAndroid.length,
          itemBuilder: (context, index) {
            return Card(
              child: Row(
                children: [
              Image.asset(
              listAndroid[index].imagePath,
                width: 100,
                height: 100,
              ),
              Padding(padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(listAndroid[index].name),
                    Text(listAndroid[index].version),
                  ],
                ),),
              ],
            ),);
          },
        )
    );
  }
}
