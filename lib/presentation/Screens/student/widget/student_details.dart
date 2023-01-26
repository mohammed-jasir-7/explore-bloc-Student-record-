import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:week_5/business_logic/blocs/bloc/student_bloc.dart';

import '../../../../data/Model/students.dart';

class Detail extends StatelessWidget {
  Detail({super.key, required this.detail});
  Student detail;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.blue,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 255, 255, 255),
                    child: Icon(Icons.person),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Name: ",
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                    BlocBuilder<StudenttBloc, StudentState>(
                      builder: (context, state) {
                        if (state is StudentDetailsState) {
                          return CustomText(
                            text: state.details.name,
                          );
                        }
                        return CustomText(text: detail.name);
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Add no: ",
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                    BlocBuilder<StudenttBloc, StudentState>(
                      builder: (context, state) {
                        if (state is StudentDetailsState) {
                          return CustomText(
                            text: state.details.addmissionNumber,
                          );
                        }
                        return CustomText(text: detail.addmissionNumber);
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Course: ",
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                    BlocBuilder<StudenttBloc, StudentState>(
                      builder: (context, state) {
                        if (state is StudentDetailsState) {
                          return CustomText(
                            text: state.details.course,
                          );
                        }
                        return CustomText(text: detail.course);
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Advisor: ",
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                    BlocBuilder<StudenttBloc, StudentState>(
                      builder: (context, state) {
                        if (state is StudentDetailsState) {
                          return CustomText(
                            text: state.details.whoAdd,
                          );
                        }
                        return CustomText(text: detail.whoAdd);
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final String text;
  const CustomText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: GoogleFonts.montserrat(
          color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500),
    );
  }
}
