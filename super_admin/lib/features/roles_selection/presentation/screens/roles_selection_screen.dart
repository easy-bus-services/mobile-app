import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:super_admin/config/router_config.dart';
import 'package:super_admin/core/constants/app_constants.dart';
import 'package:super_admin/core/enums/cache_enum.dart';
import 'package:super_admin/core/enums/widget_enums.dart';
import 'package:super_admin/core/presentation/blocs/roles_selection_bloc.dart';
import 'package:super_admin/core/presentation/common_widgets/common_text_widgets.dart';
import 'package:super_admin/core/presentation/widgets/my_container.dart';
import 'package:super_admin/core/presentation/widgets/my_screen.dart';
import 'package:super_admin/core/services/cache_service.dart';
import 'package:super_admin/di/service_locator.dart' as di;
 Logger? _logger;
class RolesSelectionScreen extends StatelessWidget {
  const RolesSelectionScreen({super.key});
  
  Future<void> setRole(String role) async {
    await CacheService.setValue(AppConstants.cacheKeyRole, role, CacheEnums.string);
  }
  
  @override
  Widget build(BuildContext context) {    
    return  BlocProvider(
      create: (context) => di.sl<RolesSelectionBloc>(),
      child: MyScreen(
        showAppBar: false,
        screenPaddingVertical: 50,
        body: BlocBuilder<RolesSelectionBloc, RolesSelectionState>(
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
                      CommonTextWidgets(text: 'Login As', type: WidgetTextEnum.heading1),
                      GridView.custom(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsetsGeometry.symmetric(horizontal: 30,vertical: 30),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
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
                                setRole(state.data[index].roleName);
                                // _logger?.i(object.roleId);
                                // _logger?.i(object.roleName);
                                GoRouter.of(context).push(AppRoutes.partnersLoginScreen);
                              },
                              child: MyContainer(
                                width:70.0,
                                height: 70.0,
                                child: Card(
                                  color: Colors.white,
                                  child: Center(child: CommonTextWidgets(
                                      type: WidgetTextEnum.type1,
                                      text:state.data[index].roleName,
                                      color: Colors.black
                                    ),
                                  ),
                                )
                              ),
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
            else {
              return Center(child: Text("Something Went wrong. Please try again."));
            }
          },
        ),
      ),
    );
    
  }
}
