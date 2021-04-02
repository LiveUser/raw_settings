# raw_settings

Minimalistic(lightweight) App settings dart package

Hecho en 🇵🇷 por Radamés J. Valentín Reyes

# How it works?

Creates a folder named after the appname on the temporary folder that Directory.systemTemp returns. Inside the created folder a File called settings.json is created to store all of the settings key:value pairs.

## Usage Example:

~~~dart
import 'package:raw_settings/raw_settings.dart';

void main() {
  RawSettings settings = RawSettings("test_app");
  settings.set(name: "language", value: "Español");
  String lang = settings.get(name: "language");
  print(lang);
}
~~~

## Note:

- When initializing the RawSettings class you have to pass as argument a string containing the name of the app so that when it runs on desktop it creates a separate folder to store your settings.json and reduce the probability of overwriting the file because of many people using the same package which uses the same file(settings.json) name on the same location(temporary directory). 

- All of it is written in dart and does not depend on flutter.

# How stable it is?

I've only tested it on Windows but it is meant to work on mobile also. Just test it.