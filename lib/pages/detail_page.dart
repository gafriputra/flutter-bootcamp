
import 'package:bootcamp/models/space.dart';
import 'package:bootcamp/pages/error_page.dart';
import 'package:bootcamp/theme.dart';
import 'package:bootcamp/widgets/facility_item.dart';
import 'package:bootcamp/widgets/rating_item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {

  final Space space;

  DetailPage(this.space);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    launchUrl(String url) async {
      if (await canLaunch(url)) {
        launch(url);
      }else{
        // throw(url);
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => ErrorPage()
        ));
      }
    }

    Future<void> showConfirmation() async {
      return showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: const Text('Konfirmasi'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Apakah kamu ingin menghubungi pemilik kos?.'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Batal'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Hubungi'),
                onPressed: () {
                  Navigator.of(context).pop();
                  launchUrl('tel:${widget.space.phone}');
                },
              ),
            ],
          );
        }
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.network(
              widget.space.imageUrl.toString(),
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),
            ListView(
              children: [
                SizedBox(
                  height: 328,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20)
                    ),
                    color: whiteColor
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: edge
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.space.name.toString(),
                                  style: blackTextStyle.copyWith(
                                    fontSize: 22
                                  ),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text.rich(
                                  TextSpan(
                                    text: '\$${widget.space.price}',
                                    style: purpleTextStyle.copyWith(
                                      fontSize: 16
                                    ),
                                    children: [
                                      TextSpan(
                                        text: ' / month',
                                        style: greyTextStyle.copyWith(
                                          fontSize: 16
                                        )
                                      )
                                    ]
                                  )
                                ),
                              ],
                            ),
                            Row(
                              children: [1,2,3,4,5].map((e){
                                return Container(
                                  margin: EdgeInsets.only(
                                    left: 2
                                  ),
                                  child: RatingItem(
                                    index: e,
                                    rating: widget.space.rating!.toInt(),
                                  ),
                                );
                              }).toList()
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: edge
                        ),
                        child: Text(
                          'Main Facilities',
                          style: regularTextStyle.copyWith(
                            fontSize: 16
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: edge
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FacilityItem(
                              name: 'kitchen',
                              imageUrl: 'assets/icon_kitchen.png',
                              total: widget.space.numberOfKitchens!.toInt(),
                            ),
                            FacilityItem(
                              name: 'Bedrooms',
                              imageUrl: 'assets/icon_bedroom.png',
                              total: widget.space.numberOfBedrooms!.toInt(),
                            ),
                            FacilityItem(
                              name: 'Lemari',
                              imageUrl: 'assets/icon_cupboard.png',
                              total: widget.space.numberOfCupboards!.toInt(),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: edge
                        ),
                        child: Text(
                          'Photos',
                          style: regularTextStyle.copyWith(
                            fontSize: 16
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 88,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: widget.space.photos!.map((e){
                            return Container(
                              margin: EdgeInsets.only(
                                left: 24
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  16
                                ),
                                child: Image.network(
                                  e,
                                  width: 110,
                                  height: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: edge
                        ),
                        child: Text(
                          'Location',
                          style: regularTextStyle.copyWith(
                            fontSize: 16
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: edge
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${widget.space.address} \n ${widget.space.city}',
                              style: greyTextStyle,
                            ),
                            InkWell(
                              onTap: (){
                                launchUrl(widget.space.mapUrl.toString());
                              },
                              child: Image.asset(
                                'assets/btn_map.png',
                                width: 40,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: edge
                        ),
                        height: 50,
                        width: MediaQuery.of(context).size.width - (2 * edge),
                        child: RaisedButton(
                          color: purpleColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)
                          ),
                          onPressed: (){
                            showConfirmation();
                          },
                          child: Text(
                            'Book Now',
                            style: whiteTextStyle.copyWith(
                              fontSize: 18
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      )
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
                vertical: 30
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/btn_back.png',
                      width: 40,
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        isClicked = !isClicked;
                      });
                    },
                    child: Image.asset(
                      isClicked ? 'assets/btn_wishlist_active.png' : 'assets/btn_wishlist.png',
                      width: 40,
                    ),
                  )
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}