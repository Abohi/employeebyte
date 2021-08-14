import 'package:employeebyte/controllers/employee_controller.dart';
import 'package:employeebyte/models/employee_model/employee_model.dart';
import 'package:employeebyte/pages/dashboard_pages/view_employee_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchWidget extends HookWidget {

  const SearchWidget();
  @override
  Widget build(BuildContext context) {
    var employeeListState = useProvider(employeeControllerProvider);
    return Padding(
      padding: EdgeInsets.only(left: 10,top: 5,right: 10,bottom: 5),
      child: TextField(
        onTap: ()async{
          await showSearch(context: context,delegate: DataSearch(employeesModel: employeeListState));
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(
              width: 0,
              color: const Color(0xff3E3E3E),
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          prefixIcon: Icon(
            Icons.search,
            color: const Color(0xff3E3E3E),
          ),
          fillColor: Color(0xFFFAFAFA),
          suffixIcon: Icon(Icons.sort,color: const Color(0xff3E3E3E),),
          hintStyle: new TextStyle(color: Color(0xFFd0cece), fontSize: 18),
          hintText: "Search Employee?",
        ),
      ),
    );
  }
}

class DataSearch extends SearchDelegate<List<EmployeeModel>?>{
  List<EmployeeModel>?employeesModel;
  DataSearch({required this.employeesModel});
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(icon:Icon(Icons.clear),onPressed: (){
        query = "";
      },)
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {

    return IconButton(icon: AnimatedIcon(icon: AnimatedIcons.menu_arrow,progress: transitionAnimation,),onPressed: (){
      close(context,null);
    },);
  }

  @override
  Widget buildResults(BuildContext context) {
    print(query);
    if(employeesModel==null)
      return Text("");
    final List<EmployeeModel>resultList =employeesModel!.where((element) => element.firstName!.toLowerCase().startsWith(query.toLowerCase())).toList();
    return ListView.builder(itemBuilder: (context,index)=>EmployListTile(resultList[index]),itemCount: resultList.length,);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if(employeesModel==null)
      return Text("");
    final List<EmployeeModel>suggestionList = query.isEmpty?employeesModel!.map((e) => e).toList():employeesModel!.map((e) => e).where((element) => element.firstName!.toLowerCase().startsWith(query.toLowerCase())).toList();
    return ListView.builder(itemBuilder: (context,index)=>Padding(
      padding: const EdgeInsets.only(top: 10,left: 17,right:17),
      child: GestureDetector(
        onTap: (){
          showResults(context);
        },
        child: Card(

          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: RichText(
              text: TextSpan(
                  text: suggestionList[index].firstName!.substring(0,query.length),
                  style: GoogleFonts.ubuntu(fontSize: 18,fontWeight: FontWeight.w700,color: Colors.black),
                  children: [
                    TextSpan(text: suggestionList[index].firstName!.substring(query.length),style: GoogleFonts.ubuntu(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.grey),)
                  ]
              ),
            ),
          ),
        ),
      ),
    ),itemCount: suggestionList.length,);
  }

}