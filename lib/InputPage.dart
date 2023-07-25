import 'package:deneme_1/ResultPage.dart';
import 'package:deneme_1/User_Data.dart';
import 'package:deneme_1/constest.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'classes.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String chosedGender = "";
  double icilenSigara = 0;
  double sporSayisi = 0;
  int boy = 150;
  int kilo = 60;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text(
          "Yaşam Süresi",
          style: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: [
              Endekses("BOY"),
              Endekses("KİLO"),
            ],
          ),
          Expanded(
            child: MyContainer(
              color: Theme.of(context).hintColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Haftada Kaç Kere Spor Yapıyorsunuz ?",
                    style: textstyle_1,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    sporSayisi.toInt().toString(),
                    style: numberstyle_1,
                  ),
                  Slider(
                    min: 0,
                    max: 7,
                    divisions: 7,
                    activeColor: Colors.black,
                    value: sporSayisi,
                    onChanged: (double newValue_1) {
                      setState(() {
                        sporSayisi = newValue_1;
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: MyContainer(
                color: Theme.of(context).hintColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Günde Kaç Tane Sigara İçiyorsunuz?",
                      style: textstyle_1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(icilenSigara.toInt().toString(), style: numberstyle_1),
                    Slider(
                        activeColor: Colors.black,
                        min: 0,
                        max: 30,
                        value: icilenSigara,
                        divisions: 30,
                        onChanged: (double newValue) {
                          setState(() {
                            icilenSigara = newValue;
                          });
                        })
                  ],
                )),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: MyContainer(
                  function: () {
                    setState(() {
                      chosedGender = "KADIN";
                    });
                  },
                  color: chosedGender == "KADIN"
                      ? Colors.teal
                      : Theme.of(context).hintColor,
                  child: const GenderICN(
                    text: "KADIN",
                    genderICN: FaIcon(FontAwesomeIcons.venus, size: 50),
                  ),
                )),
                Expanded(
                  child: MyContainer(
                    function: () {
                      setState(() {
                        chosedGender = "ERKEK";
                      });
                    },
                    color: chosedGender == "ERKEK"
                        ? Colors.teal
                        : Theme.of(context).hintColor,
                    child: const GenderICN(
                        genderICN: FaIcon(FontAwesomeIcons.mars, size: 50),
                        text: "ERKEK"),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(User_Data(
                        icilenSigara:icilenSigara,
                        sporSayisi:sporSayisi,
                        chosedGender:chosedGender,
                        kilo:kilo,
                        boy:boy)),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  minimumSize: const Size(double.infinity, 60),
                  backgroundColor: Theme.of(context).hintColor),
              child: Text(
                "HESAPLA",
                style: textstyle_1,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Expanded Endekses(String label) {
    return Expanded(
      child: MyContainer(
          color: Theme.of(context).hintColor,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                label,
                style: textstyle_1,
              ),
              const SizedBox(
                height: 7,
              ),
              Text(
                label == "BOY" ? boy.toString() : kilo.toString(),
                style: numberstyle_1,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.black12,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    onPressed: () {
                      setState(() {
                        label == "BOY" ? boy++ : kilo++;
                      });
                    },
                    child: const Icon(
                      Icons.add,
                    ),
                  ),
                  const SizedBox(width: 30),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.black12,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    onPressed: () {
                      setState(() {
                        label == "BOY" ? boy-- : kilo--;
                      });
                    },
                    child: const Icon(
                      Icons.remove,
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
