
import 'package:bloc_sample_1/bloc/cart_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sepet",style: TextStyle(
            color: Colors.purple,
            fontStyle: FontStyle.italic,
            fontSize: 30.0),),
        backgroundColor: Colors.greenAccent,
      ),
      body: StreamBuilder(
        stream: cartBloc.getStream,
        initialData: cartBloc.getCart(),
        builder: (context,snapshot){
          return buildCart(snapshot);
        },
      ),
    );


  }

  Widget buildCart(AsyncSnapshot snapshot) {
    return ListView.builder(
        itemCount: snapshot.data.length,

        itemBuilder: (BuildContext context,index){
          final cart=snapshot.data;
          return ListTile(
            title: Text(cart[index].product.name,style: TextStyle(
            color: Colors.purple,
                fontStyle: FontStyle.italic,
                fontSize: 20.0),),
            subtitle: Text(cart[index].product.price.toString(),style: TextStyle(
                color: Colors.deepPurple,
                fontStyle: FontStyle.italic,
                fontSize: 15.0),),
            trailing: IconButton(
              icon:Icon(Icons.remove_shopping_cart,color: Colors.greenAccent,),
              onPressed: (){
                cartBloc.removeFromCart(cart[index]);
              },
            ),
          );
        });


  }




}