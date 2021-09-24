import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotels/calendar_page.dart';

const d_green = Color(0xFF54D3C2);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hotels Booking',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchSection(),
            HotelSection(),
          ],
        ),
      ),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => new Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.grey[800],
          size: 26,
        ),
        onPressed: null,
      ),
      title: Text(
        'Explore',
        style: GoogleFonts.nunito(
          color: Colors.black,
          fontSize: 22,
          fontWeight: FontWeight.w800,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.favorite_outline_rounded,
            color: Colors.grey[800],
            size: 26,
          ),
          onPressed: null,
        ),
        IconButton(
          icon: Icon(
            Icons.place,
            color: Colors.grey[800],
            size: 26,
          ),
          onPressed: null,
        ),
      ],
      backgroundColor: Colors.white,
    );
  }
}

class SearchSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 4,
                            offset: Offset(0, 3))
                      ]),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "London",
                      contentPadding: EdgeInsets.all(10),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    ),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return CalendarPage();
                        },
                      ),
                    );
                  },
                  child: Icon(
                    Icons.search,
                    size: 26,
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(10),
                      primary: d_green),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Choose date',
                      style: GoogleFonts.nunito(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      '12 Dec - 22 Dec',
                      style: GoogleFonts.nunito(
                        color: Colors.black,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Number of Rooms',
                      style: GoogleFonts.nunito(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      '1 Room - 2 Adults',
                      style: GoogleFonts.nunito(
                        color: Colors.black,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HotelSection extends StatelessWidget {
  final List hotelList = [
    {
      'title': 'Grand Royal Hotel',
      'place': 'Webley, London',
      'distance': 2,
      'review': 36,
      'picture': 'assets/images/hotel_1.png',
      'price': 100
    },
    {
      'title': 'Queen Hotel',
      'place': 'Webley, London',
      'distance': 3,
      'review': 13,
      'picture': 'assets/images/hotel_2.png',
      'price': 220
    },
    {
      'title': 'Grand Mal Hotel',
      'place': 'Webley, London',
      'distance': 6,
      'review': 88,
      'picture': 'assets/images/hotel_3.png',
      'price': 400
    },
    {
      'title': 'Hilton',
      'place': 'Webley, London',
      'distance': 11,
      'review': 34,
      'picture': 'assets/images/hotel_4.png',
      'price': 910
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        children: [HotelFilterSection(), HotelList(hotelList)],
      ),
    );
  }
}

class HotelFilterSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '550 hotels founds',
            style: GoogleFonts.nunito(color: Colors.black, fontSize: 15),
          ),
          Row(
            children: [
              Text(
                'Filters',
                style: GoogleFonts.nunito(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
              IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.filter_list_outlined,
                  color: d_green,
                  size: 25,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HotelList extends StatelessWidget {
  final List hotelList;

  HotelList(this.hotelList);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: hotelList.map((hotel) {
        return HotelCard(hotel);
      }).toList(),
    );
  }
}

class HotelCard extends StatelessWidget {
  final Map hotelData;

  HotelCard(this.hotelData);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(18)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              spreadRadius: 4,
              blurRadius: 6,
              offset: Offset(0, 3),
            )
          ]),
      child: Column(
        children: [
          HotelImage(hotelData['picture']),
          HotelTitle(hotelData['title'], hotelData['price']),
          HotelLocalisation(hotelData['place'], hotelData['distance']),
          HotelNotation(hotelData['review']),
        ],
      ),
    );
  }
}

class HotelImage extends StatelessWidget {
  final String image;

  HotelImage(this.image);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
        ),
        color: Colors.red,
        image: DecorationImage(
          image: AssetImage(
            image,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
              top: 5,
              right: -15,
              child: MaterialButton(
                color: Colors.white,
                shape: CircleBorder(),
                onPressed: () {},
                child: Icon(
                  Icons.favorite_outline_rounded,
                  color: d_green,
                  size: 20,
                ),
              ))
        ],
      ),
    );
  }
}

class HotelTitle extends StatelessWidget {
  final String title;
  final int price;

  HotelTitle(this.title, this.price);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style:
                GoogleFonts.nunito(fontSize: 18, fontWeight: FontWeight.w800),
          ),
          Text(
            "\$" + price.toString(),
            style:
                GoogleFonts.nunito(fontSize: 18, fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }
}

class HotelLocalisation extends StatelessWidget {
  final String place;
  final int distance;

  HotelLocalisation(this.place, this.distance);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                place,
                style: GoogleFonts.nunito(
                    fontSize: 14,
                    color: Colors.grey[500],
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                width: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.place,
                    color: d_green,
                    size: 14.0,
                  ),
                  Text(
                    distance.toString() + 'km to city',
                    style: GoogleFonts.nunito(
                        fontSize: 14,
                        color: Colors.grey[500],
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ],
          ),
          Text(
            'per nigth',
            style: GoogleFonts.nunito(
                fontSize: 14,
                color: Colors.grey.shade800,
                fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}

class HotelNotation extends StatelessWidget {
  final int reviews;

  HotelNotation(this.reviews);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 3, 10, 10),
      child: Row(
        children: [
          Row(
            children: [
              Icon(
                Icons.star_rate,
                color: d_green,
                size: 14,
              ),
              Icon(
                Icons.star_rate,
                color: d_green,
                size: 14,
              ),
              Icon(
                Icons.star_rate,
                color: d_green,
                size: 14,
              ),
              Icon(
                Icons.star_rate,
                color: d_green,
                size: 14,
              ),
              Icon(
                Icons.star_border,
                color: d_green,
                size: 14,
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            reviews.toString() + ' reviews',
            style: GoogleFonts.nunito(
                fontSize: 14,
                color: Colors.grey[500],
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
