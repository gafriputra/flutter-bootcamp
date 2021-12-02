import 'package:bootcamp/models/city.dart';
import 'package:bootcamp/models/space.dart';
import 'package:bootcamp/models/tips.dart';
import 'package:bootcamp/providers/space_provider.dart';
import 'package:bootcamp/theme.dart';
import 'package:bootcamp/widgets/botton_navbar_item.dart';
import 'package:bootcamp/widgets/city_card.dart';
import 'package:bootcamp/widgets/space_card.dart';
import 'package:bootcamp/widgets/tips_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            SizedBox(
              height: edge,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: edge,
              ),
              child: Text('Explore Now',
                style: blackTextStyle.copyWith(
                  fontSize: 24
                ),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: edge
              ),
              child: Text('Mencari kosan yang cozy',
                style: greyTextStyle.copyWith(
                  fontSize: 16
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // Note: popular cities
            Padding(
              padding: EdgeInsets.only(
                left: edge
              ),
              child: Text('Popular Cities',
                style: regularTextStyle.copyWith(
                  fontSize: 16
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 24,
                  ),
                  CityCard(
                    City(
                      id: 1,
                      name: 'Jakarta',
                      imageUrl: 'assets/city1.png'
                    )
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                      id: 1,
                      name: 'Bandung',
                      imageUrl: 'assets/city2.png',
                      isPopular: true
                    )
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                      id: 1,
                      name: 'Surabaya',
                      imageUrl: 'assets/city3.png',
                      isPopular: true
                    )
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                      id: 1,
                      name: 'Jakarta',
                      imageUrl: 'assets/city4.png'
                    )
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  CityCard(
                    City(
                      id: 1,
                      name: 'Sidoarjo',
                      imageUrl: 'assets/city5.png',
                      isPopular: true
                    )
                  ),
                  SizedBox(
                    width: 24,
                  ),

                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: edge,
              ),
              child: Text(
                'Recommended Space',
                style: regularTextStyle.copyWith(
                  fontSize: 16
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge
              ),
              child: 
              FutureBuilder(
                future: spaceProvider.getRecommendedSpaces(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Space> data = snapshot.data as List<Space>;

                    int index = 0;
                    return Column(
                        children: data.map((e){
                          index++;
                          return Container(
                            margin: EdgeInsets.only(
                              top: index == 1 ? 0 : 30,
                            ),
                            child: SpaceCard(e),
                          );
                        }).toList(),
                      );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              )
              
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: edge,
              ),
              child: Text(
                'Tips & Guidence',
                style: regularTextStyle.copyWith(
                  fontSize: 16
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge
              ),
              child: Column(
                children: [
                  TipsCard(
                    Tips(
                      id: 1,
                      title: 'City Guidelines',
                      imageUrl: 'assets/tips1.png',
                      updatedAt: '20 Apr'
                    )
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TipsCard(
                    Tips(
                      id: 1,
                      title: 'City Guidelines',
                      imageUrl: 'assets/tips2.png',
                      updatedAt: '20 Apr'
                    )
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50 + edge,
            ),
          ]
        ),
      ),
      floatingActionButton: Container(
                height: 65,
                width: MediaQuery.of(context).size.width - (2 * edge),
                margin: EdgeInsets.symmetric(
                  horizontal: edge
                ),
                decoration: BoxDecoration(
                  color: Color(0xffF6F7F8),
                  borderRadius: BorderRadius.circular(23)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ButtonNavbarItem(
                      imageUrl: 'assets/icon_home.png',
                      isActive: true,
                    ),
                    ButtonNavbarItem(
                      imageUrl: 'assets/icon_email.png',
                      isActive: false,
                    ),
                    ButtonNavbarItem(
                      imageUrl: 'assets/icon_card.png',
                      isActive: false,
                    ),
                    ButtonNavbarItem(
                      imageUrl: 'assets/icon_love.png',
                      isActive: false,
                    ),
                  ],
                ),
              ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}