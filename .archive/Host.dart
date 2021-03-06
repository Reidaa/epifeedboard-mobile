import 'package:epiflipboard/UI/views/following/FollowingFragment.dart';
import 'package:epiflipboard/UI/views/profile/ProfileFragment.dart';
import 'package:epiflipboard/UI/views/home/HomeFragment.dart';
import 'explore/ExploreFragment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "../constants.dart" as constants;

class Host extends StatefulWidget {
  @override
  _HostState createState() => _HostState();
}

class _HostState extends State<Host> {
  int _currentIndex = 0;
  final _pageController = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            children: <Widget>[
              HomeFragment(),
              FollowingFragment(),
              ExploreFragment(),
              ProfileFragment(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBtmNavigationBar(),
    );
  }

  Widget _buildBtmNavigationBar() {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.apps),
          title: Text('Following'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          title: Text('Explore'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text('Profile'),
        ),
      ],
      currentIndex: _currentIndex,
      backgroundColor: constants.kAppBarColor,
      selectedItemColor: constants.selectedColor,
      unselectedItemColor: constants.unselectedColor,
      elevation: 15.0,
      onTap: _itemOnTap,
    );
  }

  void _itemOnTap(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.easeOutCirc);
    });
  }
}
