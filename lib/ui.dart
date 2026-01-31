import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String labelText;
  final TextInputType keyboardType;
  final bool private;
  final bool password;
  final Widget? suffix;
  final String? Function(String?)? validator;
  final Function(String?)? saved;
  final String? error;
  final Function(String?)? changed;
  final TextEditingController? controller;
  final Widget? prefix;
  final Function(String?)? submitted;

  const Input({
    super.key,
    this.labelText = '',
    this.keyboardType = TextInputType.text,
    this.private = false,
    this.password = false,
    this.suffix,
    this.prefix,
    this.validator,
    this.saved,
    this.error,
    this.changed,
    this.controller,
    this.submitted
  });

  OutlineInputBorder border(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      obscureText: private,
      keyboardType: keyboardType,
      onChanged: changed,
      onSaved: saved,
      onFieldSubmitted: submitted,
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: suffix,
        prefixIcon: prefix,
        contentPadding: EdgeInsets.all(14.0),
        enabledBorder: border(Color(0x1f000000)),
        focusedBorder: border(Color(0x40000000)),
        disabledBorder: border(Color(0x8AFFFFFF)),
        focusedErrorBorder: border(Color(0xffef5350)),
        errorBorder: border(Color(0xffef5350)),
        fillColor: error == null ? Color(0xFFF5F5F9) : Color(0x20ef5350),
        filled: true,
        errorText: error,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelText: labelText,
        labelStyle: TextStyle(fontSize: 15, color: Color(0xFF939396)),
      ),
    );
  }
}

class SubTitle extends StatelessWidget {
  final String text;

  const SubTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Color(0xFF939396),
        fontWeight: FontWeight.w600,
        fontSize: 17,
      ),
    );
  }
}

class Select extends StatelessWidget {
  final String? Function(Object?)? validator;
  final String label;
  final Function(dynamic) func;
  final List<DropdownMenuItem<Object>>? items;

  const Select({
    super.key,
    this.validator,
    required this.label,
    required this.func,
    required this.items,
  });

  OutlineInputBorder border(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF5F5F9),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButtonFormField(
          validator: validator,
          dropdownColor: Colors.white,
          elevation: 1,
          borderRadius: BorderRadius.circular(10),
          decoration: InputDecoration(
            enabledBorder: border(Color(0x1f000000)),
            focusedBorder: border(Color(0x1f000000)),
            suffixIcon: Icon(Icons.keyboard_arrow_down),
            contentPadding: EdgeInsets.all(14),
          ),
          hint: Text(label, style: TextStyle(color: Color(0xFF939396))),
          items: items,
          onChanged: func,
        ),
      ),
    );
  }
}

class Label extends StatelessWidget {
  final String text;

  const Label({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(color: Color(0xFF7E7E9A)));
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

class PromoCard extends StatelessWidget {
  final String title;
  final String price;
  final String? image;

  const PromoCard({
    super.key,
    required this.title,
    required this.price,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Color(0xFF7AD7E8), Color(0xFFA7EDE7)],
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  price,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ?image != null ? Image.asset(image!) : null,
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final Function() func;
  final String title;
  final bool isSelected;

  const Category({
    super.key,
    required this.func,
    required this.title,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: isSelected ? Colors.blueAccent : Color(0xFFF5F5F9),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      ),
      onPressed: func,
      child: Text(
        title,
        style: TextStyle(color: isSelected ? Colors.white : Color(0xFF7E7E9A)),
      ),
    );
  }
}

class CardBackground extends StatelessWidget {
  final Widget component;

  const CardBackground({super.key, required this.component});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: BoxBorder.all(color: Color(0xFFF4F4F4)),
      ),
      padding: EdgeInsets.all(14),
      child: component,
    );
  }
}

class CardProject extends StatelessWidget {
  final Function() func;
  final String? buttonTitle;

  const CardProject({super.key, required this.func, this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return CardBackground(component: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Мой первый проект', style: TextStyle(
          fontSize:  16,
          fontWeight: FontWeight.w500
        )),
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Прошло 2 дня', style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Color(0xFF939396)
            )),
            SmallButton(func: func, title: buttonTitle)
          ],
        )
      ],
    ));
  }
}


// Primary
class CardOrder extends StatelessWidget {
  final String gender;
  final String title;
  final String price;
  final bool added;
  const CardOrder({super.key, required this.gender, required this.title, required this.price, required this.added});

  @override
  Widget build(BuildContext context) {
    return CardBackground(
      component: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    gender.contains('female')
                        ? 'Женская одежда'
                        : 'Мужская одежда',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF939396),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    price,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SmallButton(func: () {}, added: added)
            ],
          ),
        ],
      ),
    );
  }
}

class SmallButton extends StatelessWidget {
  final bool added;
  final Function() func;
  final String? title;


  const SmallButton({super.key, this.added = false, required this.func, this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 40,
      child: FilledButton(
        onPressed: func,
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.blueAccent),
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: added ? Colors.white: Colors.blueAccent,
          padding: EdgeInsets.symmetric(horizontal: added ? 24.0 : 15.5, vertical: 10),
        ),
        child: Text(added ? 'Убрать' : (title ?? 'Добавить'), style: TextStyle(
          color: added ? Colors.blueAccent : Colors.white,
          fontSize: 14
        )),
      ),
    );
  }
}

class TextMedium extends StatelessWidget {
  final Color? color;
  final String text;
  const TextMedium({super.key, this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 15,
      color: color ?? Color(0xFF939396),
    ));
  }
}


// TabBar
class TabNavigation extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  final int selectedIndex;
  final ValueChanged<int> func;

  const TabNavigation({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.func,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(items.length, (index) {
        return Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey.shade200)),
            ),
            child: InkWell(
              onTap: () => func(index),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    items[index]['icon'],
                    color: selectedIndex == index
                        ? Colors.blueAccent
                        : Colors.grey,
                  ),
                  Text(
                    items[index]['title'],
                    style: TextStyle(
                      fontSize: 12,
                      color: selectedIndex == index
                          ? Colors.blueAccent
                          : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
