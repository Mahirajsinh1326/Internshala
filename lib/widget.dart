import 'package:flutter/material.dart';
import 'assets/user.dart';

class ListTileWidget extends StatefulWidget {
  final int index;

  const ListTileWidget({Key? key, required this.index}) : super(key: key);

  @override
  State<ListTileWidget> createState() => _ListTileWidgetState();
}

class _ListTileWidgetState extends State<ListTileWidget> {
  bool button = true;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(
          users[widget.index].image,
        ),
      ),
      title: Text(users[widget.index].name),
      subtitle: Text(users[widget.index].prof),
      trailing: button == true
          ? InkWell(
        onTap: () {
          setState(() {
            button = !button;
          });
        },
        child: Container(
          alignment: Alignment.center,
          width: 80,
          height: 40,
          child: Text(
            'Follow',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Color(0xFFef456f),
          ),
        ),
      )
          : InkWell(
        onTap: () {
          setState(() {
            button = !button;
          });
        },
        child: Container(
          alignment: Alignment.center,
          width: 80,
          height: 40,
          child: Text(
            'Following',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
