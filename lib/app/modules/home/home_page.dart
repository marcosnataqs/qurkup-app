import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:qurkup/app/modules/home/home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.highlight_off),
          onPressed: controller.signOut,
        ),
        title: Text('HomePage'),
      ),
      body: Observer(builder: (_) {
        if (controller.pokemons.error != null) {
          return Center(
            child: RaisedButton(
              child: Text('Loading error'),
              onPressed: () {
                controller.fetchPokemons();
              },
            ),
          );
        }

        if (controller.pokemons.value == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        var list = controller.pokemons.value;

        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (_, int index) {
            return ListTile(
              title: Text(list[index].name),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
