import 'package:flutter/material.dart';

class Data {
  final String name;
  final String username;
  final String phone;
  final String email;
  Data(this.name, this.username, this.phone, this.email);
}

class Display extends StatefulWidget {
  String? name;
  String? username;
  String? phone;
  String? email;
  Display({super.key, this.name, this.username, this.phone, this.email});

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Data;
    return Scaffold(
      appBar: AppBar(
        title: Text("Display Data"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Container(
          margin: EdgeInsets.all(20),
          height: 200,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.all(Radius.elliptical(10, 10)),
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                args.name,
                style: TextStyle(fontSize: 20),
              ),
              Text(
                args.username,
                style: TextStyle(fontSize: 20),
              ),
              Text(
                args.phone,
                style: TextStyle(fontSize: 20),
              ),
              Text(
                args.email,
                style: TextStyle(fontSize: 20),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Move back",style: TextStyle(fontSize: 20),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
