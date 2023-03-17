import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  var numitems = 20;
  var _biggerFont = TextStyle(fontSize: 18);

  _buildRow(int index) {
    return ListTile(
      leading: CircleAvatar(
        child: Text("$index"),
      ),
      title: Text(
        "User $index",
        style: _biggerFont,
      ),
      trailing: ElevatedButton(onPressed: (){
        print("follow button tapped");
      }, child: Text("follow"),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.search,
          size: 30,
        ),
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.blue),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search",
              border: InputBorder.none,
            ),
          ),
        ),
        
      ),
      body: ListView.builder(
        itemCount: numitems*2,
        padding: EdgeInsets.all(16),
        itemBuilder: (BuildContext context, int i) {
          if(i.isOdd) return Divider();
           
            final index = i~/2 + 1;
            return _buildRow(index);
          

          
        },
    ));
  }
}
