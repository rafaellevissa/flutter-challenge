import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class FormPage extends StatefulWidget {
  FormPage();

  State<StatefulWidget> createState() => FormPageState();
}

class FormPageState extends State<FormPage> {
  final _dateDiary = TextEditingController();
  final _questionOne = TextEditingController();
  final _questionTwo = TextEditingController();
  final _questionThree = TextEditingController();
  final _questionFour = TextEditingController();
  final _questionFive = TextEditingController();
  final _questionSix = TextEditingController();
  final _questionSeven = TextEditingController();
  final _questionEight = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  List<Map<String, String>> _listForm = <Map<String, String>>[];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.book, color: Colors.white),
                SizedBox(width: 5),
                Text(
                  "Diário de sono",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            )),
        body: Container(
          margin: EdgeInsets.all(20.0),
          width: size.width,
          height: size.height,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                _dateField('Selecione a data do diario', _dateDiary),
                _timeField('Que horas você foi pra cama?', _questionOne),
                _timeField('Que horas você desligou as luzes para dormir?',
                    _questionTwo),
                _textField('Quanto tempo você demorou para iniciar o sono?',
                    _questionThree),
                _textField('Quantas vezes você acordou na noite passada?',
                    _questionFour),
                _textField(
                    'Quanto tempo você ficou acordado ao longo da noite? (tempo total dos despertares.)',
                    _questionFive),
                _timeField('Que horas você acordou pela manhã?', _questionSix),
                _timeField(
                    'Que horas você se levantou da cama?', _questionSeven),
                _textField('Quantas horas você dormiu na noite passada?',
                    _questionEight),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Row(children: [
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _saveForm();
                          }
                        },
                        child: Text('Salvar dia')),
                    SizedBox(width: 5),
                    ElevatedButton(
                        onPressed: () {
                              if (_listForm.isNotEmpty)
                                {
                                  Navigator.pushNamed(context, '/graph', arguments: [_max()]);
                                }
                            },
                        child: Text('Gerar relátorios')),
                  ]),
                ),
              ],
            ),
          ),
        ));
  }

    Widget _dateField(String label, TextEditingController controller) {
    return DateTimeField(
      controller: controller,
      validator: (value) {
        if (value == null) {
          return 'Este campo não pode ser vazio';
        }
        return null;
      },
      decoration: InputDecoration(
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
        icon: Icon(Icons.calendar_today, color: Colors.blue),
        labelText: label,
      ),
      format: DateFormat("yyyy-MM-dd"),
      onShowPicker: (context, currentValue) async {
        final date = await showDatePicker(
            context: context,
            firstDate: DateTime(1900),
            initialDate: currentValue ?? DateTime.now(),
            lastDate: DateTime(2100));
        return date;
      },
    );
  }

  Widget _timeField(String label, TextEditingController controller) {
    return DateTimeField(
      controller: controller,
      validator: (value) {
        if (value == null) {
          return 'Este campo não pode ser vazio';
        }
        return null;
      },
      decoration: InputDecoration(
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
        icon: Icon(Icons.watch_later_outlined, color: Colors.blue),
        labelText: label,
      ),
      format: DateFormat("HH:mm"),
      onShowPicker: (context, currentValue) async {
        final TimeOfDay time = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
          );
          return time == null ? null : DateTimeField.convert(time);
      },
    );
  }

  Widget _textField(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Este campo não pode ser vazio';
        }
        return null;
      },
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: 'Em minutos',
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
        icon: Icon(Icons.watch_later_outlined, color: Colors.blue),
        labelText: label,
      ),
    );
  }

  void _saveForm() {
    _listForm.add({
      'dateDiary': _dateDiary.text,
      'answerOne': _questionOne.text,
      'answerTwo': _questionTwo.text,
      'answerThree': _questionThree.text,
      'answerFour': _questionFour.text,
      'answerFive': _questionFive.text,
      'answerSix': _questionSix.text,
      'answerSeven': _questionSeven.text,
      'answerEight': _questionEight.text,
    });
  
    SnackBar message = SnackBar(content: Text('Informações sobre o dia ' + _listForm.last['dateDiary'] + ' salvas com sucesso.'));
    ScaffoldMessenger.of(context).showSnackBar(message);
  }

  String _max(){
    String max;
    _listForm.forEach((element) {
      if(max == null){
        max = element['answerOne'];
      } else {
        double _maxTime = _timeOfDayToDouble(_parseTime(max));
        double _currentTime = _timeOfDayToDouble(_parseTime(element['answerOne']));
        if(_currentTime > _maxTime){
         max = element['answerOne']; 
        }
      }
    });
    return max;
  }

    TimeOfDay _parseTime(String timeString){
    return TimeOfDay(hour:int.parse(timeString.split(":")[0]),minute: int.parse(timeString.split(":")[1]));
  } 

  double _timeOfDayToDouble(TimeOfDay tod) => tod.hour + tod.minute/60.0;
}
