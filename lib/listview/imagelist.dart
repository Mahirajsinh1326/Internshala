import 'package:flutter/material.dart';

class ImageList extends StatefulWidget {


  @override
  _ImageList createState() => _ImageList();
}

class _ImageList extends State<ImageList> {



  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      // Set the height of the container to fit the buttons
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        // Set the scroll direction to horizontal
        itemCount: 6,
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                width: 125,
                decoration: (
                BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            "https://d12d6l12s3d372.cloudfront.net/the_weeknd_day_superbowl_e149958f33.png"
                        )
                    )
                )
                ),
              )
          );
        },
      ),
    );
  }
}
