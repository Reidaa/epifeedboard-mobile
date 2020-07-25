import 'package:flutter/material.dart';
import 'package:epiflipboard/UI/constants.dart';
import 'dart:math' as math;

int likes = 20;

class ProfileAppBar extends StatefulWidget {
  @override
  _ProfileAppBarState createState() => _ProfileAppBarState();
}

class _ProfileAppBarState extends State<ProfileAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: Container(
        child: Transform(
          transform: Matrix4.rotationY(math.pi),
          alignment: Alignment.center,
          child: IconButton(
            icon: Icon(
              Icons.exit_to_app,
            ),
            color: Colors.white,
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      actions: [
        Container(
          margin: EdgeInsets.only(right: 15),
          child: Icon(Icons.settings),
        )
      ],
      backgroundColor: Colors.black87,
      expandedHeight: 260,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          child: Column(
            children: [
              SizedBox(height: 90),
              CircleAvatar(
                backgroundColor: Colors.grey,
                minRadius: 50,
                child: Text('YN', style: titleLabelStyle),
              ),
              SizedBox(height: 10),
              Text('Your Name', style: titleLabelStyle),
              SizedBox(height: 30),
              Row(
                //mainAxisSize: MainAxisSize.min,
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: 20),
                  Text('Likes', style: kLabelStyle),
                  SizedBox(width: 10),
                  Icon(Icons.favorite_border, color: Colors.red),
                  Text('$likes', style: kHintTextStyle),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileFragment extends StatefulWidget {
  @override
  _ProfileFragmentState createState() => _ProfileFragmentState();
}

class _ProfileFragmentState extends State<ProfileFragment> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        ProfileAppBar(),
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.red,
                child: Text('Like ${index + 1}', style: kLabelStyle),
              );
            },
            childCount: likes,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 3,
            crossAxisSpacing: 3,
            childAspectRatio: 1,
          ),
        )
      ],
    );
  }
}
