import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'package:text2speech/constants/constant_widgets.dart';
import 'package:text2speech/constants/constants.dart';
import 'package:text2speech/model/order_model.dart';
import 'package:text2speech/model/token_model.dart';

TokenModel parseTokenModel(String responseBody) {
  final parsed = json.decode(responseBody);
  return TokenModel.fromJson(parsed);
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Timer? _timer;
  OrderModel? orderModel;
  String? _remainingTime;
  String? _accessToken;
  DateTime? _expirationDateTime;
  bool _isLoading = false;
  String? clientSecret;
  String? clientID;
  String? access_token;
  String? salesId;
  String? salesRefId;
  final TextEditingController _salesIdController = TextEditingController();
  final TextEditingController _salesRefIdController = TextEditingController();
  List<Widget>? orderResultWidget;
  // get widgetList => null;
  bool orderResultLoaded = false;
  @override
  void dispose() {
    _timer?.cancel();
    _salesIdController.dispose();
    _salesRefIdController.dispose();
    super.dispose();
  }

  Future<void> _getToken(String salesId, String salesRefId) async {
    // Display loading indicator
    setState(() {
      _isLoading = true;
    });

    // Determine the API URL based on the order logic and user input

    if (salesRefId.startsWith('8') ||
        salesRefId.startsWith('9') ||
        salesRefId.startsWith('21')) {
      clientSecret = opkw_client_secret;
      clientID = opkw_client_id;

      // Replace with actual OPKW token API URL
    } else if (salesId.startsWith('OPKW')) {
      clientID = opkw_client_id;
      clientSecret =
          opkw_client_secret; // Replace with actual OPKW token API URL
    } else {
      clientID = spae_client_id;
      clientSecret =
          spae_client_secret; // Replace with actual SPAE token API URL
    }

    var body = {
      "grant_type": "client_credentials",
      "client_id": clientID,
      "client_secret": clientSecret,
      "resource": BASE_URL
    };

    // calling the API
    // final apiResponse =        await http.post(Uri.parse(TOKEN_API_URL), headers: headers, body: body);

    var uri = Uri.parse(TOKEN_API_URL);
    debugPrint("Uri : $uri");
    final apiResponse = await http.post(uri, headers: headers, body: body);
    debugPrint("apiResponse: $apiResponse");
    if (apiResponse.statusCode == 200) {
      // final decodeJson = jsonDecode(apiResponse.body);
      final token = parseTokenModel(apiResponse.body.toString());
      _accessToken = token.accessToken;

      //  Checking TIME
      _expirationDateTime = DateTime.fromMillisecondsSinceEpoch(
          int.parse(token.expiresOn!) * 1000);
      _timer?.cancel();
      _timer = Timer.periodic(const Duration(seconds: 1), (_) {
        final now = DateTime.now();
        if (_expirationDateTime!.isBefore(now)) {
          // Token expired, call the getToken API again
          _timer!.cancel();
          _getToken(salesId, salesRefId);
        } else {
          final remainingSeconds =
              _expirationDateTime!.difference(now).inSeconds;
          setState(() {
            _remainingTime = '$remainingSeconds seconds';
          });
        }
      });

      // Hide loading indicator
      setState(() {
        _isLoading = false;
      });
      //  access_token = token.accessToken;
      print(_accessToken);
    } else {
      print(apiResponse.statusCode.toString() +
          " : " +
          apiResponse.body.toString());
    }

    await _getOrdersAPI(_accessToken!);

    setState(() {
      orderResultLoaded = true;
    });
  }

  Future<OrderModel> _getOrdersAPI(String token) async {
    final url = Uri.parse(
        'https://eyewa-prod.operations.dynamics.com/api/services/EWA_CommerceService/EWA_CommerceService/getSalesOrderRecords');
    final orderHeaders = {
      "Access-Control-Allow-Origin": "*",
      'Authorization': 'Bearer $token',
      // 'Content-Type': 'application/json',
      // 'Accept': '*/*'
    };

    final requestBody = json.encode({
      "_request": {
        "PaginationModel": {"PageNumber": 1, "PageSize": 20},
        if (salesId!.isNotEmpty) 'SalesId': salesId,
        if (salesRefId!.isNotEmpty) 'SalesRefId': salesRefId,
      }
    });

    final response =
        await http.post(url, headers: orderHeaders, body: requestBody);

    if (response.statusCode == 200) {
      // Handle the successful response here
      setState(() {
        // _responseText = _flattenJson(json.decode(response.body));
      });
      print(response.body);
      final orderResultParsed = json.decode(response.body);
      orderModel = OrderModel.fromJson(orderResultParsed);
    } else {
      // Handle the error response here
      // print('Error: ${response.statusCode} - ${response.body}');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error: ${response.statusCode} - ${response.body}')));
    }

    return orderModel!;
  }

  void _copyToClipboard(String Value) {
    if (Value.isNotEmpty) {
      Clipboard.setData(ClipboardData(text: Value));
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Response copied to clipboard')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eyewa | Token Expiry : $_remainingTime'),
      ),
      body: _isLoading
          ? const CircularProgressIndicator()
          : Padding(
              padding: const EdgeInsets.all(35.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: _salesIdController,
                    decoration: const InputDecoration(
                      labelText: 'Sales ID [ERP ID]',
                    ),
                  ),
                  TextField(
                    controller: _salesRefIdController,
                    decoration: const InputDecoration(
                      labelText: 'Sales Ref ID [Magento ID]',
                    ),
                  ),
                  vspace(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          salesId = _salesIdController.text;
                          salesRefId = _salesRefIdController.text;
                          debugPrint("Button Pressed");
                          debugPrint((salesId != null && salesRefId == null)
                              .toString());
                          debugPrint((salesId == null && salesRefId != null)
                              .toString());
                          if ((salesId != null && salesRefId == "") ||
                              (salesId == "" && salesRefId != null)) {
                            debugPrint("inside condition");
                            if (access_token != null || access_token != "") {
                              _getToken(salesId!, salesRefId!);
                            } else {
                              await _getOrdersAPI(_accessToken!);
                            }
                            // setState(() {});
                          }
                        },
                        child: const Text('Submit'),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          _salesIdController.clear();
                          _salesRefIdController.clear();
                          orderResultLoaded = false;
                        },
                        child: const Text('Clear'),
                      ),
                      hspace(),
                      Text('ExpireAt: ${_expirationDateTime.toString()}'),
                    ],
                  ),
                  vspace(height: 20),

                  //  ORDER RESULT WIDGET

                  getOrderResult(),
                ],
              ),
            ),
    );
  }

  Widget getOrderResult() {
    if ((orderResultLoaded) && (orderModel!.salesOrders!.isNotEmpty)) {
      final salesOrder = orderModel!.salesOrders;
      final addressList = salesOrder![0].addressList!;

      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: agreenColor, width: 2),
              ),
              child: Column(
                // Errors
                children: [
                  (salesOrder[0].deliveryAddress == "" ||
                          salesOrder[0].deliveryAddress!.isEmpty)
                      ? atext("Delivery Address Empty", color: Colors.red)
                      : Container(),

                  // Result of the API
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      aresultText("Order Date", salesOrder![0].orderDate!),
                      aresultText("SalesType", salesOrder![0].salesType!),
                      aresultText("ERP Order ID", salesOrder![0].salesId!),
                      hspace(width: 20),
                      aresultText(
                          "Magento Order ID", salesOrder[0].salesRefId!),
                      hspace(),
                      aresultText(
                          "Original Sales ID",
                          salesOrder[0].originalSalesId != ""
                              ? (salesOrder[0].originalSalesId!)
                              : "Not an RTO"),
                    ],
                  ),
                  Divider(),
                  vspace(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      aresultText("Customer Name", addressList![0].name!),
                      // aresultText("AddressReference", addressList![0].addressReference!),
                      aresultText(
                          "City",
                          addressList[0].city != ""
                              ? (addressList[0].city!)
                              : "CITY EMPTY"),
                      aresultText(
                          "Address",
                          addressList![0].addressDescription != ""
                              ? (addressList![0].addressDescription!)
                              : "ADDRESS EMPTY"),

                      aresultText(
                          "Address",
                          salesOrder[0]!.telephone != ""
                              ? (salesOrder[0]!.telephone!)
                              : "ADDRESS EMPTY"),
                      hspace(width: 20),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    } else {
      return Container();
    }
  }
}
