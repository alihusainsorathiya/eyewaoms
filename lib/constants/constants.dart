// ignore: constant_identifier_names
const String TOKEN_API_URL =
    "https://login.microsoftonline.com/c7b463c4-1e53-435c-b6da-a1b3a8da65bf/oauth2/token";

const String TOKEN_BASE_URL =
    "https://login.microsoftonline.com/c7b463c4-1e53-435c-b6da-a1b3a8da65bf/oauth2/";

const String TOKEN_ENDPOINT = "token";

const opkw_client_secret = "9sR8Q~C.eaWGrW3U9FJ~WEfCRnC6yNKYVGu2Ddl_";
const spae_client_secret = "OwR8Q~-IBBCscCjZQXzHaieE_kTKJbqsK4E4cbBe";
const opkw_client_id = "79680ddd-af09-4e38-ad94-aa3cbedf6dff";
const spae_client_id = "6f81dc6b-f356-4d4d-ae8b-583b8c324e4a";

// Token Headers
const headers = {
  "Access-Control-Allow-Headers": "Access-Control-Allow-Origin, Accept",

  'Access-Control-Allow-Origin': '*',
  // "Content-Type": "text/html; charset=utf-8",
  // "Accept": "*/*",
  'Cookie':
      'fpc=AhkOyf6cnC9JgTPB1FN81dm7McAQAgAAAGNBgtsOAAAA; stsservicecookie=estsfd; x-ms-gateway-slice=estsfd; fpc=AshQGN1pcy1DlDVaDt24gqXWto3CAQAAAOl0qtsOAAAA; stsservicecookie=estsfd; x-ms-gateway-slice=estsfd; fpc=AhkOyf6cnC9JgTPB1FN81dnWto3CAgAAAAjf99sOAAAAYQzsPQEAAAAz3_fbDgAAAA; x-ms-gateway-slice=estsfd; fpc=Ap9rhMg1FNFEsvGnCfWIBLrWto3CAQAAADxrAtwOAAAAuzHAEAEAAACkawLcDgAAAA; x-ms-gateway-slice=estsfd',
};

// Order URL
const String BASE_URL = "https://eyewa-prod.operations.dynamics.com";
const String GET_ORDERS_URL =
    "$BASE_URL/api/services/EWA_CommerceService/EWA_CommerceService/getSalesOrderRecords";
