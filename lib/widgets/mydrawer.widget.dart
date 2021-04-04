import 'package:flutter/material.dart';
import 'drawer.header.widget.dart';
import 'drawer.item.widget.dart';
class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
    child: ListView(
     children: [
     DrawerHeaderWidget(),
      ListTile(
        onTap:(){
          Navigator.pop(context);
          Navigator.pushNamed(context, "/");
        },
        leading: Icon(Icons.home_outlined,color:Colors.lightGreen),
        trailing: Icon(Icons.arrow_right,color: Colors.lightGreen,),
        title: Text("Home",style: TextStyle(fontSize: 18,color:Colors.black),),

      ),
       ListTile(
         onTap:(){
           Navigator.pop(context);
           Navigator.pushNamed(context, "/counter");
         },
         leading: Icon(Icons.calculate_outlined,color:Colors.lightGreen),
         trailing: Icon(Icons.arrow_right,color: Colors.lightGreen,),
         title: Text("Counter",style: TextStyle(fontSize: 18,color:Colors.black),),

       ),
       ListTile(
         onTap:(){
           Navigator.pop(context);
           Navigator.pushNamed(context, "/contacts");
         },
         leading: Icon(Icons.contacts_outlined,color:Colors.lightGreen),
         trailing: Icon(Icons.arrow_right,color: Colors.lightGreen,),
         title: Text("Contacts",style: TextStyle(fontSize: 18,color:Colors.black),),

       ),
       ListTile(
         onTap:(){
           Navigator.pop(context);
           Navigator.pushNamed(context, "/meteo");
         },
         leading: Icon(Icons.wb_sunny_outlined,color:Colors.lightGreen),
         trailing: Icon(Icons.arrow_right,color: Colors.lightGreen,),
         title: Text("Meteo",style: TextStyle(fontSize: 18,color:Colors.black),),

       ),
       ListTile(
         onTap:(){
           Navigator.pop(context);
           Navigator.pushNamed(context, "/gallery");
         },
         leading: Icon(Icons.photo_library_sharp,color:Colors.lightGreen),
         trailing: Icon(Icons.arrow_right,color: Colors.lightGreen,),
         title: Text("Gallery",style: TextStyle(fontSize: 18,color:Colors.black),),

       ),
     ],
    ),
    );
  }
}
