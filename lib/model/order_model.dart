class OrderModel {
  String? id;
  PaginationModel? paginationModel;
  List<SalesOrders>? salesOrders;
  int? totalRecords;
  String? message;
  int? statusCode;
  String? status;

  OrderModel(
      {this.id,
      this.paginationModel,
      this.salesOrders,
      this.totalRecords,
      this.message,
      this.statusCode,
      this.status});

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['$id'];
    paginationModel = json['paginationModel'] != null
        ? PaginationModel.fromJson(json['paginationModel'])
        : null;
    if (json['salesOrders'] != null) {
      salesOrders = <SalesOrders>[];
      json['salesOrders'].forEach((v) {
        salesOrders!.add(SalesOrders.fromJson(v));
      });
    }
    totalRecords = json['totalRecords'];
    message = json['Message'];
    statusCode = json['StatusCode'];
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['$id'] = id;
    if (paginationModel != null) {
      data['paginationModel'] = paginationModel!.toJson();
    }
    if (salesOrders != null) {
      data['salesOrders'] = salesOrders!.map((v) => v.toJson()).toList();
    }
    data['totalRecords'] = totalRecords;
    data['Message'] = message;
    data['StatusCode'] = statusCode;
    data['Status'] = status;
    return data;
  }
}

class PaginationModel {
  String? id;
  int? pageNumber;
  int? pageSize;

  PaginationModel({this.id, this.pageNumber, this.pageSize});

  PaginationModel.fromJson(Map<String, dynamic> json) {
    id = json['$id'];
    pageNumber = json['PageNumber'];
    pageSize = json['PageSize'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['$id'] = id;
    data['PageNumber'] = pageNumber;
    data['PageSize'] = pageSize;
    return data;
  }
}

class SalesOrders {
  String? id;
  String? salesId;
  String? receiptNumber;
  int? isPrescriptionOrder;
  String? salesRefId;
  String? originalSalesId;
  String? storePickupId;
  int? transactionSynced;
  String? site;
  String? warehouse;
  String? orderDate;
  String? createdDateTime;
  String? salesStatus;
  String? assemblyStatus;
  String? technicianStatus;
  double? orderAmount;
  String? source;
  String? coupon;
  String? storeId;
  String? remarks;
  String? custAccount;
  String? paymMode;
  String? dlvMode;
  String? taxGroup;
  String? currency;
  int? isOrderOnHold;
  String? salesName;
  String? salesType;
  String? invoiceAccount;
  String? releaseStatus;
  String? governmentId;
  int? settleVoucher;
  String? postingProfile;
  String? salesGroup;
  String? reservation;
  String? salesPoolId;
  String? deliveryAddress;
  String? sourceAddress;
  String? dlvTerm;
  String? payment;
  String? priceGroupId;
  String? customerName;
  String? requestedReceiptDate;
  int? isRTO;
  double? invoiceAmount;
  String? email;
  String? telephone;
  String? returnReasonCode;
  String? latestTOReferenceId;
  String? latestPOReferenceId;
  int? refundAndAddToWallet;
  List<SaleslineList>? saleslineList;
  List<DiscountList>? discountList;
  List<AddressList>? addressList;
  List? shippingChargeList;
  List? packingDetails;
  List? trackingDetails;
  List<PaymentTransDetails>? paymentTransDetails;

  SalesOrders(
      {this.id,
      this.salesId,
      this.receiptNumber,
      this.isPrescriptionOrder,
      this.salesRefId,
      this.originalSalesId,
      this.storePickupId,
      this.transactionSynced,
      this.site,
      this.warehouse,
      this.orderDate,
      this.createdDateTime,
      this.salesStatus,
      this.assemblyStatus,
      this.technicianStatus,
      this.orderAmount,
      this.source,
      this.coupon,
      this.storeId,
      this.remarks,
      this.custAccount,
      this.paymMode,
      this.dlvMode,
      this.taxGroup,
      this.currency,
      this.isOrderOnHold,
      this.salesName,
      this.salesType,
      this.invoiceAccount,
      this.releaseStatus,
      this.governmentId,
      this.settleVoucher,
      this.postingProfile,
      this.salesGroup,
      this.reservation,
      this.salesPoolId,
      this.deliveryAddress,
      this.sourceAddress,
      this.dlvTerm,
      this.payment,
      this.priceGroupId,
      this.customerName,
      this.requestedReceiptDate,
      this.isRTO,
      this.invoiceAmount,
      this.email,
      this.telephone,
      this.returnReasonCode,
      this.latestTOReferenceId,
      this.latestPOReferenceId,
      this.refundAndAddToWallet,
      this.saleslineList,
      this.discountList,
      this.addressList,
      this.shippingChargeList,
      this.packingDetails,
      this.trackingDetails,
      this.paymentTransDetails});

