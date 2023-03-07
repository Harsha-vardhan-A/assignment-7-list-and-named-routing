import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:list_and_routing/screens/display.dart';
class ListData extends StatefulWidget {
  const ListData({super.key});

  @override
  State<ListData> createState() => _ListDataState();
}

class _ListDataState extends State<ListData> {
  List list=[];
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      getMethod();
    });
  }
  getMethod() async
  {
    try{
    String url="https://jsonplaceholder.typicode.com/users";
    final response= await http.get(Uri.parse(url));
    final res=await jsonDecode(response.body);

    setState(() {
       list=res;
    });
    }
    catch(e)
    {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Data"),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: list.length,
          
          itemBuilder: (context, index) {
            return ListTile(
              minVerticalPadding: 20, 
              title: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name:- ${list[index]['name']}',style: TextStyle(fontSize: 20),),
                  Text('UserName:- ${list[index]['username']}',style: TextStyle(fontSize: 20)),
                  Text('Email:- ${list[index]['email']}',style: TextStyle(fontSize: 20)),
                  Text('Phone:- ${list[index]['phone']}',style: TextStyle(fontSize: 20)),
                  Text('Company:- ${list[index]['company']['name']}',style: TextStyle(fontSize: 20)),
                  ElevatedButton(
                    
                    child: Text("move to show"),
                    onPressed: (){
                      Navigator.pushNamed(context, '/display',arguments: Data(list[index]['name'],list[index]['username'],list[index]['phone'],list[index]['email']));
                    },
                  )
                ],
              ),
              selectedColor: Color.fromARGB(255, 10, 70, 120),
              selectedTileColor: Color.fromARGB(255, 185, 209, 239),
              selected: true,
            );
            
          },
        ),
      ),
    );
  }
}