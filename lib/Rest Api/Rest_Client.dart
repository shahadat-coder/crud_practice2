import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:rest_api/style/style.dart';

 Future<List> ProductGrideViewisRequest()async{
 var URL = Uri.parse('https://crud.teamrabbil.com/api/v1/ReadProduct');
 var postHeader = {'Content-Type':"application/json"};
 var response = await http.get(URL,headers: postHeader );
 var ResultCode = response.statusCode;
 var ResultBody = json.decode(response.body);

 if (response.statusCode==200 && ResultBody['status']== 'success' ) {
  SuccessToast("Request Success");
  return ResultBody['data'];
 }  else{
  ErrorToast("Request fail.try again");
  return [];
 }
}

 Future<bool> ProductCreateRequest(FromValues)async{

  var URL = Uri.parse('https://crud.teamrabbil.com/api/v1/CreateProduct');
  var postBody = json.encode(FromValues);
  var postHeader = {'Content-Type':"application/json"};
  var response = await   http.post(URL,headers: postHeader,body: postBody);
  var ResultCode = response.statusCode;
  var ResultBody = json.decode(response.body);

  if(ResultCode==200 && ResultBody['status']== 'success'){
  SuccessToast("Request Success");
  return true;
  }else{
   ErrorToast("Request fail.try again");
   return false;
  }
}

Future<bool> ProductDeleteRequest(id)async{
 var URL =  Uri.parse('https://crud.teamrabbil.com/api/v1/DeleteProduct'+id);
 var postHeader = {'Content-Type':"application/json"};
  var response = await http.get(URL,headers: postHeader);
 var ResultCode = response.statusCode;
 var ResultBody = json.decode(response.body);

 if(ResultCode==200 && ResultBody['status']== 'success'){
  SuccessToast("Request Success");
  return true;
 }else{
  ErrorToast("Request fail.try again");
  return false;
 }
}
Future<bool> ProductUpdateRequest(FromValues,id)async{

 var URL = Uri.parse('https://crud.teamrabbil.com/api/v1/UpdateProduct/'+id);
 var postBody = json.encode(FromValues);
 var postHeader = {'Content-Type':"application/json"};
 var response = await   http.post(URL,headers: postHeader,body: postBody);
 var ResultCode = response.statusCode;
 var ResultBody = json.decode(response.body);

 if(ResultCode==200 && ResultBody['status']== 'success'){
  SuccessToast("Request Success");
  return true;
 }else{
  ErrorToast("Request fail.try again");
  return false;
 }
}