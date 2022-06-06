import 'package:flutter/material.dart';
import 'package:union/ui/initial/first_view.dart';
import 'package:union/ui/login/login.dart';
import 'package:union/ui/register/psychologist/register_psychologist_avatar.dart';
import 'package:union/ui/register/psychologist/register_psychologist_basic.dart';
import 'package:union/ui/register/psychologist/register_psychologist_documents.dart';
// import 'package:union/ui/chat/chat_screen.dart';
// import 'package:union/ui/configuration/Config.dart';
// import 'package:union/ui/cvv/Cvv.dart';
// import 'package:union/ui/donate/Donate.dart';
// import 'package:union/ui/inicial/Login.dart';
// import 'package:union/ui/inicial/first_view.dart';
// import 'package:union/ui/list/list_chat.dart';
// import 'package:union/ui/profile/Profile.dart';
// import 'package:union/ui/register/PasswordRecovery.dart';
import 'package:union/ui/register/user/register_common_user_avatar.dart';
import 'package:union/ui/register/user/register_common_user_basic.dart';
// import 'package:union/ui/register/RegisterPsychologistAvatar.dart';
// import 'package:union/ui/register/RegisterPsychologistBasic.dart';
// import 'package:union/ui/register/RegisterPsychologistDocuments.dart';
import 'package:union/ui/register/user_type.dart';
// import 'package:union/ui/report/DevReport.dart';
// import 'package:union/ui/report/ErrorReport.dart';

import 'routes_names.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  // Object argument = routeSettings != null && routeSettings.arguments != null
  //     ? routeSettings.arguments
  //     : null;
  switch (routeSettings.name) {
    case firstViewRoute:
      return MaterialPageRoute(builder: (context) => const FirstPage());
    case userTypeRoute:
      return MaterialPageRoute(builder: (context) => const UserType());
    case registerCommonAvatarRoute:
      return MaterialPageRoute(
          builder: (context) => const RegisterCommonUserAvatar());
    case registerCommonBasicRoute:
      return MaterialPageRoute(
          builder: (context) => const RegisterCommonUserBasic());
    case registerPsychologistAvatarRoute:
      return MaterialPageRoute(
          builder: (context) => const RegisterPsychologistAvatar());
    case registerPsychologistBasicRoute:
      return MaterialPageRoute(
          builder: (context) => const RegisterPsychologistBasic());
    case registerPsychologistDocumentRoute:
      return MaterialPageRoute(
          builder: (context) => const RegisterPsychologistDocuments());
    case loginRoute:
      return MaterialPageRoute(builder: (context) => const Login());
    // case PasswordRecoveryRoute:
    //   return MaterialPageRoute(builder: (context) => PasswordRecovery());
    // case UserListRoute:
    //   return MaterialPageRoute(builder: (context) => ListChat(argument));
    // case PsychologistListRoute:
    //   return MaterialPageRoute(builder: (context) => ListChat(argument));
    // case ChatRoute:
    //   return MaterialPageRoute(builder: (context) => ChatScreen(argument));
    // case ProfileRoute:
    //   return MaterialPageRoute(builder: (context) => Profile(argument));
    // case CvvRoute:
    //   return MaterialPageRoute(builder: (context) => Cvv(argument));
    // case ErrorReportRoute:
    //   return MaterialPageRoute(builder: (context) => ErrorReport(argument));
    // case DevReportRoute:
    //   return MaterialPageRoute(builder: (context) => DevReport());
    // case ConfigRoute:
    //   return MaterialPageRoute(builder: (context) => Config(argument));
    // case DonateRoute:
    //   return MaterialPageRoute(builder: (context) => Donate(argument));
    default:
      return MaterialPageRoute(builder: (context) => const FirstPage());
  }
}
