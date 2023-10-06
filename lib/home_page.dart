// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:my_clock/clock_view.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('EEE, d MMM').format(now);
    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';
    if (!timezoneString.startsWith('-')) offsetSign = '+';
    print(timezoneString);

    return Scaffold(
      backgroundColor: const Color(0xFF2D2F41),
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildMenuButton('Clock', 'assets/clock_icon.png'),
              buildMenuButton('Alarm', 'assets/alarm_icon.png'),
              buildMenuButton('Timer', 'assets/timer_icon.png'),
              buildMenuButton('Stopwatch', 'assets/stopwatch_icon.png'),
            ],
          ),
          const VerticalDivider(color: Colors.white54, width: 1),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Text(
                      "Clock",
                      style: TextStyle(
                          fontFamily: 'vivek',
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 24),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          formattedTime,
                          style: const TextStyle(
                              fontFamily: 'vivek',
                              color: Colors.white,
                              fontSize: 64),
                        ),
                        Text(
                          formattedDate,
                          style: const TextStyle(
                              fontFamily: 'vivek',
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 4,
                    fit: FlexFit.tight,
                    child: Align(
                      alignment: Alignment.center,
                      child: ClockView(
                        size: MediaQuery.of(context).size.height / 4,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Timezone",
                          style: TextStyle(
                            fontFamily: 'vivek',
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            const Icon(
                              Icons.language,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 16),
                            Text(
                              "UTC$offsetSign$timezoneString",
                              style: const TextStyle(
                                fontFamily: 'vivek',
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding buildMenuButton(String title, String image) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: TextButton(
        onPressed: () {},
        child: Column(
          children: [
            Image.asset(image, scale: 1.5),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                  fontFamily: 'vivek', color: Colors.white, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
