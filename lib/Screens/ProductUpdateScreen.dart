
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rest_api/Rest%20Api/Rest_Client.dart';
import 'package:rest_api/style/style.dart';

import 'ProductGridviewScreen.dart';





class ProductUpdateScreen extends StatefulWidget {
   final Map productItem;
  const ProductUpdateScreen(this.productItem, {super.key});

  @override

  State<ProductUpdateScreen> createState() => _ProductUpdateScreenState();
}

class _ProductUpdateScreenState extends State<ProductUpdateScreen> {

  Map<String,dynamic> FromValues = {"Img":"", "ProductCode":"", "ProductName":"", "Qty":"", "TotalPrice":"", "UnitPrice":""};

  bool Loading = false;

@override
void initState(){
  setState(() {
    FromValues.update("Img", (value) => widget.productItem['Img']);
    FromValues.update("ProductCode",(value) => widget.productItem['ProductCode']);
    FromValues.update("ProductName", (value) => widget.productItem['ProductName']);
    FromValues.update("Qty", (value) => widget.productItem['Qty']);
    FromValues.update("TotalPrice",(value) => widget.productItem['TotalPrice']);
    FromValues.update("UnitPrice", (value) => widget.productItem['UnitPrice']);
  });

}

  InputOnChange(MapKey,Textvalue){
    setState(() {
      FromValues.update(MapKey, (value) => Textvalue);
    });
  }
  FormOnSubmit()async{
    if (FromValues['Img']!.length == 0) {
      ErrorToast( 'Image Link Required !');
    }
    else if (FromValues['ProductCode']!.length == 0) {
      ErrorToast( 'Product Code Required !');
    }
    else if (FromValues['ProductName']!.length == 0) {
      ErrorToast( 'Product Name Required !');
    }
    else if (FromValues['Qty']!.length == 0) {
      ErrorToast( 'Quantity Required !');
    }
    else if (FromValues['TotalPrice']!.length == 0) {
      ErrorToast( 'Total Price Required !');
    }
    else if (FromValues['UnitPrice']!.length == 0) {
      ErrorToast( 'Unit Price Required !');
    }
    else{
      setState(() {
        Loading= true;
      });
      await ProductUpdateRequest(FromValues,widget.productItem["_id"]);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => GridViewListScreen()),
            (Route route)=> false
          );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Product'),
      ),
      body: Stack(
        children: [
          Container(
            child: Loading?Center(child:CircularProgressIndicator(),):(SingleChildScrollView (
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  TextFormField(
                    initialValue: FromValues['ProductName'],
                    onChanged: (Textvalue){
                      InputOnChange('ProductName', Textvalue);
                    },
                    decoration: AppInputDecoration("Product Name"),

                  ),

                  const SizedBox(height: 15,),

                  TextFormField(
                    initialValue: FromValues['ProductCode'],
                    onChanged: (Textvalue){
                      InputOnChange('ProductCode', Textvalue);
                    },
                    decoration: AppInputDecoration("Product Code"),
                  ),

                  const SizedBox(height: 15,),

                  TextFormField(
                    initialValue: FromValues['UnitPrice'],
                    onChanged: (Textvalue){
                      InputOnChange('UnitPrice', Textvalue);
                    },
                    decoration: AppInputDecoration("Unit Price"),
                  ),

                  const SizedBox(height: 15,),

                  TextFormField(
                    initialValue: FromValues['TotalPrice'],
                    onChanged: (Textvalue){
                      InputOnChange('TotalPrice', Textvalue);
                    },
                    decoration: AppInputDecoration("Total price"),
                  ),

                  const SizedBox(height: 15,),

                  TextFormField(
                    initialValue:FromValues['Img'],
                    onChanged: (Textvalue){
                      InputOnChange('Img', Textvalue);
                    },
                    decoration: AppInputDecoration("Product Image"),
                  ),

                  const SizedBox(height: 15,),

                  AppDropDrownStyle(
                    DropdownButton(
                      value: FromValues['Qty'],
                      items: [
                        DropdownMenuItem(child: Text('Select Quantity'), value: ""),
                        DropdownMenuItem(child: Text('1 pcs'), value: "1 pcs"),
                        DropdownMenuItem(child: Text('2 pcs'), value: "2 pcs"),
                        DropdownMenuItem(child: Text('3 pcs'), value: "3 pcs"),
                        DropdownMenuItem(child: Text('4 pcs'), value: "4 pcs"),
                        DropdownMenuItem(child: Text('5 pcs'), value: "5 pcs"),
                        // Add more unique values here
                      ],
                      onChanged: (Textvalue) {
                        InputOnChange('Qty', Textvalue);
                      },
                      underline: Container(),
                      isExpanded: true,
                    ),

                  ),
                  const SizedBox(height: 15,),

                  SizedBox(
                    width: double.infinity,

                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 10)
                      ),
                      onPressed: (){
                        FormOnSubmit();
                      },
                      child: const Text('Update'),
                    ),
                  ),

                ],
              ),
            )),
          ),
        ],
      ),
    );
  }
}



