import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:internshala/listview/btnlist.dart';
import 'package:internshala/listview/imagelist.dart';
import 'package:internshala/widget.dart';

import 'assets/user.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(

      enableDrag: true,
      showDragHandle: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildOption(context, Iconsax.link, 'Invite', () {
                // Handle Invite action
                Navigator.pop(context);
              }),
              _buildOption(context, Iconsax.user_add, 'Add member', () {
                // Handle Add member action
                Navigator.pop(context);
              }),
              _buildOption(context, Iconsax.people, 'Add Group', () {
                // Handle Add Group action
                Navigator.pop(context);
              }),
            ],
          ),
        );
      },
    );
  }

  Widget _buildOption(
      BuildContext context, IconData icon, String text, Function onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: () {},
    );
  }

  bool _value = false;
  late ScrollController _scrollController;
  var top = 0.0;
  bool powerOn = false;
  void Function(bool)? onChanged;
  bool _isSearching = false;
  bool _folded = true;
  bool button = true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              elevation: 4,
              expandedHeight: 200,
              pinned: true,
              flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                top = constraints.biggest.height;
                return Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Color(0xFFc32422),
                          Color(0xFFc32422),
                        ],
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(1.0, 0.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                  child: FlexibleSpaceBar(
                    collapseMode: CollapseMode.parallax,
                    centerTitle: true,
                    title: Stack(
                      children: [
                        Positioned(
                          right: 0,
                          child: InkWell(
                            child: Icon(
                              Icons.more_vert,
                              size: 30,
                              color: Colors.white,
                            ),
                            onTap: () {
                              _showBottomSheet(context);
                            },
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AnimatedOpacity(
                              opacity: top <= 110.0 ? 1.0 : 0,
                              duration: Duration(milliseconds: 300),
                              child: Row(
                                children: [
                                  SizedBox(width: 12),
                                  Container(
                                    width: 80,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0xFFc32422),
                                            blurRadius: 1.0,
                                          ),
                                        ],
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                                "https://d12d6l12s3d372.cloudfront.net/the_weeknd_day_superbowl_e149958f33.png"))),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            'The Weeknd',
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.white),
                                          ),
                                          Text("Community . +11k members",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    background: Image(
                      image: NetworkImage(
                        "https://d12d6l12s3d372.cloudfront.net/the_weeknd_day_superbowl_e149958f33.png",
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              }),
            ),
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 60,
                      color: Color(0xFFc32422),
                      child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, top: 8.0, right: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'The Weeknd',
                                    style: TextStyle(
                                        fontSize: 20.0, color: Colors.white),
                                  ),
                                  Icon(
                                    Icons.share,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                              Text(
                                "Community . +11k members",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        child: Text(
                            "Toronto Declares 'The Weeknd Day' to Honor Singer's Super Bowl Performance. "
                            "Toronto mayor John Tory has announced Feb. 7 as Toronto Declares 'The Weeknd Day' to Honor Singer's Super Bowl Performance."
                            " Toronto mayor John Tory has announced Feb. 7 as  in honor of the singer's performance at Super Bowl LV."),
                      ),
                    ),
                    BtnList(),
                    SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Media, docs and links",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Icon(Iconsax.arrow_right_3)
                        ],
                      ),
                    ),
                    ImageList(),
                    SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Mute notification",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold)),
                          CupertinoSwitch(
                              value: powerOn,
                              onChanged: (bool value) {
                                setState(() {
                                  powerOn = value;
                                });
                              })
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(right: 10.0, left: 10.0),
                          child: Row(
                            children: [
                              Icon(
                                Iconsax.bag,
                                size: 30,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              InkWell(
                                child: Text("Clear chat",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                onTap: () {
                                  _showBottomSheet(context);
                                },
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(right: 10.0, left: 10.0),
                          child: Row(
                            children: [
                              Icon(
                                Iconsax.lock,
                                size: 30,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text("Encryption",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(right: 10.0, left: 10.0),
                          child: Row(
                            children: [
                              Icon(
                                Iconsax.logout,
                                size: 30,
                                color: Color(0xffef456f),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text("Exit community",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffef456f)))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(right: 10.0, left: 10.0),
                          child: Row(
                            children: [
                              Icon(
                                Iconsax.dislike,
                                size: 30,
                                color: Color(0xffef456f),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text("Report",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffef456f)))
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _folded
                              ? Text(
                                  "Members",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffef456f),
                                  ),
                                )
                              : SizedBox.shrink(),
                          Flexible(
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 400),
                              width: _folded ? 56 : 400,
                              height: 56,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(32),
                                color: Colors.white,
                                boxShadow: kElevationToShadow[6],
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                        padding: EdgeInsets.only(left: 16),
                                        child: !_folded
                                            ? TextField(
                                                decoration: InputDecoration(
                                                    hintText: 'Search',
                                                    hintStyle: TextStyle(
                                                        color:
                                                            Colors.blue[300]),
                                                    border: InputBorder.none),
                                              )
                                            : null),
                                  ),
                                  AnimatedContainer(
                                    duration: Duration(milliseconds: 400),
                                    child: Material(
                                      type: MaterialType.transparency,
                                      child: InkWell(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(
                                                _folded ? 32 : 0),
                                            topRight: Radius.circular(32),
                                            bottomLeft: Radius.circular(
                                                _folded ? 32 : 0),
                                            bottomRight: Radius.circular(32)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Icon(
                                            _folded
                                                ? Iconsax.search_normal
                                                : Icons.close,
                                            color: Colors.black,
                                          ),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            _folded = !_folded;
                                            if (!_folded) {
                                              _scrollController.animateTo(780,
                                                  duration: Duration(
                                                      milliseconds: 400),
                                                  curve: Curves.easeIn);
                                            }
                                          });
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      child: ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return ListTileWidget(index: index);
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(height: 8);
                          },
                          itemCount: users.length),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
