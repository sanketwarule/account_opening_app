class LoginResponse{
//  0|$Success|^1184274|^09-Sep-2019 04:55:51 PM|^012|^Y|^Y|^0|^C711095|^N|^|$
//  1|^Please enter valid NT Id/Password:|^|$

final String status;
final String message;
final LoginResponseData data;
LoginResponse({this.status, this.message, this.data});
}

class LoginResponseData{
  final String sessionId;
  final String dateTimeStamp;
  final String inwardCenter;
  final String redundantFlag;
  final String notificationFlag;
  final String notificationCount;
  final String loggedInUserId;
  final String cseIdFlag;

  LoginResponseData({this.sessionId, this.dateTimeStamp, this.inwardCenter, this.redundantFlag, this.notificationFlag, this.notificationCount, this.loggedInUserId, this.cseIdFlag});
}

