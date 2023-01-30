String? validateEmail(String? value){
  if(value == null || value.isEmpty){
    return 'email address required!';
  }else if(!value.contains('@') || !value.contains('.')){
    return 'invalid email address';
  }
  return null;
}

String? validateName(String? value){
  if(value == null || value.isEmpty){
    return 'name required!';
  }
  return null;
}

String? validatePassword(String? value){
  if(value == null || value.isEmpty){
    return 'password required!';
  }else if(value.length <= 8){
    return 'invalid password';
  }
  return null;
}

String? validateConfirmPassword(String? value){
  if(value == null || value.isEmpty){
    return 'please retype password!';
  }else if(validatePassword(value).toString() != value){
    return 'Password diverse';
  }
  return null;
}
