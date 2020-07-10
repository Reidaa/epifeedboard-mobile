import 'package:flutter/material.dart';

class FollowingAppBar extends StatefulWidget {
  @override
  _FollowingAppBarState createState() => _FollowingAppBarState();
}

class _FollowingAppBarState extends State<FollowingAppBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: AppBar(
        leading: Container(),
        centerTitle: false,
        backgroundColor: Colors.black87,
        primary: true,
        bottom: TabBar(indicatorColor: Colors.red, tabs: [
          Tab(
            text: 'All',
          ),
          Tab(
            text: 'Follow',
          ),
        ]),
      ),
    );
  }
}

class FollowingFragment extends StatefulWidget {
  @override
  _FollowingFragmentState createState() => _FollowingFragmentState();
}

class _FollowingFragmentState extends State<FollowingFragment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 100,
            child: FollowingAppBar(),
          ),
        ],
      ),
    );
  }
}
