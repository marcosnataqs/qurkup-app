import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:qurkup/app/modules/home/models/pokemon_model.dart';
import 'package:qurkup/app/modules/home/repositories/poke_repository.dart';
import 'package:qurkup/app/shared/auth/auth_controller.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final PokeRepository repository;

  @observable
  ObservableFuture<List<PokemonModel>> pokemons;

  _HomeControllerBase(this.repository) {
    fetchPokemons();
  }

  @action
  fetchPokemons() {
    pokemons = repository.index().asObservable();
  }

  signOut() async {
    await Modular.get<AuthController>().signOut();
    Modular.to.pushReplacementNamed('/login/');
  }
}
