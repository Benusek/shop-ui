import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String labelText;
  final Function(String) func;
  final TextInputType keyboardType;
  final bool private;
  final bool password;
  final Widget? suffix;

  const Input({
    super.key,
    this.labelText = '',
    required this.func,
    this.keyboardType = TextInputType.text,
    this.private = true,
    this.password = false,
    this.suffix,
  });

  OutlineInputBorder border(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: private,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        suffixIcon: suffix,
        contentPadding: EdgeInsets.all(14.0),
        enabledBorder: border(Color(0x1f000000)),
        focusedBorder: border(Color(0x40000000)),
        disabledBorder: border(Color(0x8AFFFFFF)),
        fillColor: Color(0xFFF5F5F9),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelText: labelText,
        labelStyle: TextStyle(
            fontSize: 15,
            color: Color(0xFF939396)
        )
      ),
      onChanged: func,
    );
  }
}

class Label extends StatelessWidget {
  final String text;

  const Label({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        style: TextStyle(
            color: Color(0xFF7E7E9A)
        )
    );
  }
}


class Heading extends StatelessWidget {
  final String text;

  const Heading({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.0033,
      ),
    );
  }
}

class CompletedButton extends StatelessWidget {
  final String text;
  final Function()? func;

  const CompletedButton({super.key, required this.func, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: TextButton(
        onPressed: func,
        style: TextButton.styleFrom(
          disabledBackgroundColor: Colors.blueAccent.shade100,
          disabledForegroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class Description extends StatelessWidget {
  final String text;

  const Description({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(color: Color(0xFF939396), fontSize: 14));
  }
}
