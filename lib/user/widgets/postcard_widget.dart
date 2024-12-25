import 'package:flutter/material.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';

class PostcardWidget extends StatefulWidget {
  final String data;
  const PostcardWidget({super.key, required this.data});

  @override
  State<PostcardWidget> createState() => _PostcardWidgetState();
}

class _PostcardWidgetState extends State<PostcardWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureFlipCard(
        animationDuration: const Duration(milliseconds: 300),
        axis: FlipAxis.vertical,
        controller: GestureFlipCardController(),
        enableController: false,
        frontWidget: SizedBox(
          width: 400,
          height: 300,
          child: Card(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              clipBehavior: Clip.antiAlias,
              child: const Image(
                image: NetworkImage('https://picsum.photos/id/237/400/300'),
                fit: BoxFit.cover,
              )),
        ),
        backWidget: SizedBox(
          width: 400,
          height: 300,
          child: Card(
            elevation: 8.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            clipBehavior: Clip.antiAlias,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Time with wild',
                                style: TextStyle(fontSize: 24),
                              ),
                              Text(
                                '2024-12-20',
                                style: TextStyle(color: Colors.blueGrey),
                              ),
                            ],
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              'STAMP',
                              style: TextStyle(fontSize: 10),
                            ),
                          )
                        ]),
                    const SizedBox(height: 16.0),
                    Text(
                      '${widget.data}iNKT ASD 談到實行數位游牧的動機，凱若回憶，某次旅行時在海邊收到訊號，她突發奇想：「只要有網路就可以去任何地方，為何不把家搬到喜歡的地方去？」於是開啟了在歐洲工作生活的模式，並每年都會換地方體驗，堪稱是「最初代的遠距工作者」。經過數年努力與不斷嘗試創業，凱若如今已成立婚禮顧問公司及電子商務平台，同時也是媒體專欄作家，近日則出版《數位游牧》一書。凱若說，她一直都在國外「遠距掌控」她一手創立的公司，而在旅居地，不管是德國還是西班牙，她也努力融入當地社群，認真打造一家子的理想生活，面對數位游牧生活的生活，她跟大家一樣都有生活壓力、工作煩惱、家庭糾結，但只要對理想生活懷有夢想，就可以一步一步向前邁進。談到實行數位游牧的動機，凱若回憶，某次旅行時在海邊收到訊號，她突發奇想：「只要有網路就可以去任何地方，為何不把家搬到喜歡的地方去？」於是開啟了在歐洲工作生活的模式，並每年都會換地方體驗，堪稱是「最初代的遠距工作者」。經過數年努力與不斷嘗試創業，凱若如今已成立婚禮顧問公司及電子商務平台，同時也是媒體專欄作家，近日則出版《數位游牧》一書。凱若說，她一直都在國外「遠距掌控」她一手創立的公司，而在旅居地，不管是德國還是西班牙，她也努力融入當地社群，認真打造一家子的理想生活，面對數位游牧生活的生活，她跟大家一樣都有生活壓力、工作煩惱、家庭糾結，但只要對理想生活懷有夢想，就可以一步一步向前邁進。談到實行數位游牧的動機，凱若回憶，某次旅行時在海邊收到訊號，她突發奇想：「只要有網路就可以去任何地方，為何不把家搬到喜歡的地方去？」於是開啟了在歐洲工作生活的模式，並每年都會換地方體驗，堪稱是「最初代的遠距工作者」。經過數年努力與不斷嘗試創業，凱若如今已成立婚禮顧問公司及電子商務平台，同時也是媒體專欄作家，近日則出版《數位游牧》一書。凱若說，她一直都在國外「遠距掌控」她一手創立的公司，而在旅居地，不管是德國還是西班牙，她也努力融入當地社群，認真打造一家子的理想生活，面對數位游牧生活的生活，她跟大家一樣都有生活壓力、工作煩惱、家庭糾結，但只要對理想生活懷有夢想，就可以一步一步向前邁進。談到實行數位游牧的動機，凱若回憶，某次旅行時在海邊收到訊號，她突發奇想：「只要有網路就可以去任何地方，為何不把家搬到喜歡的地方去？」於是開啟了在歐洲工作生活的模式，並每年都會換地方體驗，堪稱是「最初代的遠距工作者」。經過數年努力與不斷嘗試創業，凱若如今已成立婚禮顧問公司及電子商務平台，同時也是媒體專欄作家，近日則出版《數位游牧》一書。凱若說，她一直都在國外「遠距掌控」她一手創立的公司，而在旅居地，不管是德國還是西班牙，她也努力融入當地社群，認真打造一家子的理想生活，面對數位游牧生活的生活，她跟大家一樣都有生活壓力、工作煩惱、家庭糾結，但只要對理想生活懷有夢想，就可以一步一步向前邁進。',
                      style: const TextStyle(
                          fontSize: 16,
                          height: 2,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.blueGrey,
                          decorationStyle: TextDecorationStyle.dotted),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
