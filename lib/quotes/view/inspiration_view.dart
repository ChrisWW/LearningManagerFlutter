import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';
import 'package:screenshot/screenshot.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';
import 'package:flutter/services.dart';

// Main start of the app
// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
//   runApp(MyApp());
// }

// // setting App name and home
// class InspirationView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'motivation Quotes',
//       home: MainPage(),
//     );
//   }
// }

class InspirationView extends StatefulWidget {
  @override
  _InspirationViewState createState() => _InspirationViewState();
}

class _InspirationViewState extends State<InspirationView> {
  late String quote, owner, imglink;
  bool working = false;
  final grey = Colors.blueGrey[800];
  late ScreenshotController screenshotController;

  @override
  void initState() {
    super.initState();
    screenshotController = ScreenshotController();
    quote = "";
    owner = "";
    imglink = "";
    getQuote();
  }

  // get a random Quote from the API
  getQuote() async {
    try {
      setState(() {
        working = true;
        quote = imglink = owner = "";
      });

      // https://forismatic.com/en/api/

      var response = await http.post(
          Uri.parse(Uri.encodeFull('http://api.forismatic.com/api/1.0/')),
          body: {"method": "getQuote", "format": "json", "lang": "en"});
      setState(() {
        try {
          var res = jsonDecode(response.body);
          owner = res["quoteAuthor"].toString().trim();
          quote = res["quoteText"].replaceAll("â", " ");
          getImg(owner);
        } catch (e) {
          getQuote();
        }
      });
    } catch (e) {
      offline();
    }
  }

  // if it is offline, show a fixed Quote
  offline() {
    setState(() {
      owner = "Janet Fitch";
      quote = "The phoenix must burn to emerge";
      imglink = "";
      working = false;
    });
  }

  // When copy button clicked, copy the quote to clipboard
  copyQuote() {
    Clipboard.setData(ClipboardData(text: (quote + "\n- " + owner))).then((_){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Quote Copied")));
    });

    // Deprecated clipboard ubt Toast is ok
    // ClipboardManager.copyToClipBoard(quote + "\n- " + owner).then((result) {
    //   Toast.show("Quote Copied", context, duration: Toast.LENGTH_SHORT);
    // });
  }

  addToFavourites() async {
    print("save in favoruties");
  }

  // When share button clicked, share a text and screnshot of the quote
  shareQuote() async {
    final directory = (await getApplicationDocumentsDirectory())
        .path; //from path_provide package
    String path =
        '$directory/screenshots${DateTime.now().toIso8601String()}.png';

    //path: path in argument with nev versions?
    screenshotController.capture().then((_) {
      Share.shareFiles([path], text: quote);
    }).catchError((onError) {
      print(onError);
    });
  }

  // get image of the quote author, using Wikipedia Api
  getImg(String name) async {
    var image = await http.get(Uri.parse(
        "https://en.wikipedia.org/w/api.php?action=query&generator=search&gsrlimit=1&prop=pageimages%7Cextracts&pithumbsize=400&gsrsearch=" +
            name +
            "&format=json"));

    setState(() {
      try {
        var res = json.decode(image.body)["query"]["pages"];
        res = res[res.keys.first];
        imglink = res["thumbnail"]["source"];
      } catch (e) {
        imglink = "";
      }
      working = false;
    });
  }

  // Choose to show the loaded image from the Api or the offline one
  Widget drawImg() {
    if (imglink.isEmpty) {
      return Image.asset("img/offline.jpg", fit: BoxFit.cover);
    } else {
      return Image.network(imglink, fit: BoxFit.cover);
    }
  }

  // Main build function
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey,
      body: Screenshot(
        controller: screenshotController,
        child: Stack(
            alignment: Alignment.center,
            fit: StackFit.expand,
            children: <Widget>[
              drawImg(),
              Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0, 0.6, 1],
                      colors: [
                        grey!.withAlpha(70),
                        grey!.withAlpha(220),
                        grey!.withAlpha(255),
                      ],
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 100),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: quote != null ? '“ ' : "",
                              style: TextStyle(
                                  fontFamily: "Ic",
                                  color: Colors.green,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 30),
                              children: [
                                TextSpan(
                                    text: quote != null ? quote : "",
                                    style: TextStyle(
                                        fontFamily: "Ic",
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 22)),
                                TextSpan(
                                    text: quote != null ? '”' : "",
                                    style: TextStyle(
                                        fontFamily: "Ic",
                                        fontWeight: FontWeight.w700,
                                        color: Colors.green,
                                        fontSize: 30))
                              ]),
                        ),
                        Text(owner.isEmpty ? "" : "\n" + owner,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: "Ic",
                                color: Colors.white,
                                fontSize: 18)),
                      ])),
              AppBar(
                title: Text(
                  "Motivational Quote",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
              ),
            ]),
      ),
      floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            InkWell(
              onTap: !working ? getQuote : null,
              child: Icon(Icons.refresh, size: 35, color: Colors.white),
            ),
            InkWell(
              onTap: quote.isNotEmpty ? copyQuote : null,
              child: Icon(Icons.content_copy, size: 30, color: Colors.white),
            ),
            InkWell(
              onTap: quote.isNotEmpty ? shareQuote : null,
              child: Icon(Icons.share, size: 30, color: Colors.white),
            ),
            InkWell(
              onTap: quote.isNotEmpty ? () => addToFavourites() : null,
              child: Icon(Icons.add_box_outlined, size: 30, color: Colors.white),
            )
          ]),
    );
  }
}