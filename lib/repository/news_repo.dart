import 'package:dio/dio.dart';
import 'package:news_app/models/news_model.dart';

class NewsRepo {
  final dio = Dio();
  Future<List<Article>> getNews() async {
    final res = await dio.get(
        'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=95d39f5147a247b2851094bfdfa24cd2');
    final product = NewsModel.fromJson(res.data);
    final productData = product.articles;
    return productData;
  }
}
