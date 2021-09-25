--------- Flutter ---------

#Important files for a flutter project : 
-> pubspec.yaml - This file contains the followings : 
	- Project version name/code.
	- Plugins used with in the project.
	- Fonts/Assets.
-> lib - This folder contains the entire flutter/dart coding for the project. 
-> android/iOS - These folders have the native configuration.

#Coding Standard (best practice, not compulsory):
-> lib folder should have the folders like src, utils, commonwidgets for the simple maintenance.
-> The folder name should contain all small letters. for eg. signin, signup, etc.
-> The file name should contain all small letters along with the `_`. for eg. sign_in_page.dart
-> Use of architectures are must for the proper maintenance and scalability of the project.
-> If possible, there should be the test cases added for the project.
-> When adding/using a plugin, the license check is a must. MIT/BSD based license are good to go.  
-> The code should be clean, constant strings should be referenced to the constants file.
-> The widgets should be made reusable.
-> The functions having the same multiple usage throughout the application should go out in utils.
-> To have the common files for colors, fonts, textstyles is the best practice.

#Naming Convention
-> Begin global constant names with prefix "k", In flutter the standard of writing global constant is that it should start with "k". EG: const double kParagraphSpacing = 1.5;
-> Avoid anonymous parameter names, while passing name into function make sure, you pass proper name and don't pass name which will not be reconize. For eg if you want to pass first name into any function give the parameter name as firstName not a.
-> Naming rules for typedefs and function variables, When naming callbacks, use FooCallback for the typedef, onFoo for the callback argument or property, and handleFoo for the method that is called. If you have a callback with arguments but you want to ignore the arguments, give the type and names of the arguments anyway. That way, if someone copies and pastes your code, they will not have to look up what the arguments are. Never call a method onFoo. If a property is called onFoo it must be a function type. (For all values of "Foo".)
-> Spell words in identifiers and comments correctly, avoid using word like "cute" spellings. For example, 'colors', not 'colorz' use the correct spelling.
-> Avoid double negatives in APIs, when writing condition try to avoid using false condition.
-> Prefer naming the argument to a setter value
Qualify variables and methods used only for debugging
Avoid naming undocumented libraries, when you are using any libraries make sure you are not naming any undocumented library because later it will create problem for other as you have named it based on your understanding and actual meaning will be different.

Coding patterns and catching bugs early
-> Minimize the visibility scope of constants, try to use the local constant and static const instead of using global at all the places.
-> Avoid using if chains or ?: or == with enum values, try to use switch cases at as much as place possible and use it without setting the default case.
-> Avoid using var and dynamic, All variables and arguments are typed so due to that you need to avoid var and dynamic, instead what you can do is you can use let and const.

For better understanding, please checkout the following link:
https://github.com/flutter/flutter/wiki/Style-guide-for-Flutter-repo