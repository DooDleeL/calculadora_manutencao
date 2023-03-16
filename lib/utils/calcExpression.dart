import 'package:calculadora_manutencao/utils/calcWithOperator.dart';
import 'package:calculadora_manutencao/utils/doubleOfExpression.dart';
import 'package:calculadora_manutencao/utils/operatorsOfExpression.dart';

calcExpression(String expression){
  List<String> characters = [];
  List<dynamic> numbers = [];

  numbers = doubleOfExpression(expression);

  characters = operatorsOfExpression(expression);

  double total = 0;
  int currentCharacter = 0;

  total = calcWithOperator(numbers[0], numbers[1], characters[currentCharacter]);
  characters.removeAt(0);

  for(int i = 2 ; i <= numbers.length; i++ ) {
    if(characters.length <= 0) break;
    switch(characters[0]){
      case '+': {
        total = total + numbers[i];
        break;
      }
      case '-': {
        total = total - numbers[i];
        break;
      }
      case '*': {
        total = total * numbers[i];
        break;
      }
      case '/': {
        total = total / numbers[i];
        break;
      }
      default: {
        total: total;
        break;
      }
    }
    characters.removeAt(0);
  }


  return total ;
}