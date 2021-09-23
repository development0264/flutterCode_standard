# flutterCode_standard
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

-> All other standard coding architectures like variable name, class name, function name, etc. should be followed.

-> Use of architectures are must for the proper maintenance and scalability of the project.

-> If possible, there should be the test cases added for the project.

-> When adding/using a plugin, the license check is a must. MIT/BSD based license are good to go.  

-> The code should be clean, constant strings should be referenced to the constants file.

-> The widgets should be made reusable.

-> The functions having the same multiple usage throughout the application should go out in utils.

-> To have the common files for colors, fonts, textstyles is the best practice.
