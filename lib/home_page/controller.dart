import 'package:dio/dio.dart';
import 'package:untitled/home_page/model.dart';

class Controller {
  Dio dio = Dio();

  Future<List<Article>> fetchData() async {
    final response =
        await dio.get('https://www.breakingbadapi.com/api/characters');
    final app = response.data as List;
    List<Article> article = [];
    app.forEach((element) {
      Article art = Article.fromJson(element);
      article.add(art);
    });
    return article;
  }
}