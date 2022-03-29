import 'package:flutter/material.dart';
import 'package:flutter_shop/shared/input_validator.dart';

class InputFields {
  static Widget emailField(
    BuildContext context,
    Function onSaved,
    FocusNode? focusNode,
    FocusNode? nextNode,
  ) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        key: const ValueKey('email'),
        focusNode: focusNode,
        validator: (value) {
          return InputValidator.isValidEmail(value)
              ? null
              : 'Please enter a valid email address';
        },
        textInputAction: TextInputAction.next,
        onEditingComplete: () => FocusScope.of(context).requestFocus(nextNode),
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            border: const UnderlineInputBorder(),
            filled: true,
            prefixIcon: const Icon(Icons.email),
            labelText: 'Email Address',
            fillColor: Theme.of(context).backgroundColor),
        onSaved: (value) {
          onSaved(value);
        },
      ),
    );
  }
}
