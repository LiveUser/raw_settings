library raw_settings;

import 'dart:io';
import 'dart:convert';

///Holds all of the library methods and variables
class RawSettings {
  ///Hold the app name
  late final String _settingsPath;
  ///Holds the loaded settings from  the app folder
  Map<String,dynamic>? _settings;
  ///Loads the data into the class
  RawSettings(String appName){
    //Prevent the use of backslashes or slashes in the appname to prevent errors with the file system path
    appName = appName.replaceAll("/", "_");
    appName = appName.replaceAll("\\", "_");
    //Get the temporary directory
    Directory appTemporaryDirectory = Directory.systemTemp;
    //Define the Settings
    this._settingsPath = "${appTemporaryDirectory.path}/$appName/settings.json";
    //Read the file contents
    String json;
    //Prevent errors
    try{
      json = File(_settingsPath).readAsStringSync();
    }catch(error){
      json = "{}";
    }
    //Parse the json
    try{
      _settings = jsonDecode(json);
    }catch(error){
      _settings = {};
    }
    //Just to check that the settings are loaded
    //print(_settings);
  }
  ///Set a value
  void set({
    required String name,
    required dynamic value,
  }){
    //Add to the loaded settings
    _settings!.addAll({
      name : value,
    });
    //Convert settigs to json
    String json = jsonEncode(_settings);
    //Create the File if it doesn't exist
    File mySettings = File(_settingsPath);
    if(!mySettings.existsSync()){
      mySettings.createSync(recursive: true);
    }
    //Update the settings file
    mySettings.writeAsStringSync(json);
  }
  ///Returns the value of the property name that you specify
  dynamic get({
    required String name,
  }){
    return _settings![name];
  }
}