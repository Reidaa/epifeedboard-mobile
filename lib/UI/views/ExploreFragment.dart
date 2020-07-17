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
        backgroundColor: Colors.black54,
        appBar: AppBar(
          leading: Container(),
          title: Text("EXPLORE"),
          centerTitle: false,
          backgroundColor: Colors.black87,
          primary: true,
          bottom: TabBar(indicatorColor: Colors.red, tabs: [
            Tab(
              text: 'News',
            ),
            Tab(
              text: 'Local',
            ),
            Tab(
              text: 'Sport',
            ),
            Tab(
              text: 'Travel',
            ),
          ]),
        ),
        body: TabBarView(
          children: [
            Column(
              children: [
                Container(
                  height: 80,
                  padding: EdgeInsets.symmetric(horizontal: 10),
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
            ),


            Column(
              children: [
                Container(
                  height: 80,
                  padding: EdgeInsets.symmetric(horizontal: 10),
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
                                        'https://img.aws.la-croix.com/2019/07/24/1201037368/20-revenus-quartier-financier-londonien-services-vendus-marche-unique-europeen_1_729_486.jpg'),
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
            ),


            Column(
              children: [
                Container(
                  height: 80,
                  padding: EdgeInsets.symmetric(horizontal: 10),
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
                                        'https://cdn.unitycms.io/image/ocroped/1600,1600,1000,1000,0,0/wEYNKhzg1oE/CbE68gaTq-d8MmaINADReO.jpg'),
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
            ),


            Column(
              children: [
                Container(
                  height: 80,
                  padding: EdgeInsets.symmetric(horizontal: 10),
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
                                        'https://s.ftcdn.net/v2013/pics/all/curated/RKyaEDwp8J7JKeZWQPuOVWvkUjGQfpCx_cover_580.jpg?r=1a0fc22192d0c808b8bb2b9bcfbf4a45b1793687'),
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
            ),

          ],
        ),
      ),
    );
  }
}
