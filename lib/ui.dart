import 'package:flutter/material.dart';
import 'custom_color.dart';

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
    this.submitted,
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
        enabledBorder: border(CustomColor.inputStr),
        focusedBorder: border(CustomColor.inputStr),
        disabledBorder: border(Colors.grey),
        focusedErrorBorder: border(CustomColor.error),
        errorBorder: border(CustomColor.error),
        fillColor: error == null ? CustomColor.inputBg : Colors.red.shade100,
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
          disabledBackgroundColor: CustomColor.accentInactive,
          disabledForegroundColor: CustomColor.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: CustomColor.accent,
          foregroundColor: CustomColor.white,
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
  final String? price;
  final String? image;

  const PromoCard({super.key, required this.title, this.price, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [CustomColor.gradientStart, CustomColor.gradientEnd],
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
                    color: CustomColor.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                ?price != null
                    ? Text(
                        '$price ₽',
                        style: const TextStyle(
                          color: CustomColor.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : null,
              ],
            ),
          ),
          ?image != null ? Image.network(image!) : null,
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
        backgroundColor: isSelected ? CustomColor.accent : CustomColor.white,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      ),
      onPressed: func,
      child: Text(
        title,
        style: TextStyle(color: isSelected ? CustomColor.white : CustomColor.description),
      ),
    );
  }
}

class CardBackground extends StatelessWidget {
  final Widget component;
  final Function() func;

  const CardBackground({
    super.key,
    required this.component,
    required this.func,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          border: BoxBorder.all(color: CustomColor.inputStr),
        ),
        padding: EdgeInsets.all(14),
        //TODO: Ripple effect going to over from border ListView
        child: InkWell(onTap: func, child: component),
      ),
    );
  }
}

class CardProject extends StatelessWidget {
  final Function() func;
  final Function() cardFunc;
  final String? buttonTitle;

  const CardProject({
    super.key,
    required this.func,
    this.buttonTitle,
    required this.cardFunc,
  });

  @override
  Widget build(BuildContext context) {
    return CardBackground(
      func: cardFunc,
      component: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Мой первый проект',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Прошло 2 дня',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: CustomColor.placeholder,
                ),
              ),
              SmallButton(func: func, title: buttonTitle),
            ],
          ),
        ],
      ),
    );
  }
}

// Primary
class CardOrder extends StatelessWidget {
  final String gender;
  final String title;
  final String price;
  final bool added;
  final Function() cardFunc;
  final Function() buttonFunc;

  const CardOrder({
    super.key,
    required this.gender,
    required this.title,
    required this.price,
    required this.added,
    required this.cardFunc,
    required this.buttonFunc
  });

  @override
  Widget build(BuildContext context) {
    return CardBackground(
      func: cardFunc,
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
                      color: CustomColor.placeholder,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    price,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SmallButton(func: buttonFunc, added: added),
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

  const SmallButton({
    super.key,
    this.added = false,
    required this.func,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: FilledButton(
        onPressed: func,
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: CustomColor.accent),
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: added ? Colors.white : CustomColor.accent,
          padding: EdgeInsets.symmetric(
            horizontal: added ? 24.0 : 15.5,
            vertical: 10,
          ),
        ),
        child: Text(
          added ? 'Убрать' : (title ?? 'Добавить'),
          style: TextStyle(
            color: added ? CustomColor.accent : Colors.white,
            fontSize: 14,
          ),
        ),
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
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 15,
        color: color ?? CustomColor.placeholder,
      ),
    );
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
              border: Border(top: BorderSide(color: CustomColor.inputStr)),
            ),
            child: InkWell(
              onTap: () => func(index),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    items[index]['icon'],
                    color: selectedIndex == index
                        ? CustomColor.accent
                        : Colors.grey,
                  ),
                  Text(
                    items[index]['title'],
                    style: TextStyle(
                      fontSize: 12,
                      color: selectedIndex == index
                          ? CustomColor.accent
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

class BottomSheet extends StatelessWidget {
  final String title;
  final String description;
  final String weight;
  final int price;
  final bool added;
  final Function() buttonFunc;

  const BottomSheet({
    super.key,
    required this.title,
    required this.description,
    required this.weight,
    required this.price,
    required this.added,
    required this.buttonFunc
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Heading(text: title),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.close),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.grey.shade50,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              'Описание',
              style: TextStyle(
                color: Color(0xFF939396),
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            Text(description),
            SizedBox(height: 8),
            Text(
              'Примерный расход',
              style: TextStyle(color: CustomColor.placeholder, fontSize: 14),
            ),
            Text(
              '$weight г',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 56,
              width: double.infinity,
              child: FilledButton(
                onPressed: buttonFunc,
                style: FilledButton.styleFrom(
                  backgroundColor: CustomColor.accent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(10),
                  ),
                ),
                child: Text(
                  added ? 'Убрать' : 'Добавить за $price ₽',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartCard extends StatelessWidget {
  final String title;
  final int price;
  final int count;
  final Function() plusFunc;
  final Function() minusFunc;
  final Function() deleteFunc;

  const CartCard({super.key, required this.title, required this.price, required this.count, required this.plusFunc, required this.minusFunc, required this.deleteFunc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: CardBackground(
        component: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 200,
                  child: Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  highlightColor: Colors.transparent,
                  onPressed: deleteFunc,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$price ₽',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$count штук',
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(width: 42),
                      RawMaterialButton(
                        materialTapTargetSize:
                        MaterialTapTargetSize.shrinkWrap,
                        constraints: BoxConstraints(
                          minWidth: 32.0,
                          minHeight: 32.0,
                        ),
                        onPressed: plusFunc,
                        elevation: 0,
                        fillColor: CustomColor.cardStroke,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10)
                          ),
                        ),
                        child: Icon(Icons.add, size: 20.0),
                      ),
                      VerticalDivider(color: CustomColor.black, thickness: 1, width: 0.5),
                      RawMaterialButton(
                        materialTapTargetSize:
                        MaterialTapTargetSize.shrinkWrap,
                        constraints: BoxConstraints(
                          minWidth: 32.0,
                          minHeight: 32.0,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10)
                          ),
                        ),
                        onPressed: minusFunc,
                        elevation: 0,
                        fillColor: CustomColor.cardStroke,
                        child: Icon(Icons.remove, size: 20.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        func: () {},
      ),
    );
  }
}

