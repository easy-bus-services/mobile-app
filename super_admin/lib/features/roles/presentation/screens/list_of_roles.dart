
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:super_admin/core/enums/widget_enums.dart';
import 'package:super_admin/core/presentation/blocs/roles_selection_bloc.dart';
import 'package:super_admin/core/presentation/common_widgets/common_text_widgets.dart';
import 'package:super_admin/core/presentation/widgets/my_alert.dart';
import 'package:super_admin/core/presentation/widgets/my_button.dart';
import 'package:super_admin/core/presentation/widgets/my_container.dart';
import 'package:super_admin/core/presentation/widgets/my_screen.dart';
import 'package:super_admin/core/utils/util_service.dart';
import 'package:super_admin/di/service_locator.dart' as di;
Logger? _logger;
class ListOfRoles extends StatelessWidget {
  const ListOfRoles({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<RolesSelectionBloc>(),
      child: BlocBuilder<RolesSelectionBloc, RolesSelectionState>(
          builder: (context, state) {
            if(state is RolesSelectionInitial) {
              context.read<RolesSelectionBloc>().add(LoadRolesSelectionEvent());
               _logger?.i("RolesSelectionInitial");
              return const Center(child: CircularProgressIndicator());
            }
            else if(state is RolesSelectionLoading){
               _logger?.i("RolesSelectionLoading");
              return const Center(child: CircularProgressIndicator());
            }
            // else if (state is RolesSelectionError) {
            //    _logger?.i("GetAllRolesError");
            //   return Center(child: Text(state.message));
            // }
            else if (state is RolesSelectionLoaded) {
               _logger?.i("GetAllRolesLoaded");
               _logger?.i(state.data);
               _logger?.i("GetAllRolesLoaded");
              //return Center(child: Text("Loaded:"));
              return Center(
                  child: Column(
                      children: <Widget>[
                        GridView.custom(
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            padding: EdgeInsetsGeometry.symmetric(horizontal: 20,vertical: 10),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              // mainAxisSpacing: 2,
                              // crossAxisSpacing: 2,
                            ),
                            childrenDelegate: SliverChildBuilderDelegate(
                                  (BuildContext context, int index) {
                                return
                                  InkWell(
                                    onTap: () {
                                      // ScaffoldMessenger.of(context).showSnackBar(
                                      //   SnackBar(content: Text('Tapped on Item ${state.data[index]}')),
                                      // );
                                      //setRole(state.data[index].roleName);
                                      // _logger?.i(object.roleId);
                                      // _logger?.i(object.roleName);
                                      //GoRouter.of(context).push(AppRoutes.partnersLoginScreen);
                                    },
                                    child: SizedBox(
                                        width: double.infinity,
                                        height: 50,
                                        child:  Card(
                                      color: Colors.white,
                                      child: MyContainer(
                                        horizantal: 10,
                                        child: Column( children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              CommonTextWidgets(
                                                  type: WidgetTextEnum.type1,
                                                  text:state.data[index].roleName,
                                                  color: Colors.black
                                              ),
                                              IconButton(onPressed: () {
                                                //MyAlert(message:"MyAlert",onPress: (){});
                                                List<Widget> actions= [
                                                  MyButton(text: "Cancel",
                                                      backgroundColor: Colors.grey.shade200,
                                                      textColor: Colors.black,
                                                      width: 100, onPressed: () {
                                                        Navigator.pop(context);
                                                      }),
                                                  MyButton(text: "OK", width: 100, onPressed: () {
                                                    context.read<RolesSelectionBloc>().add(DeleteRolesSelectionEvent(state.data[index].roleId));
                                                    Navigator.pop(context);
                                                  }),
                                                ];
                                               UtilService.getCustomDialog(
                                                    actionTypes: WidgetAlertButtonTypes.yesOrNo,
                                                    maxHeight: 300,
                                                    context: context,
                                                    title: "Delete Role",
                                                    body: Padding(
                                                        padding: EdgeInsetsGeometry.symmetric(vertical: 50),
                                                        child:Text("Do you want to delete ${state.data[index].roleName}")
                                                    ),
                                                 actions: actions
                                                );
                                              },
                                                  icon: Icon(Icons.delete))
                                            ],
                                          )
                                        ],
                                      ) ,
                                    ))),
                                  );
                              },
                              childCount: state.data.length,
                            )
                        )
                        // Center(
                        //     child:  Column(
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       crossAxisAlignment: CrossAxisAlignment.center,
                        //       children: <Widget>[
                        //         Center(
                        //           child: Column(
                        //             children: state.data.map((object) {
                        //               return Padding(
                        //                 padding: WidgetConstants.horizantalPadding20,
                        //                 child: Column(
                        //                   children:<Widget>[
                        //                       MyButton(
                        //                          text:object.roleName,
                        //                         onPressed: () {
                        //                           setRole(object.roleName);
                        //                            _logger?.i(object.roleId);
                        //                            _logger?.i(object.roleName);
                        //                           GoRouter.of(context).push(AppRoutes.partnersLoginScreen);
                        //                         }
                        //                       ),
                        //                       const SizedBox(height: 20),
                        //                   ]
                        //                 )
                        //                 );
                        //               }).toList(),
                        //           )
                        //         ),
                        //       ]
                        //       )
                      ])
              );
            }
            else if(state is RolesSelectionError){
              _logger?.i("RolesSelectionLoading");
              return Center(child: Text("Something Went wrong. Please try again."+state.message));
            }
            else {
              return Center(child: Text("Something Went wrong. Please try again."));
            }
          },
        ),
    );
  }
}
