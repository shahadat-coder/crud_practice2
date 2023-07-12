import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rest_api/Screens/ProductCreateScreen.dart';
import 'package:rest_api/Screens/ProductUpdateScreen.dart';

import '../Rest Api/Rest_Client.dart';
import '../style/style.dart';

class GridViewListScreen extends StatefulWidget {
  const GridViewListScreen({super.key});

  @override

  State<GridViewListScreen> createState() => _GridViewListScreenState();
}

class _GridViewListScreenState extends State<GridViewListScreen> {

List ProductList = [];
bool isLoading = true;

@override
void initState(){
  CallData();
  super.initState();

}

CallData()async{
  isLoading = true;
var data =  await ProductGrideViewisRequest();
setState(() {
  ProductList = data;
  isLoading = false;

});

}

GotoUpdate(context,productItem){
  Navigator.push(
      context,
      MaterialPageRoute(
          builder:( builder)=>ProductUpdateScreen(productItem)
      )
  );
}
DeleteItem(id)async{
showDialog(
    context: context,
    builder: (BuildContext context){
      return AlertDialog(
         title: Text("Delete"),
          content: Text("Do you want to delete! after delete, you can't get it anymore."),
           actions: [
             Row(
               mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 TextButton(
                     onPressed: () async{
                       Navigator.pop(context);

                       setState(() {
                         isLoading = true;});
                       await ProductDeleteRequest(id);
                        await CallData();
                     },
                     child:Text('Yes')),
                 SizedBox(width: 5,),
                 TextButton(
                     onPressed: (){
                       Navigator.pop(context);
                     },
                     child:Text('No')),
               ],
             )
           ],
      );
    }
);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Product'),
      ),
      body: Stack(
        children: [
         Container(
           child: isLoading?Center(child: CircularProgressIndicator()):RefreshIndicator(
             onRefresh: ()async{
              await CallData();
             },
               child: GridView.builder(
                       gridDelegate: ProductGridViewStyle(),
                       itemCount: ProductList.length,
                       itemBuilder:(context,index){
                         return Card(
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.stretch,
                             children: [
                               Expanded(child: Image.network(ProductList[index]['Img'],
                                 fit: BoxFit.fill,
                               )),
                               Container(
                                 padding: EdgeInsets.fromLTRB(5, 5, 5, 8),
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Text(ProductList[index]["ProductName"]),
                                     SizedBox(height: 3,),
                                     Text("Price: ${ProductList[index]["UnitPrice"] + " BDT"}"),
                                     SizedBox(height: 4,),
                                     Row(
                                       mainAxisAlignment: MainAxisAlignment.end,
                                       children: [
                                         OutlinedButton(
                                             onPressed: (){
                                              GotoUpdate(context,ProductList[index]);
                                             },
                                             child: Icon(CupertinoIcons.ellipsis_vertical_circle,color: colorGreen,)),
                                         SizedBox(width: 5,),
                                         OutlinedButton(
                                             onPressed: (){
                                               DeleteItem(ProductList[index]["_id"]);
                                             },
                                             child: Icon(CupertinoIcons.delete,color: Colors.red,)),
                                       ],
                                     )
                                   ],
                                 ),
                               )

                             ],
                           ),
                         );
                       }
                   )




         ),
         ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
           Navigator.push(
               context,
               MaterialPageRoute(
                   builder:( builder)=>ProductCreateScreen()
               )
           );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
