import 'dart:math';
import 'dart:ui';

double? bmi;
class BmiBrain{
 final double height;
 final double weight;

  BmiBrain({required this.height, required this.weight});

  String? calc(){
     bmi = weight / pow(height, 2);
    return bmi?.toStringAsFixed(1);
  }

  String? calcDecision(){
    if(bmi! <= 18.5){
      return ('Under Weight');
    }
    else if(18.5 > bmi! || bmi! <= 25){
      return('Normal');
    }
    else if(25 > bmi! || bmi! <= 29.5){
      return ('OverWeight');
    }
    else if(29.5 > bmi! || bmi! <= 39.5){
      return('Obesity');
    }else{
      return('severely obesid');
    }
  }

  String? calcComment(){
    if(bmi! <= 18.5){
      return ('BMI < 18.5 indicates that a person is underweight, which can be associated with malnutrition or other health issues');
    }
    else if(18.5 > bmi! || bmi! <= 25){
      return('BMI within the range of 18.5 - 24.9 is generally considered health and is associated with a lower risk of chronic disease');
    }
    else if(25 > bmi! || bmi! <= 29.5){
      return ('Individuals withe the BMI between 25 - 29.5 are considered OVERWEIGHT, which may increase the risk of heart disease, diabetes, and other health issues');
    }
    else if(30 >= bmi! || bmi! <= 39.5){
      return('35 - 39.5 BMI result indicates obesity, which is associated with higher risk of health complications, including cardiovascular diseases');
    }else{
      return('BMI >= 40 is the most severe category associated with the =highest risk of severe health problems, including heart disease, diabetes, and certain cancers');
    }
  }
}
