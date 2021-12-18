

import 'dart:js';

//import 'package:contactapp/contactDetails.dart';
import 'package:contactapp/models/contact.dart';
import 'package:contactapp/models/contactdetails.dart';
import 'package:contactapp/models/pages/deleteContact.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({ Key? key }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}


class _HomeViewState extends State<HomeView> {
  final Contactapp = [
Contact(name: "K Fat", number: "+233543413159",email: "fatimah@gmail.com",id: "1"),
Contact(name: "Miss Bela", number: "+233243113109",email: "missbela@gmail.com",id: "1"),
Contact(name: "Abu Nima", number: "+233203163107",email: "nimaadu@gmail.com",id: "1"),
Contact(name: "Mr Ben", number: "+233593712189",email: "mrben@gmail.com",id: "1"),
  ];

  int _SelectedIndex=0;
  void isSeleted(int index){
    setState(() {
     _SelectedIndex= index;
    });
  }
List ViewList=[

];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Contact",style: Theme.of(context).appBarTheme.titleTextStyle),
        bottom:const PreferredSize(
          child: TextField(
            decoration: InputDecoration(
              //border:InputBorder (),
              hintText: "Search contact",
              icon: Icon(Icons.search)
            ),
          ) ,
          preferredSize: Size.fromHeight(30),
          ),
      ),
      bottomNavigationBar: BottomNavigationBar(items:const [
        BottomNavigationBarItem(icon: Icon(Icons.favorite),label: "Favorites"),
           BottomNavigationBarItem(icon: Icon(Icons.timer),label: "Timer"),
              BottomNavigationBarItem(icon: Icon(Icons.contacts),label: "Contacts"),
                 BottomNavigationBarItem(icon: Icon(Icons.voicemail),label: "Voicemail"),
      ],
      //selectedItemColor: Theme.of(context).,
      selectedIconTheme: Theme.of(context).bottomNavigationBarTheme.selectedIconTheme,
      backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
      currentIndex: _SelectedIndex,
      onTap: isSeleted,
      ),

      body: ListView.builder(itemBuilder: (context,index){
        return Dismissible(
          key: UniqueKey(),
          background: Container(
            color: Colors.red,
            child: Icon(Icons.delete),
          ),
          direction: DismissDirection.endToStart,
          confirmDismiss: (direction)async{
            var result = await showDialog(
              context:(context),builder: (context) => DeleteContact());
              return result;
          },
          onDismissed: (direction){
setState(() {});
          },
          child: InkWell(
            onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return ContactDetails();
                }));
              } ,
            child: ListTile(
              title: Text(" Fat",style: Theme.of(context).textTheme.bodyText1),
              subtitle:Text("+233545383121",style: Theme.of(context).textTheme.bodyText2),
              trailing:  IconButton(onPressed: (){
                showModalBottomSheet(context: context, builder: (context)=>Column(children: [
                  TextButton(onPressed: (){
                  }, child:const Text('Edit')),
                ],),);
              },icon:const Icon(Icons.more_horiz),
               ),
            ),
          ),
        );
      },
      ),
    );
  }
}