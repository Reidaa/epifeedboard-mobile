import 'package:epiflipboard/UI/constants.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';

class FollowingFragment extends StatefulWidget {
  @override
  _FollowingFragmentState createState() => _FollowingFragmentState();
}

class _FollowingFragmentState extends State<FollowingFragment> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: kbackGroundColor,
        appBar: AppBar(
          leading: Container(),
          title: Text("FOLLOWING"),
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
        body: TabBarView(
          children: [
            buildAll(context),
            buildFollow(),
          ],
        ),
      ),
    );
  }

  Column buildFollow() {
    return Column(
      children: [
        Container(
          height: 80,
          padding: EdgeInsets.symmetric(horizontal: 10),
          // ignore: missing_required_param
          child: SearchBar(
            searchBarStyle: SearchBarStyle(padding: EdgeInsets.all(3)),
            textStyle: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            hintText: 'Search Following',
            iconActiveColor: Color.fromRGBO(200, 190, 190, 1.0),
          ),
        ),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(
              color: Colors.white,
            ),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Text('YN', style: TextStyle(color: Colors.white)),
                    ),
                    Column(
                      children: [
                        Text(
                          'Yann Nick',
                          style: kLabelStyle,
                        ),
                        Text(
                          'Description...',
                          style: kHintTextStyle,
                        )
                      ],
                    ),
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Column buildAll(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 80,
          padding: EdgeInsets.symmetric(horizontal: 10),
          // ignore: missing_required_param
          child: SearchBar(
            searchBarStyle: SearchBarStyle(padding: EdgeInsets.all(3)),
            textStyle: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            hintText: 'Search Following',
            iconActiveColor: Color.fromRGBO(200, 190, 190, 1.0),
          ),
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(30, (index) {
              return GridTile(
                child: Card(
                  color: Color.fromRGBO(120, 120, 120, .30),
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://d1fmx1rbmqrxrr.cloudfront.net/cnet/i/edit/2019/04/eso1644bsmall.jpg'),
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          'Item $index',
                          style: kLabelStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
