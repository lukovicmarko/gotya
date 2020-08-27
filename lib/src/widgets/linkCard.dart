import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkCard extends StatelessWidget {
  LinkCard({this.icon, this.link});

  final IconData icon;
  final String link;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 3.0),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 5, 8),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  launch(link);
                },
                child: Text(
                  link,
                  maxLines: 1,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Color(0xFF0000ee),
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
