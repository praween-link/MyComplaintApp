import 'package:complaintapp/project/admin_and_operator/admin/adduser/add_admin.dart';
import 'package:complaintapp/project/admin_and_operator/admin/adduser/add_operator.dart';
import 'package:complaintapp/project/admin_and_operator/admin/admin_home.dart';
import 'package:complaintapp/project/admin_and_operator/admin/assign/assign_issue.dart';
import 'package:complaintapp/project/admin_and_operator/admin/profile/admin_profile.dart';
import 'package:complaintapp/project/admin_and_operator/admin/view/edit_complaint.dart';
import 'package:complaintapp/project/admin_and_operator/admin/view/view_complaint.dart';
import 'package:complaintapp/project/admin_and_operator/common/login_screen.dart';
import 'package:complaintapp/project/admin_and_operator/common/update_status.dart';
import 'package:complaintapp/project/customer/add_issue.dart/add_issue.dart';
import 'package:complaintapp/project/customer/home/home_screen/customer_home.dart';
import 'package:complaintapp/project/customer/home/profile/customer_profile.dart';
import 'package:complaintapp/project/customer/login/customer_sign.dart';
import 'package:complaintapp/project/customer/view_data.dart/my_all_issues.dart';
import 'package:complaintapp/project/welcome_scr/welcome_screen.dart';
import 'package:complaintapp/src/sample_feature/sample_item_details_view.dart';
import 'package:complaintapp/src/sample_feature/sample_item_list_view.dart';
import 'package:complaintapp/src/settings/settings_controller.dart';
import 'package:complaintapp/src/settings/settings_view.dart';
import 'package:flutter/material.dart';

class MyRoute {
  static MaterialPageRoute myRoutes(RouteSettings routeSettings, SettingsController settingsController) => MaterialPageRoute<void>(
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
                      return const AdminAndOperatorLogin();
                    case AdminHomeScreen.routeName:
                      return const AdminHomeScreen(isAdmin: false,);
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
                      return const UpdateStatus(id: '');
                    default:
                      return Welcome();
                  }
                },
              );
}