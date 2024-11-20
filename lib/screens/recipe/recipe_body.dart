import 'package:flutter/material.dart';

class RecipeBody extends StatelessWidget {
  const RecipeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var defaultFontFamily = DefaultTextStyle.of(context).style.fontFamily;

    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Theme(
        data: Theme.of(context).copyWith(
          textTheme:
              Theme.of(context).textTheme.apply(fontFamily: defaultFontFamily),
        ),
        child: Builder(
          builder: (context) {
            return Text(
              '''* étape 1
* étape 2
* étape 3
* étape 4
* étape 5
* étape 6
* étape 7
* étape 8
* étape 9
* étape 10
* étape 11
* étape 12
* étape 13
* étape 14
* étape 15
* étape 16
* étape 17
* étape 18
* étape 19
* étape 20
* étape 21
* étape 22
* étape 23
* étape 24
* étape 25
* étape 26
* étape 27
* étape 28
* étape 29
* étape 30
* étape 31
* étape 32
* étape 33
* étape 34
* étape 35
* étape 36
* étape 37
* étape 38
* étape 39
* étape 40
* étape 41
* étape 42
* étape 43
* étape 44
* étape 45
* étape 46
* étape 47
* étape 48
* étape 49
* étape 50
                ''',
            );
          },
        ),
      ),
    );
  }
}
