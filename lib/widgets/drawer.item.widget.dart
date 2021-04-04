import 'package:flutter/material.dart';

class DrawerItemWidget extends StatelessWidget {
  String title;
  String route;
  Icon icon;

  DrawerItemWidget(this.title,this.route,this.icon);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        Navigator.pop(context);
        Navigator.pushNamed(context, route);
      },
      leading: icon,
      trailing:Icon(Icons.arrow_right,color: Colors.deepPurple),
      title: Text(title, style: TextStyle(fontSize: 18,color:Colors.deepPurple),),
    );
  }
}
