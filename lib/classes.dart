import 'package:deneme_1/User_Data.dart';
import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  final Color color;
  final Widget? child;
  final Function? function;
  const MyContainer({
    Key? key,
    this.color = Colors.white,
    this.child,
    this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function != null ? () => function!() : null,
      child: Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: child != null ? child! : SizedBox(),
      ),
    );
  }
}

class GenderICN extends StatelessWidget {
  final String text;
  final Widget genderICN;

  const GenderICN({
    Key? key,
    required this.text,
    required this.genderICN,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
        ),
        genderICN,
        SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class Hesap {
  User_Data _userData;
  Hesap(this._userData);

  double hesaplama() {
    double sonuc;
    sonuc = 65 + _userData.sporSayisi - _userData.icilenSigara;
    sonuc = sonuc + (_userData.boy / _userData.kilo);
    if (_userData.chosedGender == "KADIN") {
      return sonuc + 3;
    } else {
      return sonuc;
    }
  }

  String imagehesaplama() {
    bool Erkek;
    double sonuc = hesaplama();
    _userData.chosedGender == "ERKEK" ? Erkek = true : Erkek = false;
    if(Erkek){
      if(sonuc>65){
        return "https://gymsozluk.com/wp-content/uploads/2023/06/Ege-Fitness.webp";
      }
      else if (sonuc>55){
      return "https://i1.imgiz.com/rshots/10320/gobekli-arkadasini-gaza-getiren-adam-kufur-icerir_10320275-2845_854x480.jpg";
      }
      else{return "https://www.ghbase.com/wp-content/uploads/2022/05/101008843_149260753332250_1642557754118089435_n-696x532.jpg";}
    }
    else if (!Erkek){
      if(sonuc>65){
        return "https://cdn1.ntv.com.tr/gorsel/CTIddgg2p0CUDI-g5PsFkA.jpg?width=1000&mode=both&scale=both&v=1439477796033 ";
      }
      else if(sonuc>55){
        return "https://i0.wp.com/thegeyik.com/wp-content/uploads/2016/01/balik-etli-kadinlar-daha-zeki.jpg?resize=470%2C308";
      }
      else{return "https://i.ytimg.com/vi/Z9mPR4Q6RJc/frame0.jpg";}
    }
    else{return "https://i1.sndcdn.com/artworks-000466183716-dimbfn-t500x500.jpg";}
  }
}
