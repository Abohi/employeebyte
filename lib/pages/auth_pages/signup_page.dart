import 'dart:io';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:employeebyte/app_route/app_route.gr.dart';
import 'package:employeebyte/controllers/auth_controller.dart';
import 'package:employeebyte/exception_handlers/custom_exception.dart';
import 'package:employeebyte/exception_handlers/network_failure_exception.dart';
import 'package:employeebyte/general_widgets/custombutton.dart';
import 'package:employeebyte/general_widgets/error_widget.dart';
import 'package:employeebyte/models/country_model/countries_model.dart';
import 'package:employeebyte/models/country_model/country_model.dart';
import 'package:employeebyte/models/country_model/state_model.dart';
import 'package:employeebyte/providers/exception_provider/exception_provider.dart';
import 'package:employeebyte/providers/future_providers/country_providers.dart';
import 'package:employeebyte/providers/state_providers/countries_state_provider.dart';
import 'package:employeebyte/styles/colors.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'package:intl/intl.dart' show DateFormat;
final passwordVisibilityProvider = StateProvider<bool>((ref) => false);
class SignupPage extends HookWidget {
const SignupPage();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final _formKey = useMemoized(() => GlobalKey<FormState>());
    final email = useState<String?>("");
    final firstName = useState<String?>("");
    final lastName = useState<String?>("");
    final password = useState<String?>("");
    final address = useState<String?>("");
    final dateOfBirth = useState<DateTime?>(null);
    final passwordVisibilityState = useProvider(passwordVisibilityProvider);
    var isNetworkError = useState(false);
    var networkFailure= useState(NetworkFailure());
    var countriesArray = useState([CountryModel(states: [], name: "Please select a country", code: "")]);
    var stateArray = useState<List<StateModel>?>([StateModel(name: 'Please select a state', code: '')]);
    var selectedCountry = useState(CountryModel(states: [], name: "Please select a country", code: ""));
    var selectedState =useState(StateModel(name: 'Please select a state', code: ''));
    var sexArray = useState<List<String>?>(["Please select sex","Male","Female"]);
    var selectedSex =useState<String?>("Please select sex");
    var photo =useState<File?>(null);

