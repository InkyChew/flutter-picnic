import 'package:flutter/material.dart';
import 'package:picnic/user/widgets/postcard_widget.dart';
import 'package:card_swiper/card_swiper.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Inky'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 40.0,
            backgroundColor: Colors.orange,
            // backgroundImage: NetworkImage(imageUrl),
          ),
          const SizedBox(height: 14.0),
          const Text(
            'Hi everyone',
            style: TextStyle(fontSize: 16.0),
          ),
          const SizedBox(height: 20.0),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  // Handle add to friends logic here
                  // print('friends');
                },
                child: const Text('Friends'),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          Flexible(
              child: Swiper(
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              return PostcardWidget(data: '$index');
            },
            itemCount: 10,
            itemWidth: 400.0,
            itemHeight: 300.0,
            layout: SwiperLayout.STACK,
          )),
        ],
      ),
    );
  }
}
