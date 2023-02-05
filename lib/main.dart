import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  bool _value = false;
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: MyAppp()),
            Expanded(
              child: MergeSemantics(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Checkbox(
                      value: _value,
                      onChanged: (bool? value) {
                        setState(() {
                          _value = value ?? false;
                        });
                      },
                    ),
                    const Text('Settings'),
                  ],
                ),
              ),
            ),
            // Expanded(
            //   child: Semantics(
            //     child: Container(
            //       color: Colors.cyan,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool selected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: GestureDetector(
        onTap: () {
          setState(() {
            selected =
                !selected; //false ifadeyi kolayca true yapmak için başına ünlem koydu
          });
        },
        child: Center(
          child: AnimatedContainer(
            width: selected
                ? 200.0
                : 100.0, //seçim işte false mesela ilk o yüzden 200 verdi burda sanırım false mı true mu onu sorguluyor ona göre bir değer veriyor çok iyi
            height: selected ? 100.0 : 200.0,
            color: selected ? Colors.black : Colors.white,
            alignment:
                selected ? Alignment.center : AlignmentDirectional.topCenter,
            duration: const Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
            child: Icon(
              Icons.tag_faces_sharp,
              size: 50,
            ),
          ),
        ),
      ),
    );
  }
}

class MyAppp extends StatelessWidget {
  const MyAppp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
    );
  }
}
