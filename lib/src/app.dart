import 'package:complaintapp/project/admin_and_operator/admin/adduser/add_admin.dart';
import 'package:complaintapp/project/admin_and_operator/admin/adduser/add_operator.dart';
import 'package:complaintapp/project/admin_and_operator/admin/admin_home.dart';
import 'package:complaintapp/project/admin_and_operator/admin/assign/assign_issue.dart';
import 'package:complaintapp/project/admin_and_operator/admin/profile/admin_profile.dart';
import 'package:complaintapp/project/admin_and_operator/admin/view/edit_complaint.dart';
import 'package:complaintapp/project/admin_and_operator/admin/view/view_complaint.dart';
import 'package:complaintapp/project/admin_and_operator/common/login_screen.dart';
import 'package:complaintapp/project/admin_and_operator/common/update_status.dart';
import 'package:complaintapp/project/controller/admin_controller.dart';
import 'package:complaintapp/project/controller/customer_controller.dart';
import 'package:complaintapp/project/customer/add_issue.dart/add_issue.dart';
import 'package:complaintapp/project/customer/add_issue.dart/edit_issue.dart';
import 'package:complaintapp/project/customer/home/customer_home.dart';
import 'package:complaintapp/project/customer/home/profile/customer_profile.dart';
import 'package:complaintapp/project/customer/login/customer_sign.dart';
import 'package:complaintapp/project/customer/view_data.dart/my_all_issues.dart';
import 'package:complaintapp/project/welcome_scr/welcome_screen.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'sample_feature/sample_item_details_view.dart';
import 'sample_feature/sample_item_list_view.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The AnimatedBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<CustomerController>(
              create: (context) => CustomerController(),
            ),
            ChangeNotifierProvider<AdminController>(
              create: (context) => AdminController(),
            ),
          ],
          child: MaterialApp(
            // Providing a restorationScopeId allows the Navigator built by the
            // MaterialApp to restore the navigation stack when a user leaves and
            // returns to the app after it has been killed while running in the
            // background.
            restorationScopeId: 'app',

            // Provide the generated AppLocalizations to the MaterialApp. This
            // allows descendant Widgets to display the correct translations
            // depending on the user's locale.
            localizationsDelegates: const [
              // AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', ''), // English, no country code
            ],

            // Use AppLocalizations to configure the correct application title
            // depending on the user's locale.
            //
            // The appTitle is defined in .arb files found in the localization
            // directory.
            // onGenerateTitle: (BuildContext context) =>
            //     AppLocalizations.of(context)!.appTitle,

            // Define a light and dark color theme. Then, read the user's
            // preferred ThemeMode (light, dark, or system default) from the
            // SettingsController to display the correct theme.
            theme: ThemeData(),
            darkTheme: ThemeData.dark(),
            themeMode: settingsController.themeMode,

            // Define a function to handle named routes in order to support
            // Flutter web url navigation and deep linking.
            onGenerateRoute: (RouteSettings routeSettings) {
              return MaterialPageRoute<void>(
                settings: routeSettings,
                builder: (BuildContext context) {
                  switch (routeSettings.name) {
                    case SettingsView.routeName:
                      return SettingsView(controller: settingsController);
                    case SampleItemDetailsView.routeName:
                      return const SampleItemDetailsView();
                    case SampleItemListView.routeName:
                      return const SampleItemListView();
                    case Welcome.routeName:
                      return Welcome();
                    case CustomerLogin.routeName:
                      return CustomerLogin();
                    case CustomerHome.routeName:
                      return CustomerHome();
                    case AddIssue.routeName:
                      return const AddIssue(type: '');
                    case AdminAndOperatorLogin.routeName:
                      return AdminAndOperatorLogin();
                    case AdminHomeScreen.routeName:
                      return const AdminHomeScreen();
                    case AdminProfile.routeName:
                      return const AdminProfile();
                    case AddAdmin.routeName:
                      return const AddAdmin();
                    case AddOperator.routeName:
                      return const AddOperator();
                    case CustomerProfile.routeName:
                      return const CustomerProfile();
                    case ViewComplaint.routeName:
                      return ViewComplaint(id: '');
                    case AssignToOperator.routeName:
                      return const AssignToOperator();
                    case ViewMyIssues.routeName:
                      return const ViewMyIssues();
                    case AdminEditIssue.routeName:
                      return const AdminEditIssue(id: '');
                    case UpdateStatus.routeName:
                      return const UpdateStatus();
                    default:
                      return Welcome();
                  }
                },
              );
            },
          ),
        );
      },
    );
  }
}
