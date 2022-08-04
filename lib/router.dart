import 'package:flutter/material.dart';
import 'package:union/screens/about/dev_about.dart';
import 'package:union/screens/chat/chat_screen.dart';
import 'package:union/screens/cvv/cvv.dart';
import 'package:union/screens/donation/donate.dart';
import 'package:union/screens/error_report/error_report.dart';
import 'package:union/screens/initial/first_view.dart';
import 'package:union/screens/login/login.dart';
import 'package:union/screens/profile/profile.dart';
import 'package:union/screens/register/password_recovey/password_recovery.dart';
import 'package:union/screens/register/psychologist/register_psychologist_avatar.dart';
import 'package:union/screens/register/psychologist/register_psychologist_basic.dart';
import 'package:union/screens/register/psychologist/register_psychologist_documents.dart';
// import 'package:union/ui/chat/chat_screen.dart';
// import 'package:union/ui/configuration/Config.dart';
// import 'package:union/ui/cvv/Cvv.dart';
// import 'package:union/ui/donate/Donate.dart';
// import 'package:union/ui/inicial/Login.dart';
// import 'package:union/ui/inicial/first_view.dart';
import 'package:union/screens/chat/list_chat.dart';
// import 'package:union/ui/profile/Profile.dart';
// import 'package:union/ui/register/PasswordRecovery.dart';
import 'package:union/screens/register/user/register_common_user_avatar.dart';
import 'package:union/screens/register/user/register_common_user_basic.dart';
// import 'package:union/ui/register/RegisterPsychologistAvatar.dart';
// import 'package:union/ui/register/RegisterPsychologistBasic.dart';
// import 'package:union/ui/register/RegisterPsychologistDocuments.dart';
import 'package:union/screens/register/user_type.dart';
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
    case passwordRecoveryRoute:
      return MaterialPageRoute(builder: (context) => const PasswordRecovery());
    // case UserListRoute:
    //   return MaterialPageRoute(builder: (context) => ListChat(argument));
    case psychologistListRoute:
      return MaterialPageRoute(builder: (context) => const ListChat());
    case chatRoute:
      return MaterialPageRoute(builder: (context) => const ChatScreen());
    case profileRoute:
      return MaterialPageRoute(builder: (context) => const Profile());
    case cvvRoute:
      return MaterialPageRoute(builder: (context) => const Cvv());
    case errorReportRoute:
      return MaterialPageRoute(builder: (context) => const ErrorReport());
    case devAboutRoute:
      return MaterialPageRoute(builder: (context) => const DevAbout());
    // case ConfigRoute:
    //   return MaterialPageRoute(builder: (context) => Config(argument));
    case donateRoute:
      return MaterialPageRoute(builder: (context) => const Donate());
    default:
      return MaterialPageRoute(builder: (context) => const FirstPage());
  }
}
