import 'package:autochek_assessment/utils/app_colors.dart';
import 'package:autochek_assessment/utils/utilities.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: alabasterGrey,
      appBar: AppBar(
        backgroundColor: alabasterGrey,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: const Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Icon(Icons.apps),
            SizedBox(
              width: 15,
            ),
            Text(
              'Explore',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ],
        ),
        leadingWidth: width(context) / 2,
        actions: const [
          Icon(Icons.shopping_bag_outlined),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: appWhite,
                        ),
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: appWhite,
                        ),
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: appWhite,
                        ),
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  padding: const EdgeInsets.all(13),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: mineShaftBlack,
                  ),
                  child: const Icon(Icons.tune, color: Colors.yellow, size: 20),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 100,
            child: ListView.separated(
              padding: const EdgeInsets.only(left: 20.0),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return const CircleAvatar(
                  radius: 35,
                  backgroundImage: CachedNetworkImageProvider(
                    "http://via.placeholder.com/350x150",
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: 20,
                );
              },
            ),
          ),
          Stack(
            children: [
              Container(),
            ],
          )
        ],
      ),
    );
  }
}
