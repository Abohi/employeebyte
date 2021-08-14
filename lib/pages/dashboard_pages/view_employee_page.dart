import 'package:employeebyte/controllers/employee_controller.dart';
import 'package:employeebyte/general_widgets/search_widget.dart';
import 'package:employeebyte/models/employee_model/employee_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
class ViewEmployeePage extends HookWidget {
  const ViewEmployeePage();

  @override
  Widget build(BuildContext context) {
    var employeeListState = useProvider(employeeControllerProvider);

    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        padding: EdgeInsets.symmetric(horizontal: 17),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 0,
              title: Text(
                "View Employee's Record",
                style: GoogleFonts.josefinSans(
                    textStyle: TextStyle(
                        color: const Color(0xff3E3E3E),
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ),
              centerTitle: true,
              pinned: true,
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: const Color(0xff0000FF),
                  size: 24,
                ),
                onPressed: () {
                  context.popRoute();
                },
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: size.height*0.02,),
            ),
            SliverToBoxAdapter(
              child: const SearchWidget(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: size.height*0.05,),
            ),
            employeeListState==null?SliverToBoxAdapter(child: Center(child: Text("Employee Record Not Available"))):
            SliverList(delegate: SliverChildListDelegate(
              employeeListState.map((e) => EmployListTile(e)).toList()
            ))
          ],
        ),
      ),
    );
  }
}
class EmployListTile extends HookWidget {
  final EmployeeModel employeeModel;
  const EmployListTile(this.employeeModel);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height*0.15,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width:100,
              height: 100,
              child: CircleAvatar(
                radius: 28,
                backgroundImage: NetworkImage(employeeModel.photo!),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(employeeModel.firstName??"",style: GoogleFonts.josefinSans(
                        textStyle: TextStyle(
                            color: const Color(0xff3E3E3E),
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),),

                    Text("First Name",style: GoogleFonts.josefinSans(
                        textStyle: TextStyle(
                            color: const Color(0xff3E3E3E),
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),),
                  ],
                ),
                SizedBox(height: 10,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(employeeModel.lastName??"",style: GoogleFonts.josefinSans(
                        textStyle: TextStyle(
                            color: const Color(0xff3E3E3E),
                            fontSize: 16,
                            fontWeight: FontWeight.bold))),
                    Text("Last Name",style: GoogleFonts.josefinSans(
                        textStyle: TextStyle(
                            color: const Color(0xff3E3E3E),
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),),
                  ],
                ),
              ],
            ),
            SizedBox(width: 10,),
          ],
        ),
      ),
    );
  }
}

