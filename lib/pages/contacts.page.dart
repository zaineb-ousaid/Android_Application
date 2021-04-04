import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/pages/repositories/home.page.dart';
import 'package:http/http.dart' as http;
class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  String query;
  bool notVisible=false;

  TextEditingController queryTextEditingController=new TextEditingController();
  dynamic data;
  int currentPage=0;
  int totalPages=0;
  int pageSize=20;
  List<dynamic>items=[];

  ScrollController scrollController=new ScrollController();

  void _search(String query) {
    String url="https://api.github.com/search/users?q=${query}&per_page=$pageSize&page=$currentPage";
   print(url);
    http.get(Uri.parse(url))
        .then((response){
          setState(() {
            this.data=json.decode(response.body);
            this.items.addAll(data['items']);
            if(data['total_count'] % pageSize ==0){
              totalPages=data['total_count']~/pageSize;
            }else totalPages=(data['total_count']~/pageSize).floor() +1;

          });
    })
    .catchError((err){
      print(err);
    });

  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      if(scrollController.position.pixels==scrollController.position.maxScrollExtent){
        setState(() {
          if(currentPage<totalPages){
            ++currentPage;
            _search(query);
          }

        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User : $query => $currentPage / $totalPages" ),),
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
               children: [
                 Expanded(
                   child: Container(
                       padding: EdgeInsets.all(10),
                       child:TextFormField(
                         obscureText: notVisible,
                         onChanged: (value){
                           setState(() {
                             this.query=value;
                           });
                         },
                         controller: queryTextEditingController,
                         decoration: InputDecoration(
                           suffixIcon: IconButton(
                             onPressed: (){
                               setState(() {
                                 notVisible=!notVisible;
                               });
                             },
                             icon:Icon(
                                 notVisible==true?Icons.visibility_off_outlined:Icons.visibility_outlined
                             ),
                           ),
                             contentPadding: EdgeInsets.only(left: 20),
                             border: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(50),
                                 borderSide: BorderSide(
                                     width: 1,
                                     color:Colors.lightGreen
                                 )
                             )
                         ),
                       )
                   ),
                 ),
                IconButton(
                    icon: Icon(Icons.person_search,color: Colors.lightGreen,),
                    onPressed: (){
                     setState(() {
                       this.query=queryTextEditingController.text;
                     _search(query);
                     });
                    }),
                 
               ],
            ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context,index)=>
                  Divider(height: 2,color:Colors.lightGreen),
              controller : scrollController,
              itemCount:items.length,
              itemBuilder: (context,index){
                return ListTile(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder:
                        (context)=>GitRepositoriesPage(
                          login:items[index]['login'] ,
                          avataUrl: items[index]['avatar_url'],
                        )));
                  },
                 title: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Row(
                       children: [
                         CircleAvatar(
                           backgroundImage: NetworkImage(items[index]['avatar_url']),
                           radius: 40,
                         ),
                        SizedBox(width:20,),
                         Text("${items[index]['login']}"),
                       ],
                     ),
                     CircleAvatar(
                       child:Text("${items[index]['score']}"),
                     )
                   ],
                 ),
                );
              }
            ),
          )
          ],
        ),
      ),
    );
  }

}
