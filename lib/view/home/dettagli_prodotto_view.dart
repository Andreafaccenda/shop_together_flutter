import 'package:flutter/material.dart';
import '../../model/prodotti_model.dart';

class DettagliProdottoView extends StatelessWidget {

  ProdottiModel model;
  DettagliProdottoView({required this.model});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0.00,
          leading:GestureDetector(
              child: Icon(
              Icons.food_bank_sharp,
              color: Colors.white,
          ),
          ),
        title: Text("Dettagli prodotto",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
      ),
      body: SingleChildScrollView(
        child: Container(
            width: width,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),),
                  padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
                  alignment: Alignment.center,
                  height: height*0.4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                        model.immagine.toString(),),
                  ),),
                Container(
                  width: width,
                  margin: EdgeInsets.fromLTRB( 10, height*0.45, 10, 20),
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(30),),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(model.nome.toString(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,
                        color: Colors.black,),),
                      SizedBox(height: 5,),
                      Container(
                        height: 50,
                        width: width,
                        child: ListView.builder(
                          itemCount: 5,
                           scrollDirection: Axis.horizontal,
                            itemBuilder: (context,int key){
                              return Icon(Icons.star, color: Colors.yellow[900], size: 16,);
                            },
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text("Descrizione",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w900),),
                      SizedBox(height: 8,),
                      Text(model.descrizione.toString(),style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal,letterSpacing: 0.5,wordSpacing: 1.5),),
                      SizedBox(height: 40,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget> [Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Prezzo",style: TextStyle(color: Colors.grey[500],fontSize: 16,fontWeight: FontWeight.w600),),
                            Text("€${calcolaPrezzo(model.prezzo_unitario.toString(), model.quantita.toString())}",
                            style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),

                          ],
                        ),
                          Container(
                            decoration: BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.circular(20),),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Container(width: 20, height: 20, decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(10),), child: Icon(Icons.minimize,color:Colors.white,size: 15,),),
                                  Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0), child: Text("1",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),),
                                  Container(width: 20, height: 20, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10),), child: Icon(Icons.add,color:Colors.orange,size: 15,),),],),),),

                        ],
                      )
                    ],
                  ),
                ),
                Positioned(
                  right: 30,
                  top: 330,
                  child: GestureDetector(
                    onTap: (){},
                child:Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(35),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.5),
                        blurRadius: 5,
                        spreadRadius: 1)],
                  ),
                  child: Icon(Icons.shopping_cart,size: 30,color: Colors.white,),
                ),),),
              ],),),
      ),
    );
  }
  String calcolaPrezzo(String prezzo,String quantita){
    double prezzoD = double.parse(prezzo);
    double quantitaD = double.parse(quantita);
    double prezzoTotale = prezzoD*quantitaD;
    String number = prezzoTotale.toStringAsFixed(2);
    return number;
  }
}

