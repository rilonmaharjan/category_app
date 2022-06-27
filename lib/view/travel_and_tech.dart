import 'package:categoryapp/model/jsonurl.dart';
import 'package:categoryapp/model/jsonurl_services.dart';
import 'package:categoryapp/tiles/home_travel.dart';
import 'package:flutter/material.dart';

class TravelandTech extends StatefulWidget {
  const TravelandTech({Key? key}) : super(key: key);

  @override
  State<TravelandTech> createState() => _HomeAndLivingState();
}

class _HomeAndLivingState extends State<TravelandTech> {
 var jsonurl = <Jsonurl>[];
  bool? loading;

  @override
  void initState() {
    JsonurlServices.geturl().then((value) {
      setState(() {
        jsonurl = value;
        loading = false;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return loading == false && jsonurl.isNotEmpty
        ? SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0.0, bottom: 20),
                  child: Container(
                    color: Colors.white,
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 1,
                        itemBuilder: (BuildContext context, int index) {
                          return Wrap(
                            children: List.generate(
                                1,
                                (index) => HomeTile(
                                      image: jsonurl[index].url,
                                      title: jsonurl[index].title,
                                      text: jsonurl[index].id.toString(),
                                      onTap: () {},
                                    )),
                          );
                        }),
                  ),
                ),
                const SizedBox(
                  height: 80,
                )
              ],
            ),
          )
        : Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height - 90,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}
