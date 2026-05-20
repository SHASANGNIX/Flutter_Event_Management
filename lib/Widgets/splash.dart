import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'fragment_holder.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => FragmentHolder()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF6A11FF), Color(0xFF3D0B87), Color(0xFF0F0F0F)],
            ),
          ),

          padding: EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: h * 0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "V1.0",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: h * 0.17),
              Image.asset("assets/logo.png", height: 0.3 * h, width: 0.6 * w),
              Text(
                "VELORA",
                style: GoogleFonts.montserrat(
                  fontSize: 55,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 2,
                  color: Colors.white,
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "CAMPUS ",
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1,
                        color: Color(0xff1DA1F2),
                      ),
                    ),
                    TextSpan(
                      text: "EVENT MANAGER",
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1,
                        color: Color(0xffFF7A1A),
                      ),
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "LOOK",
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        letterSpacing: 4,
                        color: Colors.white70,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: " • ",
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        letterSpacing: 4,
                        color: Color(0xff1DA1F2),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: "BOOK",
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        letterSpacing: 4,
                        color: Colors.white70,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: " • ",
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        letterSpacing: 4,
                        color: Color(0xffFF9F1A),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: "ENJOY",
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        letterSpacing: 4,
                        color: Colors.white70,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: h * 0.06),
              SizedBox(
                height: 60,
                width: 60,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 4,
                ),
              ),
              SizedBox(height: h * 0.01),
              Text(
                "Loading...",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(height: h * 0.05),
              Text(
                "COPYRIGHT © 2026 Velora",
                style: TextStyle(color: Colors.white60, fontSize: 18),
              ),
              Text(
                "Version 1.0.0",
                style: TextStyle(color: Colors.white60, fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
