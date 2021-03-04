import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:qurkup/app/modules/home/home_controller.dart';
import 'package:qurkup/app/modules/home/home_page.dart';
import 'package:qurkup/app/modules/home/repositories/poke_repository.dart';
import 'package:qurkup/app/shared/utils/constants.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(i.get())),
        Bind((i) => PokeRepository(i.get())),
        Bind((i) => Dio(BaseOptions(baseUrl: BASE_URL))),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => HomePage()),
      ];
}
