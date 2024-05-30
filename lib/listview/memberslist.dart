import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../assets/user.dart';


class MembersList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MembersList();
}

class _MembersList extends State<MembersList> {


  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
          itemBuilder: (BuildContext context, int index){
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(
                  users[index].image,
                ),
              ),
              title: Text(users[index].name),
              subtitle: Text(users[index].prof),
            );
          },
          separatorBuilder:(BuildContext context,int index){
            return SizedBox(height: 8);
      },
          itemCount: users.length),
    );
  }
}
