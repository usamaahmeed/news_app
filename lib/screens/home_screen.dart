import 'package:flutter/material.dart';
import 'package:news_app/repository/news_repo.dart';
import 'package:news_app/widget/news_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'News',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 32,
            color: Color(0xff231F20),
          ),
        ),
        backgroundColor: Color(0xffE9EEFA),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 14,
            ),
            Expanded(
              child: FutureBuilder(
                  future: NewsRepo().getNews(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasData) {
                      final news = snapshot.data!;
                      news.shuffle();

                      return ListView.separated(
                        shrinkWrap: true,
                        itemCount: news.length,
                        scrollDirection: Axis.vertical,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 24);
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return NewsWidget(
                            newsData: news[index],
                          );
                        },
                      );
                    }
                    return const SizedBox(width: 10);
                  }),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
