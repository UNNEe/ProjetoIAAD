import 'package:flutter/material.dart';
import 'package:projeto_iaad/Assets.dart';
import 'infra.dart';

class CustomAppBarBack extends StatelessWidget {
  var updateFunction;

  CustomAppBarBack({this.updateFunction});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      color: Colors.blueAccent,
      child: Row(
        children: [
          Text(
            "Projeto IAAD",
            style: Assets.inriaSans32white,
          ),
          IconButton(
              onPressed: () {
                Helper.back(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          IconButton(
              onPressed: updateFunction,
              icon: Icon(
                Icons.refresh,
                color: Colors.white,
              )),
          Spacer(),
          Text("Feito por: Mário Henrique \n                  e Lucas Martins",
              style: Assets.inriaSans7dimw)
        ],
      ),
    );
  }
}

class CustomAppBarMain extends StatelessWidget {
  var addFunction;

  CustomAppBarMain({this.addFunction});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      color: Colors.blueAccent,
      child: Row(
        children: [
          Text(
            "Projeto IAAD",
            style: Assets.inriaSans32white,
          ),
          IconButton(
              onPressed: () {
                Helper.go(context, "/search");
              },
              icon: Icon(
                Icons.search,
                color: Colors.white,
              )),
          IconButton(
              onPressed: addFunction ?? (){},
              icon: Icon(
                Icons.add,
                color: Colors.white,
              )),
          Spacer(),
          Text("Feito por: Mário Henrique \n                  e Lucas Martins",
              style: Assets.inriaSans7dimw)
        ],
      ),
    );
  }
}

class CustomAppBarDetail extends StatelessWidget {
  var editFunction;
  var deleteFunction;
  var addFunction;

  CustomAppBarDetail({this.editFunction, this.deleteFunction, this.addFunction});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      color: Colors.blueAccent,
      child: Row(
        children: [
          Text(
            "Projeto IAAD",
            style: Assets.inriaSans32white,
          ),
          IconButton(
              onPressed: () {
                Helper.back(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          IconButton(
              onPressed: editFunction,
              icon: Icon(
                Icons.edit,
                color: Colors.white,
              )),
          IconButton(
              onPressed: deleteFunction,
              icon: Icon(
                Icons.delete_forever,
                color: Colors.white,
              )),
          IconButton(
              onPressed: addFunction,
              icon: Icon(
                Icons.add,
                color: Colors.white,
              )),
          Spacer(),
          Text("Feito por: Mário Henrique \n                  e Lucas Martins",
              style: Assets.inriaSans7dimw)
        ],
      ),
    );
  }
}
