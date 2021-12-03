import 'package:flutter/material.dart';
import 'package:projeto_iaad/CustomAppBar.dart';
import 'package:http/http.dart' as http;

import 'Assets.dart';
import 'Receita.dart';
import 'infra.dart';

class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  @override
  Widget build(BuildContext context) {
    Receita? _receita = Helper.getRouteArgs(context) as Receita?;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomAppBarBack(),
          Expanded(
              child: ListView(shrinkWrap: true, children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FormAdd(
                receita: _receita,
              ),
            ),
          ])),
        ],
      ),
    );
  }
}

class FormAdd extends StatefulWidget {
  Receita? receita;

  FormAdd({required this.receita});

  @override
  State<StatefulWidget> createState() {
    return _FormAddState();
  }
}

class _FormAddState extends State<FormAdd> {
  final _formKey = GlobalKey<FormState>();
  var id_receita;
  var id_usuario;
  var data;
  var review;
  var rating;
  var tag;
  var ingrediente;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "ID_RECEITA:",
                      style: Assets.inriaSans18dim,
                    ),
                    TextFormField(
                      initialValue: widget.receita!.id_receita.toString(),
                      decoration: InputDecoration(
                        hintText: widget.receita!.id_receita.toString(),
                      ),
                      onSaved: (value) {
                        setState(() {
                          id_receita = value!.toString();
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "O Campo nao pode ficar vazio";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              Assets.smallPaddingBox,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Nome da tag:",
                      style: Assets.inriaSans18dim,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Nome da tag",
                      ),
                      onSaved: (value) {
                        setState(() {
                          tag = value!.toString();
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "O Campo nao pode ficar vazio";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              Center(
                child: TextButton(
                    onPressed: () async {
                      _formKey.currentState!.save();
                      getLen(String string, limit) {
                        if (string.length >= limit) {
                          return limit;
                        } else
                          return string.length;
                      }

                      String url =
                          """http://127.0.0.1:5000/insert/tags/["${widget.receita!.id_receita}", "${tag.replaceAll('"', "'")}"]""";
                      Uri uri = Uri.parse(url);
                      final response = await http.get(uri);
                      Helper.back(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('tag Adicionada')),
                      );
                    },
                    child: Chip(
                      avatar: Icon(Icons.save),
                      label: Text(
                        "Save",
                        style: Assets.inriaSans18dim,
                      ),
                    )),
              )
            ],
          ),
          Assets.smallPaddingBox,
          Assets.smallPaddingBox,
          Assets.smallPaddingBox,
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "ID_RECEITA:",
                      style: Assets.inriaSans18dim,
                    ),
                    TextFormField(
                      initialValue: widget.receita!.id_receita.toString(),
                      decoration: InputDecoration(
                        hintText: widget.receita!.id_receita.toString(),
                      ),
                      onSaved: (value) {
                        setState(() {
                          id_receita = value!.toString();
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "O Campo nao pode ficar vazio";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              Assets.smallPaddingBox,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Nome do Ingrediente:",
                      style: Assets.inriaSans18dim,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Nome do Ingrediente",
                      ),
                      onSaved: (value) {
                        setState(() {
                          ingrediente = value!.toString();
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "O Campo nao pode ficar vazio";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              Center(
                child: TextButton(
                    onPressed: () async {
                      _formKey.currentState!.save();
                      getLen(String string, limit) {
                        if (string.length >= limit) {
                          return limit;
                        } else
                          return string.length;
                      }

                      String url =
                          """http://127.0.0.1:5000/insert/ingrediente/["${widget.receita!.id_receita}", "${ingrediente.replaceAll('"', "'")}"]""";
                      Uri uri = Uri.parse(url);
                      final response = await http.get(uri);
                      Helper.back(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Ingrediente Adicionado')),
                      );
                    },
                    child: Chip(
                      avatar: Icon(Icons.save),
                      label: Text(
                        "Save",
                        style: Assets.inriaSans18dim,
                      ),
                    )),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Divider(),
          ),

          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "ID_RECEITA:",
                      style: Assets.inriaSans18dim,
                    ),
                    TextFormField(
                      initialValue: widget.receita!.id_receita.toString(),
                      decoration: InputDecoration(
                        hintText: widget.receita!.id_receita.toString(),
                      ),
                      onSaved: (value) {
                        setState(() {
                          id_receita = value!.toString();
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "O Campo nao pode ficar vazio";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              Assets.smallPaddingBox,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "ID_USUARIO",
                      style: Assets.inriaSans18dim,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "ID_USUARIO",
                      ),
                      onSaved: (value) {
                        setState(() {
                          id_usuario = value!.toString();
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "O Campo nao pode ficar vazio";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          Assets.smallPaddingBox,
          Assets.smallPaddingBox,
          Assets.smallPaddingBox,
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Data da Review:",
                      style: Assets.inriaSans18dim,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "AAAA-MM-DD",
                      ),
                      onSaved: (value) {
                        setState(() {
                          data = value!.toString();
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "O Campo nao pode ficar vazio";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              Assets.smallPaddingBox,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Rating",
                      style: Assets.inriaSans18dim,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Uma nota de 0 a 5",
                      ),
                      onSaved: (value) {
                        setState(() {
                          rating = value!.toString();
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "O Campo nao pode ficar vazio";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          Assets.smallPaddingBox,
          Assets.smallPaddingBox,
          Assets.smallPaddingBox,
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Review:",
                      style: Assets.inriaSans18dim,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Comentario sobre a Receita",
                      ),
                      onSaved: (value) {
                        setState(() {
                          review = value!.toString();
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "O Campo nao pode ficar vazio";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              Assets.smallPaddingBox,
              Center(
                child: TextButton(
                    onPressed: () async {
                      _formKey.currentState!.save();
                      getLen(String string, limit) {
                        if (string.length >= limit) {
                          return limit;
                        } else
                          return string.length;
                      }

                      String url =
                          """http://127.0.0.1:5000/insert/review/["${widget.receita!.id_receita}","${id_usuario}","${data}","${rating}", "${review.replaceAll('"', "'")}"]""";
                      Uri uri = Uri.parse(url);
                      final response = await http.get(uri);
                      Helper.back(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Review Adicionada')),
                      );
                    },
                    child: Chip(
                      avatar: Icon(Icons.save),
                      label: Text(
                        "Save",
                        style: Assets.inriaSans18dim,
                      ),
                    )),
              )
            ],
          ),
          Assets.smallPaddingBox,
          Assets.smallPaddingBox,
          Assets.smallPaddingBox,
        ],
      ),
    );
  }
}

class AddReceitaScreen extends StatefulWidget {
  @override
  _AddReceitaScreenState createState() => _AddReceitaScreenState();
}

class _AddReceitaScreenState extends State<AddReceitaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomAppBarBack(),
          Expanded(
              child: ListView(shrinkWrap: true, children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FormAddReceita(),
            ),
          ])),
        ],
      ),
    );
  }
}

class FormAddReceita extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FormAddReceitaState();
  }
}

class _FormAddReceitaState extends State<FormAddReceita> {
  final _formKey = GlobalKey<FormState>();
  var titulo;
  var tempo;

  var nIngredientes;

  var nPassos;
  var instrucoes;
  var id_receita;
  var id_usuario;
  var descricao;
  var data;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Titulo:",
            style: Assets.inriaSans18dim,
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Titulo da receita",
            ),
            onSaved: (value) {
              setState(() {
                titulo = value!;
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "O Campo nao pode ficar vazio";
              }
              return null;
            },
          ),
          Text(
            "Tempo em Minutos:",
            style: Assets.inriaSans18dim,
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Tempo em minutos da receita",
            ),
            onSaved: (value) {
              setState(() {
                tempo = value!;
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "O Campo nao pode ficar vazio";
              }
              return null;
            },
          ),
          Text(
            "Numero de Ingredientes:",
            style: Assets.inriaSans18dim,
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Numero de Ingredientes da Receita",
            ),
            onSaved: (value) {
              setState(() {
                nIngredientes = value!.toString();
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "O Campo nao pode ficar vazio";
              }
              return null;
            },
          ),
          Text(
            "Numero de Passos:",
            style: Assets.inriaSans18dim,
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Numero de passos",
            ),
            onSaved: (value) {
              setState(() {
                nPassos = value!.toString();
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "O Campo nao pode ficar vazio";
              }
              return null;
            },
          ),
          Text(
            "Instruções:",
            style: Assets.inriaSans18dim,
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText:
                  "Coloque as instruçoes em formato de lista ['item 1', 'item 2']. nao use aspas duplas",
            ),
            onSaved: (value) {
              setState(() {
                instrucoes = value!;
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "O Campo nao pode ficar vazio";
              }
              return null;
            },
          ),
          Text(
            "Descrição:",
            style: Assets.inriaSans18dim,
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Descriçao Da Receita",
            ),
            onSaved: (value) {
              setState(() {
                descricao = value!;
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "O Campo nao pode ficar vazio";
              }
              return null;
            },
          ),
          Text(
            "ID_RECEITA:",
            style: Assets.inriaSans18dim,
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: "ID da receita",
            ),
            onSaved: (value) {
              setState(() {
                id_receita = value!;
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "O Campo nao pode ficar vazio";
              }
              return null;
            },
          ),
          Text(
            "ID_USUARIO:",
            style: Assets.inriaSans18dim,
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: "ID do usuario que criou a receita",
            ),
            onSaved: (value) {
              setState(() {
                id_usuario = value!;
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "O Campo nao pode ficar vazio";
              }
              return null;
            },
          ),
          Text(
            "Data:",
            style: Assets.inriaSans18dim,
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Insira a data no formato: AAAA-MM-DD",
            ),
            onSaved: (value) {
              setState(() {
                data = value!;
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty || value.length != 10) {
                return "O Campo está errado/vazio";
              }
              return null;
            },
          ),
          Assets.smallPaddingBox,
          Center(
            child: TextButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    getLen(String string, limit) {
                      if (string.length >= limit) {
                        return limit;
                      } else
                        return string.length;
                    }

                    String url =
                        """http://127.0.0.1:5000/insert/receita/[$id_receita,$id_usuario,"$titulo",$nIngredientes,$tempo,$nPassos,"$data","${instrucoes.toString().replaceAll("*", " ").replaceAll("-", " ").replaceAll("#", " ").replaceRange(getLen("$instrucoes", 100), "$instrucoes".length, ".")}","${descricao.toString().replaceAll("*", " ").replaceAll("-", " ").replaceAll("#", " ").replaceRange(getLen("$descricao", 50), "$descricao".length, ".")}", "['.']", "['.']" ]""";
                    Uri uri = Uri.parse(url);
                    final response = await http.get(uri);

                    Helper.back(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Receita Criada')),
                    );
                  }
                },
                child: Chip(
                  avatar: Icon(Icons.save),
                  label: Text(
                    "Save",
                    style: Assets.inriaSans18dim,
                  ),
                )),
          )
        ],
      ),
    );
  }
}
