import 'package:categoryapp/tiles/catagory_tile.dart';
import 'package:categoryapp/list/list.dart';
import 'package:categoryapp/view/beverage.dart';
import 'package:categoryapp/view/foods.dart';
import 'package:categoryapp/view/homeand_livings.dart';
import 'package:categoryapp/view/ramen.dart';
import 'package:categoryapp/view/travel_and_tech.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var titleText = "";
  var option = "Foods";
  int changeColorandSize = 0;
  String? title;

  swtichfunction() {
    switch (option) {
      case "Foods":
        return const Foods();
      case "Beverage":
        return const Beverage();
      case "Home & Living":
        return const HomeAndLiving();
      case "Travel & Tech":
        return const TravelandTech();
      case "Ramen":
        return const Ramen();
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      //appbar
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.arrow_back_ios_new,
          color: Color.fromARGB(255, 41, 41, 41),
          size: 19,
        ),
        title: Text(
          title == "Home & Living" ? "Curated from Japan" : titleText,
        ),
        titleTextStyle: const TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
          child: Stack(
        children: [
          Row(
            children: [
              //left side Categories
              SizedBox(
                width: size.width / 3.5,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: categoryList.length,
                    itemBuilder: (context, index) {
                      return CategoryTile(
                        image: categoryList[index]['url'],
                        text: categoryList[index]['name'],
                        onTap: () {
                          setState(() {
                            option = categoryList[index]['name'].toString();
                            title = option;
                            changeColorandSize = index;
                          });
                        },
                        color: changeColorandSize == index
                            ? "0xffffffff"
                            : "0xfff5f5f5",
                        textColor: changeColorandSize == index
                            ? "0xff000000"
                            : "0xff737374",
                        textSize: changeColorandSize == index ? 13.5 : 12.0,
                      );
                    }),
              ),

              //right side contents
              Container(
                color: Colors.white,
                height: size.height,
                width: size.width / 1.4,
                child: swtichfunction(),
              )
            ],
          ),

          //button below
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height * 0.076,
              width: size.width / 1.4,
              child: Padding(
                padding: const EdgeInsets.only(
                    bottom: 20, right: 22, left: 22, top: 10),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    "View All (90)",
                  ),
                  style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      textStyle: const TextStyle(
                          fontSize: 14.5, fontWeight: FontWeight.w300),
                      primary: const Color.fromARGB(255, 41, 41, 41),
                      onPrimary: const Color.fromARGB(255, 230, 230, 230)),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
