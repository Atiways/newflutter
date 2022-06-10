import 'package:flutter/material.dart';

class TextForm extends StatefulWidget {
  String? textlabel;
  Icon? iconPrefix;
  Text? changelabel;
  TextEditingController? controller;
  TextForm({Key? key,this.textlabel,this.iconPrefix,this.changelabel,this.controller}) : super(key: key);

  @override
  State<TextForm> createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: (text){
          if(text!.isEmpty){
            return"please enter a value here";
          }
          return null;
        },

         controller: widget.controller,
        enableIMEPersonalizedLearning: true,
        // enabled: false,
        decoration: InputDecoration(
          label: widget.changelabel,
          hintText: widget.textlabel,
          border: OutlineInputBorder(),
          prefixIcon: widget.iconPrefix,
          floatingLabelBehavior:
              FloatingLabelBehavior.always, // label is permanently up
        ),
      ),
    );
  }
  bool change = true;
  void changeIcon() {
    setState(() {
      change = !change;
    });
  }
}
