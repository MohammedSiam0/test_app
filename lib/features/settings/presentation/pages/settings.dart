import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../../../core/utils/assets_manger.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  double profileImageHeight = 280;
  double profileHeight = 144;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: profileHeight,
            shape: const CircleBorder(
                side: BorderSide(
                    color: Colors.green, width: 4, style: BorderStyle.solid)),
            stretch: true,
            floating: false,
            pinned: false,
            flexibleSpace: _buildProfileImageWidget(),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              _buildContent(),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileImageWidget() {
    return CircleAvatar(
      backgroundColor: Colors.grey.shade800,
      radius: profileHeight / 1,
      backgroundImage: const NetworkImage(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4oz0KdCvHj_hvY5exy-qFr06SPFjyA4ZoPg&usqp=CAU',
      ),
    );
  }

  Widget _buildContent() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(25),
        topLeft: Radius.circular(25),
      ),
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            const Text('Hannen Dh', style: TextStyle(color: Colors.black)),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  elevation: 0, backgroundColor: Colors.transparent),
              onPressed: () {},
              icon: Icon(
                Icons.edit_outlined,
                size: 20,
                color: Colors.grey.shade500,
              ),
              label: Text(
                'Edit Profile',
                style: TextStyle(color: Colors.grey.shade500),
              ),
            ),
            SizedBox(
              width: 170,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  minHeight: 5,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                  backgroundColor: Colors.grey,
                  value: 0.5,
                ),
              ),
            ),
            const SizedBox(
              width: 170,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'profile progress',
                    style: TextStyle(fontSize: 13, color: Colors.black),
                  ),
                  Text(
                    "20",
                    style: TextStyle(fontSize: 13, color: Colors.black),
                  ),
                ],
              ),
            ),
            ListView.builder(
              itemCount: AppAssets.settingScreen.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final isLastItem = index == AppAssets.settingScreen.length - 1;
                final isSecondToLast =
                    index == AppAssets.settingScreen.length - 2;
                return Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Text(
                      AppAssets.settingScreen[index],
                      style: isSecondToLast
                          ? TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold)
                          : const TextStyle(color: Colors.black87),
                    ),
                    trailing: isLastItem || isSecondToLast
                        ? SizedBox()
                        : Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey.shade400,
                            size: 20,
                          ),
                    dense: true,
                    selectedTileColor: Colors.indigo,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
