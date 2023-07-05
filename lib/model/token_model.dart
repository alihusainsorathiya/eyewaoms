class TokenModel {
  String? tokenType;
  String? expiresIn;
  String? extExpiresIn;
  String? expiresOn;
  String? notBefore;
  String? resource;
  String? accessToken;

  TokenModel({
    this.tokenType,
    this.expiresIn,
    this.extExpiresIn,
    this.expiresOn,
    this.notBefore,
    this.resource,
    this.accessToken,
  });

  TokenModel.fromJson(Map<String, dynamic> json) {
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    extExpiresIn = json['ext_expires_in'];
    expiresOn = json['expires_on'];
    notBefore = json['not_before'];
    resource = json['resource'];
    accessToken = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token_type'] = this.tokenType;
    data['expires_in'] = this.expiresIn;
    data['ext_expires_in'] = this.extExpiresIn;
    data['expires_on'] = this.expiresOn;
    data['not_before'] = this.notBefore;
    data['resource'] = this.resource;
    data['access_token'] = this.accessToken;
    return data;
  }
}
