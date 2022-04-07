import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/services/home_service.dart';

var city = "";

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController txt = TextEditingController();

  late String city_name;

  citytext() {
    setState(() {
      city = city_name;
    });
  }

  @override
  void initState() {
    super.initState();
    city = "Karachi";
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
                    // "assets/img1.jpg",
                    image(snapshot.data.weather[0].main),
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
                            //
                            //                   Name of City
                            //
                            Padding(
                              padding: const EdgeInsets.only(left: 7.0),
                              child: Text(snapshot.data.name,
                                  style: GoogleFonts.lato(
                                      fontSize: 60,
                                      // fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            //
                            //                    Description
                            //
                            Padding(
                              padding: const EdgeInsets.only(left: 9),
                              child: Text(
                                  "Weather: ${snapshot.data.weather[0].description}",
                                  style: GoogleFonts.lato(
                                      fontSize: 23,
                                      // fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 70,
                            ),
                            //
                            //                        Main Temperature
                            //
                            Row(
                              children: [
                                Text("${snapshot.data.main.temp.toInt()}\u2103",
                                    style: GoogleFonts.lato(
                                        fontSize: 85,
                                        // fontWeight: FontWeight.w300,
                                        color: Colors.white)),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                //
                                //                    Weather Type
                                //
                                Text("${snapshot.data.weather[0].main}",
                                    style: GoogleFonts.lato(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white)),
                                SizedBox(
                                  width: 10,
                                ),
                                //
                                //                    Cloud Image
                                //
                                Image.network(
                                    "http://openweathermap.org/img/w/${snapshot.data.weather[0].icon}.png"),
                              ],
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.only(left: 9.0),
                            //   child: Text(
                            //       "Feesls Like ${snapshot.data.main.feelsLike.toInt()}\u2103",
                            //       style: GoogleFonts.lato(
                            //           fontSize: 20,
                            //           fontWeight: FontWeight.w500,
                            //           color: Colors.white)),
                            // ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            //
                            //                Wind Speed
                            //
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
                            //
                            //                    Pressure
                            //
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
                            //
                            //                    Humidity
                            //
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

image(w_type) {
  if (w_type == "Haze") {
    return "assets/haze.jpg";
  } else if (w_type == "Clear") {
    return "assets/clear.jpg";
  } else if (w_type == "Clouds") {
    return "assets/cloudy.jpg";
  } else if (w_type == "Mist") {
    return "assets/mist.jpg";
  } else if (w_type == "Sunny") {
    return "assets/sunny.jpg";
  } else {
    return "assets/img1.jpg";
  }
}
