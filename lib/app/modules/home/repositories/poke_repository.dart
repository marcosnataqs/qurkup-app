import 'package:dio/dio.dart';
import 'package:qurkup/app/modules/home/models/pokemon_model.dart';

class PokeRepository {
  final Dio dio;

  PokeRepository(this.dio);

  Future<List<PokemonModel>> index() async {
    var response = await dio.get('/pokemon');
    List<PokemonModel> list = [];
    for (var item in response.data['results'] as List) {
      PokemonModel pokemon = PokemonModel(name: item['name']);
      list.add(pokemon);
    }

    return list;
  }
}