  SalesOrders.fromJson(Map<String, dynamic> json) {
    id = json['$id'];
    salesId = json['SalesId'];
    receiptNumber = json['ReceiptNumber'];
    isPrescriptionOrder = json['IsPrescriptionOrder'];
    salesRefId = json['SalesRefId'];
    originalSalesId = json['OriginalSalesId'];
    storePickupId = json['StorePickupId'];
    transactionSynced = json['TransactionSynced'];
    site = json['Site'];
    warehouse = json['Warehouse'];
    orderDate = json['OrderDate'];
    createdDateTime = json['CreatedDateTime'];
    salesStatus = json['SalesStatus'];
    assemblyStatus = json['AssemblyStatus'];
    technicianStatus = json['TechnicianStatus'];
    orderAmount = json['OrderAmount'];
    source = json['Source'];
    coupon = json['Coupon'];
    storeId = json['StoreId'];
    remarks = json['Remarks'];
    custAccount = json['CustAccount'];
    paymMode = json['PaymMode'];
    dlvMode = json['DlvMode'];
    taxGroup = json['TaxGroup'];
    currency = json['Currency'];
    isOrderOnHold = json['IsOrderOnHold'];
    salesName = json['SalesName'];
    salesType = json['SalesType'];
    invoiceAccount = json['InvoiceAccount'];
    releaseStatus = json['ReleaseStatus'];
    governmentId = json['GovernmentId'];
    settleVoucher = json['SettleVoucher'];
    postingProfile = json['PostingProfile'];
    salesGroup = json['SalesGroup'];
    reservation = json['Reservation'];
    salesPoolId = json['SalesPoolId'];
    deliveryAddress = json['DeliveryAddress'];
    sourceAddress = json['SourceAddress'];
    dlvTerm = json['DlvTerm'];
    payment = json['Payment'];
    priceGroupId = json['PriceGroupId'];
    customerName = json['CustomerName'];
    requestedReceiptDate = json['RequestedReceiptDate'];
    isRTO = json['IsRTO'];
    invoiceAmount = json['InvoiceAmount'];
    email = json['Email'];
    telephone = json['Telephone'];
    returnReasonCode = json['ReturnReasonCode'];
    latestTOReferenceId = json['LatestTOReferenceId'];
    latestPOReferenceId = json['LatestPOReferenceId'];
    refundAndAddToWallet = json['RefundAndAddToWallet'];
    if (json['SaleslineList'] != null) {
      saleslineList = <SaleslineList>[];
      json['SaleslineList'].forEach((v) {
        saleslineList!.add(SaleslineList.fromJson(v));
      });
    }
    if (json['DiscountList'] != null) {
      discountList = <DiscountList>[];
      json['DiscountList'].forEach((v) {
        discountList!.add(DiscountList.fromJson(v));
      });
    }
    if (json['AddressList'] != null) {
      addressList = <AddressList>[];
      json['AddressList'].forEach((v) {
        addressList!.add(AddressList.fromJson(v));
      });
    }
    if (json['ShippingChargeList'] != null) {
      shippingChargeList = [];
      json['ShippingChargeList'].forEach((v) {
        shippingChargeList!.add(v);
      });
    }
    packingDetails = json['PackingDetails'];
    if (json['TrackingDetails'] != null) {
      trackingDetails = [];
      json['TrackingDetails'].forEach((v) {
        trackingDetails!.add((v));
      });
    }
    if (json['PaymentTransDetails'] != null) {
      paymentTransDetails = <PaymentTransDetails>[];
      json['PaymentTransDetails'].forEach((v) {
        paymentTransDetails!.add(PaymentTransDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['$id'] = id;
    data['SalesId'] = salesId;
    data['ReceiptNumber'] = receiptNumber;
    data['IsPrescriptionOrder'] = isPrescriptionOrder;
    data['SalesRefId'] = salesRefId;
    data['OriginalSalesId'] = originalSalesId;
    data['StorePickupId'] = storePickupId;
    data['TransactionSynced'] = transactionSynced;
    data['Site'] = site;
    data['Warehouse'] = warehouse;
    data['OrderDate'] = orderDate;
    data['CreatedDateTime'] = createdDateTime;
    data['SalesStatus'] = salesStatus;
    data['AssemblyStatus'] = assemblyStatus;
    data['TechnicianStatus'] = technicianStatus;
    data['OrderAmount'] = orderAmount;
    data['Source'] = source;
    data['Coupon'] = coupon;
    data['StoreId'] = storeId;
    data['Remarks'] = remarks;
    data['CustAccount'] = custAccount;
    data['PaymMode'] = paymMode;
    data['DlvMode'] = dlvMode;
    data['TaxGroup'] = taxGroup;
    data['Currency'] = currency;
    data['IsOrderOnHold'] = isOrderOnHold;
    data['SalesName'] = salesName;
    data['SalesType'] = salesType;
    data['InvoiceAccount'] = invoiceAccount;
    data['ReleaseStatus'] = releaseStatus;
    data['GovernmentId'] = governmentId;
    data['SettleVoucher'] = settleVoucher;
    data['PostingProfile'] = postingProfile;
    data['SalesGroup'] = salesGroup;
    data['Reservation'] = reservation;
    data['SalesPoolId'] = salesPoolId;
    data['DeliveryAddress'] = deliveryAddress;
    data['SourceAddress'] = sourceAddress;
    data['DlvTerm'] = dlvTerm;
    data['Payment'] = payment;
    data['PriceGroupId'] = priceGroupId;
    data['CustomerName'] = customerName;
    data['RequestedReceiptDate'] = requestedReceiptDate;
    data['IsRTO'] = isRTO;
    data['InvoiceAmount'] = invoiceAmount;
    data['Email'] = email;
    data['Telephone'] = telephone;
    data['ReturnReasonCode'] = returnReasonCode;
    data['LatestTOReferenceId'] = latestTOReferenceId;
    data['LatestPOReferenceId'] = latestPOReferenceId;
    data['RefundAndAddToWallet'] = refundAndAddToWallet;
    if (saleslineList != null) {
      data['SaleslineList'] = saleslineList!.map((v) => v.toJson()).toList();
    }
    if (discountList != null) {
      data['DiscountList'] = discountList!.map((v) => v.toJson()).toList();
    }
    if (addressList != null) {
      data['AddressList'] = addressList!.map((v) => v.toJson()).toList();
    }
    if (shippingChargeList != null) {
      data['ShippingChargeList'] = shippingChargeList!.map((v) => v).toList();
    }
    data['PackingDetails'] = packingDetails;
    if (trackingDetails != null) {
      data['TrackingDetails'] = trackingDetails!.map((v) => v).toList();
    }
    if (paymentTransDetails != null) {
      data['PaymentTransDetails'] =
          paymentTransDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SaleslineList {
  String? id;
  String? salesId;
  String? itemId;
  String? inventDimId;
  String? variantId;
  String? productName;
  double? salesQty;
  double? totalPickedQty;
  double? totalDeliveredQty;
  double? totalInvoicedQty;
  double? unitPrice;
  double? lineAmount;
  String? unit;
  double? discount;
  double? discountPercent;
  String? currency;
  String? cylinder;
  String? modelNumber;
  String? sphere;
  String? axis;
  String? inventLocationId;
  String? inventSiteId;
  String? lineStatus;
  String? assemblyStatus;
  String? technicianStatus;
  String? returnArrivalDate;
  String? receiptDateRequested;
  String? shippingDateRequested;
  String? inventStatusId;
  String? deliveryType;
  double? lineNum;
  int? salesCategory;
  String? lotId;
  String? parentLotId;
  double? taxAmount;
  String? prescriptionId;
  String? lensPosition;
  List<Attributes>? attributes;
  String? returnDispositionCode;
  String? refundCode;
  String? returnReasonCode;
  List<void>? transferOrders;
  String? returnLotId;

  SaleslineList(
      {this.id,
      this.salesId,
      this.itemId,
      this.inventDimId,
      this.variantId,
      this.productName,
      this.salesQty,
      this.totalPickedQty,
      this.totalDeliveredQty,
      this.totalInvoicedQty,
      this.unitPrice,
      this.lineAmount,
      this.unit,
      this.discount,
      this.discountPercent,
      this.currency,
      this.cylinder,
      this.modelNumber,
      this.sphere,
      this.axis,
      this.inventLocationId,
      this.inventSiteId,
      this.lineStatus,
      this.assemblyStatus,
      this.technicianStatus,
      this.returnArrivalDate,
      this.receiptDateRequested,
      this.shippingDateRequested,
      this.inventStatusId,
      this.deliveryType,
      this.lineNum,
      this.salesCategory,
      this.lotId,
      this.parentLotId,
      this.taxAmount,
      this.prescriptionId,
      this.lensPosition,
      this.attributes,
      this.returnDispositionCode,
      this.refundCode,
      this.returnReasonCode,
      this.transferOrders,
      this.returnLotId});

  SaleslineList.fromJson(Map<String, dynamic> json) {
    id = json['$id'];
    salesId = json['SalesId'];
    itemId = json['ItemId'];
    inventDimId = json['InventDimId'];
    variantId = json['VariantId'];
    productName = json['ProductName'];
    salesQty = json['SalesQty'];
    totalPickedQty = json['TotalPickedQty'];
    totalDeliveredQty = json['TotalDeliveredQty'];
    totalInvoicedQty = json['TotalInvoicedQty'];
    unitPrice = json['UnitPrice'];
    lineAmount = json['LineAmount'];
    unit = json['Unit'];
    discount = json['Discount'];
    discountPercent = json['DiscountPercent'];
    currency = json['Currency'];
    cylinder = json['Cylinder'];
    modelNumber = json['ModelNumber'];
    sphere = json['Sphere'];
    axis = json['Axis'];
    inventLocationId = json['InventLocationId'];
    inventSiteId = json['InventSiteId'];
    lineStatus = json['LineStatus'];
    assemblyStatus = json['AssemblyStatus'];
    technicianStatus = json['TechnicianStatus'];
    returnArrivalDate = json['ReturnArrivalDate'];
    receiptDateRequested = json['ReceiptDateRequested'];
    shippingDateRequested = json['ShippingDateRequested'];
    inventStatusId = json['InventStatusId'];
    deliveryType = json['DeliveryType'];
    lineNum = json['LineNum'];
    salesCategory = json['SalesCategory'];
    lotId = json['LotId'];
    parentLotId = json['ParentLotId'];
    taxAmount = json['TaxAmount'];
    prescriptionId = json['PrescriptionId'];
    lensPosition = json['LensPosition'];
    if (json['Attributes'] != null) {
      attributes = <Attributes>[];
      json['Attributes'].forEach((v) {
        attributes!.add(Attributes.fromJson(v));
      });
    }
    returnDispositionCode = json['ReturnDispositionCode'];
    refundCode = json['RefundCode'];
    returnReasonCode = json['ReturnReasonCode'];
    if (json['TransferOrders'] != null) {
      transferOrders = [];
      json['TransferOrders'].forEach((v) {
        transferOrders!.add((v));
      });
    }
    returnLotId = json['ReturnLotId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['$id'] = id;
    data['SalesId'] = salesId;
    data['ItemId'] = itemId;
    data['InventDimId'] = inventDimId;
    data['VariantId'] = variantId;
    data['ProductName'] = productName;
    data['SalesQty'] = salesQty;
    data['TotalPickedQty'] = totalPickedQty;
    data['TotalDeliveredQty'] = totalDeliveredQty;
    data['TotalInvoicedQty'] = totalInvoicedQty;
    data['UnitPrice'] = unitPrice;
    data['LineAmount'] = lineAmount;
    data['Unit'] = unit;
    data['Discount'] = discount;
    data['DiscountPercent'] = discountPercent;
    data['Currency'] = currency;
    data['Cylinder'] = cylinder;
    data['ModelNumber'] = modelNumber;
    data['Sphere'] = sphere;
    data['Axis'] = axis;
    data['InventLocationId'] = inventLocationId;
    data['InventSiteId'] = inventSiteId;
    data['LineStatus'] = lineStatus;
    data['AssemblyStatus'] = assemblyStatus;
    data['TechnicianStatus'] = technicianStatus;
    data['ReturnArrivalDate'] = returnArrivalDate;
    data['ReceiptDateRequested'] = receiptDateRequested;
    data['ShippingDateRequested'] = shippingDateRequested;
    data['InventStatusId'] = inventStatusId;
    data['DeliveryType'] = deliveryType;
    data['LineNum'] = lineNum;
    data['SalesCategory'] = salesCategory;
    data['LotId'] = lotId;
    data['ParentLotId'] = parentLotId;
    data['TaxAmount'] = taxAmount;
    data['PrescriptionId'] = prescriptionId;
    data['LensPosition'] = lensPosition;
    if (attributes != null) {
      data['Attributes'] = attributes!.map((v) => v.toJson()).toList();
    }
    data['ReturnDispositionCode'] = returnDispositionCode;
    data['RefundCode'] = refundCode;
    data['ReturnReasonCode'] = returnReasonCode;
    if (transferOrders != null) {
      data['TransferOrders'] = transferOrders!.map((v) => v).toList();
    }
    data['ReturnLotId'] = returnLotId;
    return data;
  }
}

class Attributes {
  String? id;
  String? name;
  String? value;

  Attributes({this.id, this.name, this.value});

  Attributes.fromJson(Map<String, dynamic> json) {
    id = json['$id'];
    name = json['Name'];
    value = json['Value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['$id'] = id;
    data['Name'] = name;
    data['Value'] = value;
    return data;
  }
}

class DiscountList {
  String? id;
  double? amount;
  double? dealPrice;
  double? discountAmount;
  String? discountCode;
  double? percentage;
  String? discountId;
  double? saleLineNum;

  DiscountList(
      {this.id,
      this.amount,
      this.dealPrice,
      this.discountAmount,
      this.discountCode,
      this.percentage,
      this.discountId,
      this.saleLineNum});

  DiscountList.fromJson(Map<String, dynamic> json) {
    id = json['$id'];
    amount = json['Amount'];
    dealPrice = json['DealPrice'];
    discountAmount = json['DiscountAmount'];
    discountCode = json['DiscountCode'];
    percentage = json['Percentage'];
    discountId = json['DiscountId'];
    saleLineNum = json['SaleLineNum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['$id'] = id;
    data['Amount'] = amount;
    data['DealPrice'] = dealPrice;
    data['DiscountAmount'] = discountAmount;
    data['DiscountCode'] = discountCode;
    data['Percentage'] = percentage;
    data['DiscountId'] = discountId;
    data['SaleLineNum'] = saleLineNum;
    return data;
  }
}

class AddressList {
  String? id;
  String? addressReference;
  String? addressDescription;
  String? city;
  String? country;
  String? county;
  String? name;
  int? isPrimary;
  String? purpose;
  String? state;
  String? street;
  String? zipCodeId;
  double? longitude;
  double? latitude;
  String? locationId;
  int? isExpired;
  String? district;

  AddressList(
      {this.id,
      this.addressReference,
      this.addressDescription,
      this.city,
      this.country,
      this.county,
      this.name,
      this.isPrimary,
      this.purpose,
      this.state,
      this.street,
      this.zipCodeId,
      this.longitude,
      this.latitude,
      this.locationId,
      this.isExpired,
      this.district});

  AddressList.fromJson(Map<String, dynamic> json) {
    id = json['$id'];
    addressReference = json['AddressReference'];
    addressDescription = json['AddressDescription'];
    city = json['City'];
    country = json['Country'];
    county = json['County'];
    name = json['Name'];
    isPrimary = json['IsPrimary'];
    purpose = json['Purpose'];
    state = json['State'];
    street = json['Street'];
    zipCodeId = json['ZipCodeId'];
    longitude = json['Longitude'];
    latitude = json['Latitude'];
    locationId = json['LocationId'];
    isExpired = json['IsExpired'];
    district = json['District'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['$id'] = id;
    data['AddressReference'] = addressReference;
    data['AddressDescription'] = addressDescription;
    data['City'] = city;
    data['Country'] = country;
    data['County'] = county;
    data['Name'] = name;
    data['IsPrimary'] = isPrimary;
    data['Purpose'] = purpose;
    data['State'] = state;
    data['Street'] = street;
    data['ZipCodeId'] = zipCodeId;
    data['Longitude'] = longitude;
    data['Latitude'] = latitude;
    data['LocationId'] = locationId;
    data['IsExpired'] = isExpired;
    data['District'] = district;
    return data;
  }
}

class PaymentTransDetails {
  String? id;
  String? paymentMode;
  String? paymentReference;
  double? amount;
  String? currency;

  PaymentTransDetails(
      {this.id,
      this.paymentMode,
      this.paymentReference,
      this.amount,
      this.currency});

  PaymentTransDetails.fromJson(Map<String, dynamic> json) {
    id = json['$id'];
    paymentMode = json['PaymentMode'];
    paymentReference = json['PaymentReference'];
    amount = json['Amount'];
    currency = json['Currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['$id'] = id;
    data['PaymentMode'] = paymentMode;
    data['PaymentReference'] = paymentReference;
    data['Amount'] = amount;
    data['Currency'] = currency;
    return data;
  }
}
