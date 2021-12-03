import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Assets{
  static final SizedBox smallPaddingBox = SizedBox(height: 8,width: 8);
  static final Color redColorPlaceholder = Color(0xfff8333c);
  static final Color blackColorPlaceholder = Color(0xff2d3142);
  static final Color yellowColorPlaceholder = Color(0xfffcab10);
  static final Color whiteColor = Color(0xffFDFFFC);
  static final Color blueColor = Color(0xff58A4B0);
  static final Color darkGreyColor = Color(0xff373F51);
  static final Color whiteColorAlt = Color(0xffD8DBE2);

  static final TextStyle inriaSans7dimw = GoogleFonts.inriaSans(
      fontSize: 14,
      fontStyle: FontStyle.italic,
      color: Colors.white
  );
  static final TextStyle inriaSans18dim = GoogleFonts.inriaSans(
      fontSize: 18,
      fontStyle: FontStyle.italic,
      color: Colors.grey
  );
  static final TextStyle inriaSans32dim= GoogleFonts.inriaSans(
      fontSize: 32,
      fontStyle: FontStyle.italic,
      color: Colors.grey
  );
  static final TextStyle inriaSans32 = GoogleFonts.inriaSans(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.black
  );static final TextStyle inriaSans18 = GoogleFonts.inriaSans(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.black
  );
  static final TextStyle inriaSans18white = GoogleFonts.inriaSans(
      fontSize: 18,
      color: Colors.white
  );
  static final TextStyle inriaSans32white = GoogleFonts.inriaSans(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.white
  );
  static final TextStyle inriaSans42white = GoogleFonts.inriaSans(
      fontSize: 42,
      fontWeight: FontWeight.bold,
      color: Colors.white
  );}