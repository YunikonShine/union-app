import 'package:flutter/material.dart';

class AlertDialogMessage {
  static Future showDialogMessage(String title, String text,
      String messageButton, BuildContext context, GestureTapCallback onTap) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                32.0,
              ),
            ),
          ),
          contentPadding: const EdgeInsets.only(
            top: 10.0,
          ),
          content: SizedBox(
            width: 300.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xff1b8dcb),
                      fontSize: 18.0,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                const Divider(
                  color: Color(0xff1b8dcb),
                  height: 4.0,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Text(
                      text,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xff1b8dcb),
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                const Divider(
                  color: Color(0xff1b8dcb),
                  height: 4.0,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    margin: const EdgeInsets.only(top: 5.0, bottom: 15.0),
                    child: Text(
                      messageButton,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xff1b8dcb),
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Future showLoading(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: SizedBox(
            width: 100.0,
            height: 100.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: const <Widget>[CircularProgressIndicator()],
            ),
          ),
        );
      },
    );
  }
}
