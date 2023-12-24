// ignore_for_file: avoid_unnecessary_containers, unused_local_variable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:travel/screens/navpages/get_location.dart';
import 'package:travel/screens/navpages/weatherData.dart';

class WeatherPage extends StatelessWidget {
  // const WeatherPage({Key? key}) : super(key: key);
  var client = WeatherData();
  var data;

  info() async {
    // var position = await GetPosition();
    data = await client.getData('51.52', '-0.11');
    return data;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 24, 28, 36),
        body: FutureBuilder(
          future: info(),
          builder: ((context, snapshot) {
            return Container(
              child: Column(
                children: [
                  Container(
                    height: size.height * 0.75,
                    width: size.width,
                    padding: EdgeInsets.only(top: 40),
                    margin: EdgeInsets.only(right: 20, left: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 19, 60, 56),
                          Color.fromARGB(255, 18, 49, 45),
                          Color.fromARGB(255, 9, 49, 65),
                          Color.fromARGB(255, 25, 54, 74),
                          Color.fromARGB(255, 11, 16, 23),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        // stops: [0.2, 0.7],
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          '${data?.cityName}',
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 35),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          dateFormat,
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 12),
                        ),
                        // Text(
                        //   'Monday,21 Aug',
                        //   style: TextStyle(
                        //       color: Colors.white.withOpacity(0.8),
                        //       fontSize: 20),
                        // ),
                        SizedBox(
                          height: 20,
                        ),
                        Image.asset(
                          'assets/images/sunny.png',
                          width: size.width * 0.4,
                        ),
                        // Image.network(
                        //   'https:${data?.icon}',
                        //   width: size.width * 0.36,
                        //   fit: BoxFit.fill,
                        // ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          '${data?.condition}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 45,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${data?.temp}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 60,
                              fontWeight: FontWeight.w800),
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/rainy.png',
                                    width: size.width * 0.15,
                                  ),
                                  Text(
                                    '${data?.wind} km/h',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Wind',
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.5),
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/rainy.png',
                                    width: size.width * 0.15,
                                  ),
                                  Text(
                                    '${data?.humidity}',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Humadity',
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.5),
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/rainy.png',
                                    width: size.width * 0.15,
                                  ),
                                  Text(
                                    '${data?.wind_dir}',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Wind Direction',
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.5),
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'Guest',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 17,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${data?.gust}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Pressure',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 17,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${data?.pressure}hpa',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'UV',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 17,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${data?.uv}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Preciptation',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 17,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${data?.pricipe} mm',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'Wind',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 17,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${data?.wind} km/h',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Last Update',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 17,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${data?.last_update}',
                              style: TextStyle(
                                color: Colors.green,
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
          }),
        ));
  }
}
