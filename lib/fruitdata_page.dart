import 'package:flutter/material.dart';

import 'fruitdatamodel.dart';

class FruitDetail extends StatefulWidget {
  final List<FruitDataModel> fruitDataModel;
  int index;

  FruitDetail({Key? key, required this.index, required this.fruitDataModel})
      : super(key: key);

  @override
  State<FruitDetail> createState() => _FruitDetailState();
}

class _FruitDetailState extends State<FruitDetail> {
  @override
  Widget build(BuildContext context) {
    // print("datamodel: ${widget.fruitDataModel}");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.fruitDataModel[widget.index].name),
      ),
      body: Column(
        children: [
          Image.network(widget.fruitDataModel[widget.index].imageUrl),
          SizedBox(
            height: 10,
          ),
          Text(
            widget.fruitDataModel[widget.index].desc,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )
        ],
      ),

      //--------------------------------
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FloatingActionButton(
            heroTag: 'b1',
            onPressed: () {
              setState(() {
                if (widget.index != 0) {             // 0 index vanchina mattum decrement aagathu
                  widget.index--;
                  print(widget.index);
                }
              });
            },
            child: Icon(Icons.arrow_back_ios),
          ),
          FloatingActionButton(
            heroTag: 'b2',
            onPressed: () {
              setState(() {
                if (widget.index != widget.fruitDataModel.length - 1) {  // total lenth oda -1 na 
                  widget.index++;
                  print(widget.index);
                }
              });
            },
            child: Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}
