import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:projeto_iaad/CustomAppBar.dart';
import 'package:projeto_iaad/Receita.dart';
import 'Assets.dart';
import 'Review.dart';
import 'infra.dart';
import 'package:projeto_iaad/TagsIngredientes.dart';
import 'package:http/http.dart' as http;

class DetailScreen extends StatefulWidget {
  DetailScreen({Key? key}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  List<Tags> _tags = [];
  List<Ingrediente> _ingredientes = [];
  List<Review> _reviews = [];

  @override
  void initState() {
    _fetchSelect();
    super.initState();
  }

  _fetchSelect() async {
    var urlt = Uri.parse(
        '''http://127.0.0.1:5000/select/tags/"${tagsController.receita_id}"''');

    var urli = Uri.parse(
        '''http://127.0.0.1:5000/select/ingrediente/"${ingredienteController.receita_id}"''');

    var urlr = Uri.parse(
        '''http://127.0.0.1:5000/select/review/"${ingredienteController.receita_id}"''');

    final response1 = await http.get(urlt);
    var tagR = json.decode(response1.body.toString());
    tagsController.clear();
    for (var x in tagR['response']) {
      tagsController.save(x);
    }

    final response2 = await http.get(urli);
    var ingredienteR = json.decode(response2.body.toString());
    ingredienteController.clear();
    for (var x in ingredienteR['response']) {
      ingredienteController.save(x);
    }

    final response3 = await http.get(urlr);
    var reviewR = json.decode(response3.body.toString());
    reviewController.clear();
    for (var x in reviewR['response']) {
      reviewController.save(x);
    }

    setState(() {
      _tags = tagsController.getAll();
      _ingredientes = ingredienteController.getAll();
      _reviews = reviewController.getAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    Receita? _receita = Helper.getRouteArgs(context) as Receita?;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomAppBarDetail(
            addFunction: () {
              Helper.go(context, "/addti", arguments: _receita);
            },
            editFunction: () {
              Helper.go(context, "/edit", arguments: _receita);
            },
            deleteFunction: () {
              Uri url = Uri.parse(
                  "http://127.0.0.1:5000/delete/receita/${_receita!.id_receita}");
              http.get(url);
              Helper.back(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Receita Deletada')),
              );
            },
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                Container(
                  height: 50,
                  width: Helper.getScreenWidth(context),
                  color: Assets.darkGreyColor,
                  child: Row(
                    children: [
                      Text(
                        _receita!.titulo,
                        style: Assets.inriaSans42white,
                      ),
                      Assets.smallPaddingBox,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Assets.smallPaddingBox,
                          Text(
                            "Tempo de preparo:${_receita.tempo} minutos",
                            style: Assets.inriaSans7dimw,
                          ),
                          Text(
                            "Data:${_receita.data}",
                            style: Assets.inriaSans7dimw,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: Text(
                    "Tags:",
                    style: Assets.inriaSans18dim,
                  ),
                ),
                Container(
                  height: 35,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: _chipBuilder,
                    padding: EdgeInsets.all(1),
                    itemCount: _tags.length,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: Text(
                    "Ingredientes:",
                    style: Assets.inriaSans18dim,
                  ),
                ),
                Container(
                  height: 35,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: _chipBuilderI,
                    padding: EdgeInsets.all(1),
                    itemCount: _ingredientes.length,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Descrição:",
                        style: Assets.inriaSans18dim,
                      ),
                      Text(
                        _receita.descricao,
                        style: Assets.inriaSans18,
                      ),
                      Text(
                        "Instruções:",
                        style: Assets.inriaSans18dim,
                      ),
                      Text(
                        _receita.instrucoes
                            .replaceAll("]", '')
                            .replaceAll("', '", '\n -')
                            .replaceAll("[", ''),
                        style: Assets.inriaSans18,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: Text(
                    "Reviews:",
                    style: Assets.inriaSans18dim,
                  ),
                ),
                Container(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: _chipBuilderR,
                    padding: EdgeInsets.all(1),
                    itemCount: _reviews.length,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _chipBuilder(context, index) {
    Tags item = _tags[index];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Chip(
        deleteIconColor: Colors.white,
        deleteIcon: Icon(
          Icons.cancel,
          color: Colors.white,
          size: 18,
        ),
        onDeleted: () async {
          print("delete chip");
          String url =
              """http://127.0.0.1:5000/delete/tags/["${item.id_receita}","${item.tag_receita}"]""";
          Uri uri = Uri.parse(url);
          final response = await http.get(uri);
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Tag "${item.tag_receita}" deletada')));
        },
        label: Text(
          item.tag_receita,
          style: Assets.inriaSans18white,
        ),
        backgroundColor: Assets.darkGreyColor,
      ),
    );
  }

  Widget _chipBuilderR(context, index) {
    print(_reviews.length);
    if (_reviews.length == 0) {
      return Text("Esta receita nao tem nenhuma Review.");
    } else {
      Review item = _reviews[index];
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: GestureDetector(
          onLongPress: () async {
            print("delete chip");
            String url =
                """http://127.0.0.1:5000/delete/review/["${item.id_receita}","${item.id_usuario}"]""";
            Uri uri = Uri.parse(url);
            final response = await http.get(uri);
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Review deletado')));
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Assets.darkGreyColor,
            ),
            width: 300,
            height: 200,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text(
                        item.id_usuario.toString(),
                        style: Assets.inriaSans18white,
                      ),
                      Spacer(),
                      Text(
                        "${item.rating}",
                        style: Assets.inriaSans32white,
                      )
                    ],
                  ),
                  Expanded(
                    child: ListView(shrinkWrap: true, children: [
                      Text(
                        item.review.toString(),
                        style: Assets.inriaSans18white,
                      ),
                    ]),
                  ),
                  Text(
                    item.data.toString(),
                    style: Assets.inriaSans18white,
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

  Widget _chipBuilderI(context, index) {
    Ingrediente item = _ingredientes[index];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Chip(
        deleteIconColor: Colors.white,
        deleteIcon: Icon(
          Icons.cancel,
          color: Colors.white,
          size: 18,
        ),
        onDeleted: () async {
          print("delete chip");
          String url =
              """http://127.0.0.1:5000/delete/ingredientes/["${item.id_receita}","${item.ingrediente_receita}"]""";
          Uri uri = Uri.parse(url);
          final response = await http.get(uri);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content:
                  Text('Ingrediente "${item.ingrediente_receita}" deletado')));
        },
        label: Text(
          item.ingrediente_receita,
          style: Assets.inriaSans18white,
        ),
        backgroundColor: Assets.darkGreyColor,
      ),
    );
  }
}
