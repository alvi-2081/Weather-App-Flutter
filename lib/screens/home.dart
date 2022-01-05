import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/services/home_service.dart';

var city = "karachi";

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController txt = TextEditingController();

  var city_name = "";

  citytext() {
    setState(() {
      city = city_name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading:
              IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_sharp)),
          title: TextField(
            controller: txt,
            onChanged: (value) {
              city_name = value;
            },
            style: TextStyle(color: Colors.white),
            cursorColor: Colors.white24,
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white24),
              ),
              hintText: "  Enter City",
              hintStyle: TextStyle(
                color: Colors.white24,
              ),
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  citytext();
                  txt.clear();
                },
                icon: Icon(Icons.search))
          ],
        ),
        body: FutureBuilder(
            future: getuser(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Container(
                    child: Stack(children: [
                  Image.asset(
                    "assets/img1.jpg",
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.black38),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 100,
                            ),
                            Text(snapshot.data.name,
                                style: GoogleFonts.lato(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            Text("${snapshot.data.timezone}",
                                style: GoogleFonts.lato(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white))
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 70,
                            ),
                            Text("${snapshot.data.main.temp.toInt()}\u2103",
                                style: GoogleFonts.lato(
                                    fontSize: 85,
                                    // fontWeight: FontWeight.w300,
                                    color: Colors.white)),
                            Row(
                              children: [
                                Text("Night",
                                    style: GoogleFonts.lato(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white)),
                                // Image.network(snapshot.data.weather.icon),
                              ],
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 100,
                              // decoration: BoxDecoration(
                              //     border: Border.only(color: Colors.white30)),
                              child: Column(
                                children: [
                                  Text("Wind Speed",
                                      style: GoogleFonts.lato(
                                          fontSize: 20, color: Colors.white)),
                                  Text("${snapshot.data.wind.speed}",
                                      style: GoogleFonts.lato(
                                          fontSize: 15, color: Colors.white)),
                                  Text("Kmh",
                                      style: GoogleFonts.lato(
                                          fontSize: 15, color: Colors.white)),
                                ],
                              ),
                            ),
                            Container(
                              height: 100,
                              child: Column(
                                children: [
                                  Text("Pressure",
                                      style: GoogleFonts.lato(
                                          fontSize: 20,
                                          // fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                  Text("${snapshot.data.main.pressure}",
                                      style: GoogleFonts.lato(
                                          fontSize: 15, color: Colors.white)),
                                  Text("mb",
                                      style: GoogleFonts.lato(
                                          fontSize: 15, color: Colors.white)),
                                ],
                              ),
                            ),
                            Container(
                              height: 100,
                              child: Column(
                                children: [
                                  Text("Humidity",
                                      style: GoogleFonts.lato(
                                          fontSize: 20, color: Colors.white)),
                                  Text("${snapshot.data.main.humidity}",
                                      style: GoogleFonts.lato(
                                          fontSize: 15, color: Colors.white)),
                                  Text("%",
                                      style: GoogleFonts.lato(
                                          fontSize: 15, color: Colors.white)),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ]));
              }
            }));
  }
}
