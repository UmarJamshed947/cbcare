
class UrlConstants {
  static String baseUrl = "https://app.mlc.gov.pk/api/";


  //Get
  static String officeList = baseUrl + "edastarus/offices";
  static String categoriesList = baseUrl + "edastarus/categories";
  static String howDoI = baseUrl + "howDoI/";

  //Post
  static String register = baseUrl + "edastarus/register";
  static String verifyCode = baseUrl + "edastarus/verify/new";
  static String createComplaint = baseUrl + "edastarus/complaint/create";

  static String getUserComplaints = baseUrl + "edastarus/user/complaints";
  static String userFeedback = baseUrl + "edastarus/user/feedback";
  static String onlinepayment = baseUrl + "revenue/verifyPayment";


  //http://app.mlc.gov.pk/api/revenue/verifyPayment

  static String userDetails = baseUrl + "edastarus/user/details";
  static String updateUserDetails = baseUrl + "edastarus/user/update";

  //Applications
  static String userApplications = baseUrl + "cbcare/user/applications";

  //Scanning
  static String scanApplication = baseUrl + "cbcare/scan/application";
  static String scanChallan = baseUrl + "cbcare/scan/challan";
  static String scanGeneralChallan = baseUrl + "cbcare/scan/general_challan";
  static String Scanonlinepayment = baseUrl + "revenue/OnlineverifyPayment";
  static String Scancbcard = baseUrl + "hr/validateCard";

}

