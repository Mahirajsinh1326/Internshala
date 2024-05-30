import 'package:flutter/material.dart';

class BtnList extends StatefulWidget {


  @override
  _BtnList createState() => _BtnList();
}

class _BtnList extends State<BtnList> {
  bool status = true;
  bool isExpanded = true;
  int current = 0;
  final List<String> items = ['outdoor', 'Outdoor', 'outdoor', 'outdoor', '+1'];


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      // Set the height of the container to fit the buttons
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        // Set the scroll direction to horizontal
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {

                    current = index;
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  width: 90,
                  height: 5,
                  alignment: Alignment.center,
                  child: Text(
                    items[index],
                    style: TextStyle(
                      color: current == index? Color(0xffef456f) : Color(0xffef456f),
                      fontWeight:current == index? FontWeight.normal :FontWeight.normal,
                      fontSize:current == index? 17 :15,
                    ),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffef456f)),
                    borderRadius: BorderRadius.circular(100),
                    gradient: current == index
                        ? LinearGradient(
                      colors: [ // #cdc4f3
                        Color(0xFFac9ef6), // #ac9ef6
                        Color(0xFF9f8ef6), // #9f8ef6
                        Color(0xFFcf91e6), // #cf91e6
                        Color(0xFFf97fc3), // #f97fc3
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                        : LinearGradient(
                      colors: [
                        Color(0xfff7f7f9),
                        Color(0xfff7f7f9),
                        Color(0xfff7f7f9),
                        Color(0xfff7f7f9),
                        Color(0xfff7f7f9),
                        // #cdc4f3// #f97fc3
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
              )
          );
        },
      ),
    );
  }
}
