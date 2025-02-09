import 'package:flutter/material.dart';

import 'btn.dart';
import 'svg_wid.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
    this.title = '',
    this.play = false,
    this.seconds = 60,
  });

  final String title;
  final bool play;
  final int seconds;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20 + MediaQuery.of(context).viewPadding.top,
        bottom: 20,
      ),
      child: Row(
        children: [
          SizedBox(width: 20),
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Color(0xff5D2B67),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Btn(
              onPressed: Navigator.of(context).pop,
              child: Center(
                child: SvgWid(
                  'assets/back.svg',
                  color: Colors.white,
                ),
              ),
            ),
          ),
          play
              ? Expanded(
                  child: Column(
                    children: [
                      Text(
                        'TIME',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'w400',
                        ),
                      ),
                      SizedBox(height: 2),
                      Container(
                        height: 30,
                        width: 130,
                        decoration: BoxDecoration(
                          color: Color(0xff3D1A59),
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            width: 2,
                            color: Colors.white,
                          ),
                        ),
                        child: Row(
                          children: [
                            AnimatedContainer(
                              duration:
                                  Duration(seconds: seconds == 60 ? 1 : 60),
                              margin: EdgeInsets.symmetric(horizontal: 3),
                              decoration: BoxDecoration(
                                color: seconds < 60
                                    ? Colors.redAccent
                                    : Colors.greenAccent,
                                borderRadius: BorderRadius.circular(26),
                              ),
                              child: AnimatedContainer(
                                duration: Duration(seconds: 1),
                                height: 20,
                                width: (seconds / 60) * 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(26),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : Expanded(
                  child: Center(
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontFamily: 'w400',
                      ),
                    ),
                  ),
                ),
          SizedBox(width: 80),
        ],
      ),
    );
  }
}
