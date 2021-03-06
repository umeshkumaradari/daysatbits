import 'package:flutter/material.dart';
import 'package:flutter_html_view/flutter_html_view.dart';
import 'package:daysatbits/UI/homeUI.dart';

class Announcement extends StatefulWidget {
  final String html;
  final String featureimg;
  final DateTime date;
  final String title;
  Announcement(this.html, this.featureimg, this.date, this.title);
  @override
  _AnnouncementState createState() =>
      _AnnouncementState(html, featureimg, date, title);
}

class _AnnouncementState extends State<Announcement> {
  final String html;
  final String featureimg;
  final DateTime date;
  final String title;

  _AnnouncementState(this.html, this.featureimg, this.date, this.title);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: new Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text('Announcement', style: TextStyle(color: Colors.black)),
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: new Container(
              padding: EdgeInsets.only(
                  top: 12.0, bottom: 10.0, right: 10.0, left: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: new Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new NetworkImage(featureimg)),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(title,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(height: 3.0),
                  Text(
                    timeAgo(date),
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Center(
                      child: new HtmlView(
                    data: html,
                    onLaunchFail: (url) {
                      print("launch $url failed");
                    },
                    scrollable: false,
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
