# E-commerce Project

A boilerplate project created in flutter using GetX for an e-commerce mobile application and implement the home screen with dynamic product widgets. Clone the appropriate branches mentioned below:

* Git: https://github.com/AnsarAzees/wr_test (stable channel)



## How to Use 

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/AnsarAzees/wr_test.git
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies: 

```
flutter pub get 
```



## App Features:

* Splash
* Home
* Routing
* Theme
* Dio
* Getx (State management, Route management)


### Libraries & Tools Used

* [Dio](https://github.com/flutterchina/dio)
* [GetX](https://pub.dev/packages/get) (for state management and route management)


* [Shared preference](https://pub.dev/packages/shared_preferences)
* [Cached network image](https://pub.dev/packages/cached_network_image)
* [Flutter screenutil](https://pub.dev/packages/flutter_screenutil)
* [Flutter swiper](https://pub.dev/packages/flutter_swiper_plus)

### Folder Structure
Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- build
|- ios
|- lib
|- test
```

Here is the folder structure we have been using in this project

```
lib/app/
|- app_bindings/
|- custom_widgets/
|- models/
|- modules/
|- utils/
|- services/
|- utility/
```

Now, lets dive into the app folder which has the main code for the application.

```
1- app_bindings - All the application level bindings are defined in this directory with-in their respective files..

2- custom_widgets - Contains application level common widgets which can be re used.

3- models - Contains all models used in application. 

4- modules — Contains all the ui, controllers and bindings for each modules.

5- utility — Contains the utilities/common functions of your application.

8- main.dart - This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.
```

# Run tests using IntelliJ or VSCode
The Flutter plugins for IntelliJ and VSCode support running tests. This is often the best option while writing tests because it provides the fastest feedback loop as well as the ability to set breakpoints.

# IntelliJ
Open the home_controller_test.dart file

Select the Run menu

Click the Run 'tests in home_controller_test.dart' option

Alternatively, use the appropriate keyboard shortcut for your platform.

# VSCode
Open the home_controller_test.dart file

Select the Run menu

Click the Start Debugging option

Alternatively, use the appropriate keyboard shortcut for your platform

# Run tests in a terminal
You can also use a terminal to run the tests by executing the following command from the root of the project:

```
flutter test test/home_controller_test.dart
```

## Conclusion

It was fun working in this project. 
