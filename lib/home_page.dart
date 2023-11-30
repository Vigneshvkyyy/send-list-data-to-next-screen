import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import 'fruitdata_page.dart';
import 'fruitdatamodel.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  //-----------------------------
static List<String> fruitname =['Apple','Banana','Mango','Orange','pineapple'];
    static List url = ['https://www.applesfromny.com/wp-content/uploads/2020/05/Jonagold_NYAS-Apples2.png',
      'https://cdn.mos.cms.futurecdn.net/42E9as7NaTaAi4A6JcuFwG-1200-80.jpg',
      'https://upload.wikimedia.org/wikipedia/commons/thumb/9/90/Hapus_Mango.jpg/220px-Hapus_Mango.jpg',
      'https://5.imimg.com/data5/VN/YP/MY-33296037/orange-600x600-500x500.jpg',
      'https://5.imimg.com/data5/GJ/MD/MY-35442270/fresh-pineapple-500x500.jpg'];
    final List<FruitDataModel> Fruitdata = List.generate(
        fruitname.length,
            (index)
        => FruitDataModel('${fruitname[index]}', '${url[index]}','${fruitname[index]} Description...'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Text("Pass data"),
        ),

        //---------------------------------------------------------
        body: Column(
          children: [
            Container(
              height: 500,
              child: ListView.builder(
                  itemCount: Fruitdata.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(Fruitdata[index].name),
                        leading: SizedBox(
                          height: 50,
                          width: 50,
                          child: Image.network(Fruitdata[index].imageUrl),
                        ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                               FruitDetail(
                                
                                index:index,
                                 fruitDataModel: Fruitdata)));
                        },
                      ),
                    );
                  }),
            )
          ],
        ));
  }
}
