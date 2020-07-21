import 'package:epiflipboard/UI/views/FollowingFragment.dart';
import 'package:epiflipboard/UI/views/ProfileFragment.dart';
import 'package:epiflipboard/UI/views/home/HomeFragment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF616161),
                      Color(0xFF424242),
                      Color(0xFF303030),
                      Color(0xFF212121),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Container(
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
                    // ExploreFragment(),
                    ProfileFragment(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBtmNavigationBar(),
    );
  }

  Widget _buildBtmNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.apps),
          title: Text('Following'),
        ),
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.search),
        //   title: Text('Explore'),
        // ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text('Profile'),
        ),
      ],
      currentIndex: _currentIndex,
      backgroundColor: Colors.black87,
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.white,
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
