import 'package:flutter_translate/flutter_translate.dart';

final languages = [
  'ru',
  'uz',
  'уз',
  'kz',
];

extension ExtStr on String {
  String get tr {
    return translate(this);
  }
}

//auth and splash
String enter = 'enter';
String enterPhone = 'enter_phone';
String editPhone = 'edit_phone';
String smsSended = 'sms_sended';
String resend = 'resend';
String userInfo = 'user_info';
String userName = 'name';
String userSurname = 'surname';
String you = 'you';
String man = 'man';
String woman = 'woman';
String bornDate = 'born_date';
String selectDate = 'select_date';
String save = 'save';
String enterName = 'enter_name';
String enterSurname = 'enter_surname';
String cancel = 'cancel';
String error = 'error';
String setOrder = 'set_order';
String editInfo = 'edit_info';
String language = 'language';
String lanKey = 'lan_key';
String selectLanguage = 'select_language';
String about = 'about';
String faq = 'faq';
String night = 'night';
String exit = 'exit';
String permitLocation = 'permit_location';
String workWell = 'work_well';
String yourLocation = 'your_location';
String finalLocation = 'final_location';
String setWhere = 'set_where';
String setWhereGo = 'set_where_go';
String writeComment = 'write_comment';
String comment = 'comment';
String ratingDriver = 'rating_driver';
String orderCompleted = 'order_completed';
String back = 'back';
String newMessage = 'new_message';
String cancelOrder = 'cancel_order';
String sureCancel = 'sure_cancel';
String wait = 'wait';
String total = 'total';
String dispacher = 'dispacher';
String comfirm = 'comfirm';
String saved = 'saved';
String myOrders = 'my_orders';
String thisOrder = 'this_order';
String callOperator = 'call_operator';
String almost = 'almost';
String sameTime = 'same_time';
String atTheAddress = 'at_the_address';
String arrivingTime = 'arriving_time';
String selectMap = 'select_map';
String skip = 'skip';
String call = 'call';
String payBonus = 'pay_bonus';
String yes = 'yes';
String no = 'no';
String ok = 'ok';
String bonusHistory = 'bonus_history';
String sureExit = 'sure_exit';
String noConnection = 'no_connection';
String checkConnection = 'check_connection';
String madedBy = 'maded_by';
String telegram = 'telegram';
String supportNum = 'support_num';
String appVersion = 'app_version';
String delAccount = 'del_account';
String waitCar = 'wait_car';
