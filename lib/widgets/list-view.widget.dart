import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:listafilmes/class/methedos.dart';
import 'package:listafilmes/widgets/search.widget.dart';

class ListViewApp extends StatefulWidget {
  List list;

  ListViewApp({@required this.list});
  @override
  _ListViewAppState createState() => _ListViewAppState();
}

class _ListViewAppState extends State<ListViewApp> {
  @override
  void initState() {
    super.initState();

    MetheList.readData().then((data) {
      setState(() {
        widget.list = json.decode(data);
      });
    });
  }

  final ctrlAdd = TextEditingController();
  int lastRemovePos;
  Map<String, dynamic> lastRemoved;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SearchWidget(),
        Container(
            padding: EdgeInsets.fromLTRB(17.0, 1.0, 7.0, 1.0),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: TextField(
                  controller: ctrlAdd,
                  decoration: InputDecoration(
                      labelText: "Nova Tarefa",
                      labelStyle: TextStyle(color: Colors.blueAccent)),
                )),
                RaisedButton(
                  color: Colors.blueAccent,
                  child: Text("ADD"),
                  textColor: Colors.white,
                  onPressed: _addToDo,
                )
              ],
            )),
        Expanded(
          child: ListView.builder(
              padding: EdgeInsets.only(top: 10.0),
              itemCount: widget.list.length,
              itemBuilder: buildItem),
        ),
      ],
    );
  }

  void _addToDo() {
    setState(() {
      Map<String, dynamic> newToDo = new Map();
      newToDo["title"] = ctrlAdd.text;
      newToDo["category"] = "Ação";
      newToDo["description"] = "um filme qualquer";
      newToDo["ok"] = false;
      newToDo["edit"] = IconButton(icon: Icon(Icons.edit), onPressed: () {});
      ctrlAdd.text = "";

      widget.list.add(newToDo);
      MetheList.saveData(widget.list);

      // HomeList.items.add(ListTile(
      //   leading: Icon(Icons.pages),
      //   title: Text(_ctrlAdd.text),
      //   //subtitle: Text('Blobloblo'),
      //   trailing: Icon(Icons.more_vert),
      //   onTap: () {
      //     Navigator.of(context).pushNamed(ListPage.tag);
      //   },
      // ));
    });
  }

  Widget buildItem(BuildContext context, dynamic index) {
    return Dismissible(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      background: Container(
        color: Colors.red,
        child: Align(
          alignment: Alignment(-0.9, 0.0),
          child: Icon(Icons.delete, color: Colors.white),
        ),
      ),
      direction: DismissDirection.startToEnd,
      child: CheckboxListTile(
        title: Text(widget.list[index]["title"]),
        value: widget.list[index]["ok"],
        subtitle: Text(widget.list[index]["description"]),
        secondary: CircleAvatar(
          child: Icon(widget.list[index]["ok"] ? Icons.check : Icons.error),
        ),
        onChanged: (c) {
          setState(() {
            widget.list[index]["ok"] = c;
            MetheList.saveData(widget.list);
          });
        },
      ),
      onDismissed: (direction) {
        setState(() {
          lastRemoved = Map.from(widget.list[index]);
          lastRemovePos = index;
          widget.list.removeAt(index);

          MetheList.saveData(widget.list);

          final snack = SnackBar(
            content: Text("Tarefa \"${lastRemoved["title"]}\" removida!"),
            action: SnackBarAction(
                label: "Desfazer",
                onPressed: () {
                  setState(() {
                    widget.list.insert(lastRemovePos, lastRemoved);
                    MetheList.saveData(widget.list);
                  });
                }),
            duration: Duration(seconds: 2),
          );
          Scaffold.of(context).removeCurrentSnackBar();
          Scaffold.of(context).showSnackBar(snack);
        });
      },
    );
  }
}
