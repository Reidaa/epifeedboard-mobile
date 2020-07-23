import 'package:epiflipboard/UI/constants.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';

class ExploreFragment extends StatefulWidget {
  @override
  _ExploreFragmentState createState() => _ExploreFragmentState();
}

class _ExploreFragmentState extends State<ExploreFragment> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: kbackGroundColor,
        appBar: AppBar(
          title: Text("EXPLORE"),
          backgroundColor: kAppBarColor,
          primary: true,
        ),
        body: buildColumn(context),
      ),
    );
  }

  Column buildColumn(BuildContext context) {
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
                                'https://images.indianexpress.com/2019/10/newspaper.jpg'),
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
