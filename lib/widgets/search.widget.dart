import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color greenColor = Color(0xFF368B61);
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 80,
            height: 50,
            child: FlatButton(
                onPressed: () {},
                child: Icon(
                  Icons.search,
                  color: greenColor,
                )),
          ),
          SizedBox(
            width: 250,
            height: 34,
            child: TextFormField(
              onChanged: (string) {},
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: greenColor),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: greenColor),
                  borderRadius: BorderRadius.circular(20),
                ),
                hintStyle: TextStyle(color: greenColor),
                fillColor: Colors.transparent,
                filled: true,
                labelText: "Pesquisar",
                labelStyle: TextStyle(
                  color: greenColor,
                ),
                counterStyle: TextStyle(
                  color: Colors.grey,
                ),
                contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
