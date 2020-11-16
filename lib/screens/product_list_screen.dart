
import 'package:bloc_sample_1/bloc/cart_bloc.dart';
import 'package:bloc_sample_1/bloc/product_bloc.dart';
import 'package:bloc_sample_1/models/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alışveriş",style: TextStyle(
            color: Colors.purple,
            fontStyle: FontStyle.italic,
            fontSize: 30.0),),
        backgroundColor: Colors.lightGreenAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart,color: Colors.purple,),
            onPressed: () => Navigator.pushNamed(context, "/cart"),
          )
        ],
      ),
      body: buildProductList(),
      backgroundColor: Colors.greenAccent,
    );
  }

  buildProductList() {
    return StreamBuilder(
        initialData: productBloc.getAll(),
        stream: productBloc.getStream,
        builder: (context, snapshot) {
          // sanpshot, o stream in o anki stream degeri gelen
          return snapshot.data.length > 0
              ? buildProductListItems(snapshot)
              : Center(
              child: Text("Data yok",style: TextStyle(
                  color: Colors.purple,
                  fontStyle: FontStyle.italic,
                  fontSize: 10.0),) ,

          );
        });
  }

  buildProductListItems(AsyncSnapshot snapshot) {
    return ListView.builder(
      // dinamik olarak list olusturcaz calisma aninda
      // calisacagi icin length verilmeli
        itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, index) {
          final list = snapshot.data;
          return ListTile(
            title: Text(list[index].name,style: TextStyle(
                color: Colors.purple,
                fontStyle: FontStyle.italic,
                fontSize: 20.0),),
            subtitle: Text(list[index].price.toString(),style: TextStyle(
            color: Colors.deepPurple,
                fontStyle: FontStyle.italic,
                fontSize: 15.0),),
            // leading: Icons.local_florist, leading basina koyar
            trailing: IconButton(
              // Raised button da  olabilirdi.
              icon: Icon(Icons.add_shopping_cart,color: Colors.deepPurple,),
              onPressed: () {
                cartBloc.addToCart(Cart(list[index],1));

              },
            ),
          );
        });
  }
}