    return Scaffold(
      backgroundColor: const Color(0xffACACAC),
      body: SafeArea(
        child: ProviderListener(
          provider: exceptionMessageProvider,
          onChange: (BuildContext context, StateController<CustomException?> customException,) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: snackBarColor,
                content: Text(customException.state!.message!),
              ),
            );
          },
          child: ProgressHUD(
            backgroundColor: const Color(0xff0000FF),
            indicatorColor:Colors.white,
            child: Builder(
              builder: (context){
                return Container(
                  width: width,
                  height: height,
                  child: CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        elevation: 0,
                        title: Text(
                          "Sign Up",
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
                        child: const SizedBox(height: 10,),
                      ),
                      photo.value == null?SliverToBoxAdapter(
                        child: Center(
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                decoration: BoxDecoration(shape: BoxShape.circle,color: const Color(0xff9393FF)),
                                width: width*0.5,
                                height: width*0.5,
                              ),
                              Positioned(
                                left: -(width * 0.02),
                                top: height * 0.01,
                                child: GestureDetector(
                                  onTap: ()async{
                                    FilePickerResult? result = await FilePicker.platform.pickFiles();
                                    if(result != null) {
                                      photo.value = File(result.files.single.path!);
                                    } else {
                                      // User canceled the picker
                                      await Fluttertoast.showToast(msg: "Passport selection canceled",toastLength: Toast.LENGTH_LONG);
                                    }
                                  },
                                  child: SizedBox(
                                      height: width * 0.2,
                                      width: width * 0.2,
                                      child: SvgPicture.asset(
                                          "assets/vector_images/upload_image_icon.svg")),
                                ),
                              )
                            ],
                          ),
                        ),
                      ):SliverToBoxAdapter(
                        child: Center(
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              CircleAvatar(
                                radius: width * 0.3,
                                backgroundImage: FileImage(photo.value!),
                              ),
                              GestureDetector(
                                onTap: ()async{
                                  FilePickerResult? result = await FilePicker.platform.pickFiles();
                                  if(result != null) {
                                    photo.value = File(result.files.single.path!);
                                  } else {
                                    // User canceled the picker
                                    await Fluttertoast.showToast(msg: "Passport selection canceled",toastLength: Toast.LENGTH_LONG);
                                  }
                                },
                                child: Positioned(
                                  left: -(width * 0.02),
                                  top: height * 0.01,
                                  child: SizedBox(
                                      height: width * 0.2,
                                      width: width * 0.2,
                                      child: SvgPicture.asset(
                                          "assets/vector_images/upload_image_icon.svg")),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SliverList(delegate: SliverChildListDelegate([
                        SizedBox(height: height*0.05,),
                        Form(
                          key: _formKey,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 17),
                            decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(17),topRight: Radius.circular(17)),color:Colors.white),
                            child: Column(
                              children: <Widget>[
                                SizedBox(height: 20,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Theme(
                                      data: Theme.of(context).copyWith(splashColor: Colors.transparent),
                                      child: TextFormField(
                                        autofocus: false,
                                        keyboardType:
                                        TextInputType.name,
                                        validator: (val){
                                          if(val==null) return "Field must not be empty";
                                          else
                                            return null;
                                        },
                                        onSaved: (value)=>firstName.value=value,
                                        style: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 14)),
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                          labelText: "First Name",
                                          labelStyle: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 14)),
                                          suffixIcon:Icon(Icons.person,size:24,color: const Color(0xffACACAC)),
                                          contentPadding:
                                          const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: const Color(0xff0000FF),width: 1),
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          enabledBorder:OutlineInputBorder(
                                            borderSide: BorderSide(color: const Color(0xffACACAC),width: 1),
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Row(
                                      children: <Widget>[
                                        SizedBox(width: 22,),
                                        Text("*Required",style: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 10))),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Theme(
                                      data: Theme.of(context).copyWith(splashColor: Colors.transparent),
                                      child: TextFormField(
                                        autofocus: false,
                                        keyboardType:
                                        TextInputType.name,
                                        validator: (val){
                                          if(val==null) return "Field must not be empty";
                                          else
                                            return null;
                                        },
                                        onSaved: (value)=>lastName.value=value,
                                        style: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 14)),
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                          labelText: "Last Name",
                                          labelStyle: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 14)),
                                          suffixIcon:Icon(Icons.person,size:24,color: const Color(0xffACACAC)),
                                          contentPadding:
                                          const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: const Color(0xff0000FF),width: 1),
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          enabledBorder:OutlineInputBorder(
                                            borderSide: BorderSide(color: const Color(0xffACACAC),width: 1),
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Row(
                                      children: <Widget>[
                                        SizedBox(width: 22,),
                                        Text("*Required",style: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 10))),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Theme(
                                      data: ThemeData.light().copyWith(splashColor: Colors.transparent,//selection color
                                      ),
                                      child: DateTimeField(
                                        format:DateFormat("yyyy-MM-dd"),
                                        style: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 14)),
                                        validator: (val){
                                          if(val.toString().isEmpty) return "Field must not be empty";
                                          else
                                            return null;
                                        },
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                          labelText: "Date Of Birth",
                                          labelStyle: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 14)),
                                          suffixIcon: Icon(Icons.date_range,size: 24,color: const Color(0xff0000FF),),
                                          contentPadding:
                                          const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: const Color(0xff0000FF),width: 1),
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          enabledBorder:OutlineInputBorder(
                                            borderSide: BorderSide(color: const Color(0xffACACAC),width: 1),
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                        ),
                                        onChanged: (val)=>dateOfBirth.value=val,
                                        onShowPicker: (context, currentValue) {
                                          return showDatePicker(
                                            context: context,
                                            firstDate: DateTime(1930),
                                            initialDate: currentValue ?? DateTime.now(),
                                            lastDate: DateTime(2050),
                                            builder: (BuildContext? context, Widget? child) {
                                              return Theme(
                                                data: ThemeData.light().copyWith(
                                                    colorScheme: ColorScheme.light().copyWith(
                                                      primary: const Color(0xff0000FF),
                                                    )//selection color
                                                ),
                                                child: child!,
                                              );
                                            },);
                                        },
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(
                                              width: 1, color: const Color(0xffACACAC)),
                                          color: Colors.white),
                                      child: DropdownButton<String?>(
                                          value: selectedSex.value,
                                          icon: Expanded(
                                            child: Row(
                                              children: <Widget>[
                                                Spacer(),
                                                Icon(
                                                  Icons.keyboard_arrow_down,
                                                  color: colorPrimary,
                                                  size: 24,
                                                ),
                                                SizedBox(
                                                  width: 12,
                                                )
                                              ],
                                            ),
                                          ),
                                          iconSize: 24,
                                          elevation: 16,
                                          style: TextStyle(color: Color(0xff000000)),
                                          underline: Container(
                                            height: 2,
                                            color: Colors.white,
                                          ),
                                          onChanged: (value)=>selectedSex.value=value!,
                                          items:
                                          sexArray.value!.map<DropdownMenuItem<String?>>((value) {
                                            return DropdownMenuItem<String?>(
                                              value: value,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 12.0, top: 12, bottom: 12),
                                                child: Text(value),
                                              ),
                                            );
                                          }).toList()),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        SizedBox(
                                          width: 22,
                                        ),
                                        Text("*Required",
                                            style: GoogleFonts.roboto(
                                                textStyle: TextStyle(
                                                    color: const Color(0xff29283C),
                                                    fontSize: 10))),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Theme(
                                      data: Theme.of(context).copyWith(splashColor: Colors.transparent),
                                      child: TextFormField(
                                        autofocus: false,
                                        keyboardType:
                                        TextInputType.emailAddress,
                                        validator: (val){
                                          if(val==null) return "Field must not be empty";
                                          else if ( !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val)) return "Email is not valid";
                                          else
                                            return null;
                                        },
                                        onSaved: (value)=>email.value=value,
                                        style: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 14)),
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                          labelText: "Email",
                                          labelStyle: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 14)),
                                          suffixIcon:Icon(Icons.email,size:24,color: const Color(0xffACACAC)),
                                          contentPadding:
                                          const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: const Color(0xff0000FF),width: 1),
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          enabledBorder:OutlineInputBorder(
                                            borderSide: BorderSide(color: const Color(0xffACACAC),width: 1),
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Row(
                                      children: <Widget>[
                                        SizedBox(width: 22,),
                                        Text("*Required",style: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 10))),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Theme(
                                      data: Theme.of(context).copyWith(splashColor: Colors.transparent),
                                      child: TextFormField(
                                        autofocus: false,
                                        keyboardType:
                                        TextInputType.text,
                                        style: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 14)),
                                        obscureText: !passwordVisibilityState.state,
                                        validator: (val){
                                          if(val==null) return "Field must not be empty";

                                          else if(val.length<6) return "Password must be more than 6 characters";

                                          else
                                            return null;
                                        },
                                        onSaved: (value)=>password.value=value,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                          labelText: "Password",
                                          labelStyle: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 14)),
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                              passwordVisibilityState.state
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                              color: const Color(0xffACACAC),
                                              size: 24,
                                            ),
                                            onPressed: () {
                                              passwordVisibilityState.state = !passwordVisibilityState.state;
                                            },
                                          ),
                                          contentPadding:
                                          const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: const Color(0xff0000FF),width: 1),
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          enabledBorder:OutlineInputBorder(
                                            borderSide: BorderSide(color: const Color(0xffACACAC),width: 1),
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Row(
                                      children: <Widget>[
                                        SizedBox(width: 22,),
                                        Text("*Required",style: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 10))),
                                      ],
                                    ),

                                  ],
                                ),
                                SizedBox(height: 10,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Theme(
                                      data: Theme.of(context).copyWith(splashColor: Colors.transparent),
                                      child: TextFormField(
                                        autofocus: false,
                                        keyboardType:
                                        TextInputType.streetAddress,
                                        validator: (val){
                                          if(val==null) return "Field must not be empty";
                                          else
                                            return null;
                                        },
                                        onSaved: (value)=>address.value=value,
                                        style: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 14)),
                                        decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.white,
                                            labelText: "Address",
                                            labelStyle: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 14)),
                                            suffixIcon: Icon(Icons.assignment_outlined,size:24,color: const Color(0xffACACAC),),
                                            contentPadding:
                                            const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: const Color(0xff0000FF),width: 1),
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                            enabledBorder:OutlineInputBorder(
                                              borderSide: BorderSide(color: const Color(0xffACACAC),width: 1),
                                              borderRadius: BorderRadius.circular(5),
                                            )
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Row(
                                      children: <Widget>[
                                        SizedBox(width: 22,),
                                        Text("*Required",style: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 14))),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                isNetworkError.value?ErrorWidgetControl(retryHandler:(){
                                  context.refresh(countriesFutureProvider);
                                },networkFailure:networkFailure.value ,):Consumer(
                                  builder: (BuildContext context, T Function<T>(ProviderBase<Object?, T>) watch, Widget? child) {
                                    return  watch(countriesFutureProvider).map(data: (countriesData){
                                      return countriesData.value.fold((l) {
                                        networkFailure.value = l;
                                        return Text("");
                                      }, (r){
                                        if(countriesArray.value.length==1){
                                          countriesArray.value.addAll(r!.result!);
                                        }
                                        return Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              width: MediaQuery.of(context).size.width,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  border: Border.all(
                                                      width: 1, color: const Color(0xffACACAC)),
                                                  color: Colors.white),
                                              child: DropdownButton<CountryModel>(
                                                  value: selectedCountry.value,
                                                  icon: Expanded(
                                                    child: Row(
                                                      children: <Widget>[
                                                        Spacer(),
                                                        Icon(
                                                          Icons.keyboard_arrow_down,
                                                          color: colorPrimary,
                                                          size: 24,
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  iconSize: 24,
                                                  elevation: 16,
                                                  style: TextStyle(color: Color(0xff000000)),
                                                  underline: Container(
                                                    height: 2,
                                                    color: Colors.white,
                                                  ),
                                                  onChanged: (value)async{
                                                    selectedCountry.value = value!;
                                                    if(value.states==null){
                                                      await Fluttertoast.showToast(msg: "States not available for selected country",toastLength: Toast.LENGTH_LONG);
                                                      stateArray.value = null;
                                                    }else{
                                                      stateArray.value = [StateModel(name: 'Please select a state', code: '')];
                                                      stateArray.value!.addAll(value.states!);
                                                    }


                                                  },
                                                  items:
                                                  countriesArray.value.map<DropdownMenuItem<CountryModel>>((value) {
                                                    if(value.name=="Please select a country")
                                                      return DropdownMenuItem<CountryModel>(
                                                        value: value,
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(
                                                              left: 4, top: 12, bottom: 12),
                                                          child: Text("${value.name!}"),
                                                        ),
                                                      );
                                                    return DropdownMenuItem<CountryModel>(
                                                      value: value,
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(
                                                            left: 4, top: 12, bottom: 12),
                                                        child: Text("${value.name!} (${value.code})"),
                                                      ),
                                                    );
                                                  }).toList()),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: <Widget>[
                                                SizedBox(
                                                  width: 22,
                                                ),
                                                Text("*Required",
                                                    style: GoogleFonts.roboto(
                                                        textStyle: TextStyle(
                                                            color: const Color(0xff29283C),
                                                            fontSize: 10))),
                                              ],
                                            ),
                                          ],
                                        );
                                      });
                                    }, loading: (loading)=>Center(
                                      child: CircularProgressIndicator(),
                                    ), error: (error){
                                      return ErrorWidgetControl(networkFailure: null,retryHandler: (){
                                        context.refresh(countriesFutureProvider);
                                      },);
                                    });
                                  },
                                ),
                                SizedBox(height: 10,),
                                stateArray.value==null? Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Theme(
                                      data: Theme.of(context).copyWith(splashColor: Colors.transparent),
                                      child: TextFormField(
                                        autofocus: false,
                                        keyboardType:
                                        TextInputType.name,
                                        validator: (val){
                                          if(val==null) return "Field must not be empty";
                                          else
                                            return null;
                                        },
                                        onSaved: (value)=>selectedState.value=StateModel(code: "", name: value),
                                        style: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 14)),
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                          labelText: "Enter State",
                                          labelStyle: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 14)),
                                          suffixIcon:Icon(Icons.map,size:24,color: const Color(0xffACACAC)),
                                          contentPadding:
                                          const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: const Color(0xff0000FF),width: 1),
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          enabledBorder:OutlineInputBorder(
                                            borderSide: BorderSide(color: const Color(0xffACACAC),width: 1),
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Row(
                                      children: <Widget>[
                                        SizedBox(width: 22,),
                                        Text("*Required",style: GoogleFonts.roboto(textStyle: TextStyle(color: const Color(0xff29283C),fontSize: 10))),
                                      ],
                                    ),
                                  ],
                                ):Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(
                                              width: 1, color: const Color(0xffACACAC)),
                                          color: Colors.white),
                                      child: DropdownButton<StateModel>(
                                          value: selectedState.value,
                                          icon: Expanded(
                                            child: Row(
                                              children: <Widget>[
                                                Spacer(),
                                                Icon(
                                                  Icons.keyboard_arrow_down,
                                                  color: colorPrimary,
                                                  size: 24,
                                                ),
                                                SizedBox(
                                                  width: 12,
                                                )
                                              ],
                                            ),
                                          ),
                                          iconSize: 24,
                                          elevation: 16,
                                          style: TextStyle(color: Color(0xff000000)),
                                          underline: Container(
                                            height: 2,
                                            color: Colors.white,
                                          ),
                                          onChanged: (value)async{
                                            selectedState.value = value!;


                                          },
                                          items:
                                          stateArray.value!.map<DropdownMenuItem<StateModel>>((value) {
                                            return DropdownMenuItem<StateModel>(
                                              value: value,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 12.0, top: 12, bottom: 12),
                                                child: Text(value.name!),
                                              ),
                                            );
                                          }).toList()),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        SizedBox(
                                          width: 22,
                                        ),
                                        Text("*Required",
                                            style: GoogleFonts.roboto(
                                                textStyle: TextStyle(
                                                    color: const Color(0xff29283C),
                                                    fontSize: 10))),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: height*0.05,),
                                CustomButton(buttonBg: colorPrimary, buttonTitle: "CONTINUE", buttonFontColor: colorWhite, onButtonPressed: () async{
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    if(selectedCountry.value!=null && selectedState.value!=null && dateOfBirth.value!=null && selectedSex.value!=null && photo.value!=null){
                                      context.read(countriesStateProvider).state=countriesArray.value;
                                      final progress = ProgressHUD.of(context);
                                      progress!.showWithText('Registering Admin...');
                                      await  context.read(authControllerProvider.notifier).registerUser({
                                        "email":email.value!,
                                        "password":password.value!,
                                        "dateOfBirth":dateOfBirth.value!,
                                        "address":address.value,
                                        "country":selectedCountry.value.name!,
                                        "state":selectedState.value.name,
                                        "sex":selectedSex.value,
                                        "firstName":firstName.value,
                                        "lastName":lastName.value,
                                        "photo":photo.value
                                      });
                                      progress.dismiss();
                                      User? user=  context.read(authControllerProvider);
                                      if(context.read(exceptionMessageProvider).state==null){
                                        if(user!=null){
                                          await Fluttertoast.showToast(msg: "Verification Email Sent Successfully",toastLength: Toast.LENGTH_LONG);
                                          context.read(authControllerProvider.notifier).signOut();
                                          context.router.navigate(AppStarterRoute());
                                          //Send user to the entry page
                                        }
                                      }
                                    }else{
                                      return await Fluttertoast.showToast(msg: "All Fields must be provided",toastLength: Toast.LENGTH_LONG);
                                    }
                                  }
                                }),
                                SizedBox(height: height*0.05,),
                                GestureDetector(
                                  onTap: (){
                                    context.router.navigate(LoginRoute());
                                  },

                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text("Already have an account?",style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: const Color(0xff29283C)))),
                                      Text("Login",style: GoogleFonts.roboto(textStyle: TextStyle(decoration: TextDecoration.underline,fontSize: 14,fontWeight: FontWeight.normal,color: const Color(0xff0000FF)))),

                                    ],),
                                )
                              ],
                            ),
                          ),
                        ),
                      ]),)
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

}
