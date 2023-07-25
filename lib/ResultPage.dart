import 'package:deneme_1/User_Data.dart';
import 'package:deneme_1/classes.dart';
import 'package:flutter/material.dart';
import 'constest.dart';

  class ResultPage extends StatelessWidget {
    final User_Data _userData;

    ResultPage(this._userData,);
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sonuç Sayfası", style: textstyle_1),
      ),
      body: Column(
        children: [
           Expanded(
            child: Center(
              child: Text(
                "Beklenen Yaşam Süresi: ${Hesap(_userData).hesaplama().round()}",
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ),
          ),
          ExempleImage(Hesap(_userData).imagehesaplama()),
          const SizedBox(height:90),
          ConstrainedBox(
            constraints: const BoxConstraints.tightFor(width: 300,height: 60),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor:Theme.of(context).hintColor,
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // <-- Radius
                ),
              ),
              onPressed: () {Navigator.pop(context);},
              child: Text(
                "GERİ DÖN",
                style: textstyle_1,
              ),
            ),
          ),
           const SizedBox(
            height: 90,
          ),
        ],
      ),
    );
  }

  InteractiveViewer ExempleImage(String url) {
    return InteractiveViewer(child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image(image:NetworkImage("$url") ,)));
  }
}
