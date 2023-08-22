import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/service/api_service.dart';
import 'package:toonflix/service/webtoon_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  // List<WebtoonModel> webtoons = [];
  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    print(webtoons);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white, // background -> 배경 색
        foregroundColor: Colors.cyan, // foregrond -> 글자 색
        title: const Text(
          "오늘의 웹툰",
          style: TextStyle(
            fontSize: 24,
            // fontWeight: FontWeight.w400, // 폰트 굵기는 w400이 기본
          ),
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                const SizedBox(height: 50),
                Expanded(
                  child: makeList(snapshot),
                ), // Column 아래 ListView는 무한 높이임. 그래서 높이 지정 해야함
              ],
            ); //snapshot.data -> Future<List<WebtoonModel>> webtoons
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(
          vertical: 10, horizontal: 20), // List<WebtoonModel>의 length(개수)
      itemBuilder: (context, index) {
        print(index); //프린트 찍어보는 센스
        var webtoon = snapshot.data![index];
        return Webtoon(
          title: webtoon.title,
          thumb: webtoon.thumb,
          id: webtoon.id,
        );
      },
      separatorBuilder: (context, index) =>
          const SizedBox(width: 40), //item 사이에 렌더링 되는 위젯
    );
  }
}
