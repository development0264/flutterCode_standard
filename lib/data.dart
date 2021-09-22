import 'dart:convert';

import 'package:khontext/src/models/payment_history_filter_model.dart';
import 'package:khontext/src/models/payment_history_model.dart';
import 'package:khontext/src/models/posted_jobs_model.dart';
import 'package:khontext/src/models/postjobs/jobschedule/job_schedule_response_model.dart';
import 'package:khontext/src/models/translator_contracts_model.dart';
import 'package:khontext/src/models/translator_details_model.dart';
import 'package:khontext/src/models/translator_earnings_history_model.dart';
import 'package:khontext/src/models/translator_earnings_model.dart';
import 'package:khontext/src/models/translator_education_model.dart';
import 'package:khontext/src/models/translator_profile_model.dart';

class Contact {
  final String name;
  final String email;
  final String imageUrl;

  const Contact(this.name, this.email, this.imageUrl);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Contact && runtimeType == other.runtimeType && name == other.name;

  @override
  int get hashCode => name.hashCode;

  @override
  String toString() {
    return name;
  }
}

const allCountries = [
  {
    'country': 'Afghanistan',
    'code': '',
  },
  {
    'country': 'Albania',
    'code': '',
  },
  {
    'country': 'Algeria',
    'code': '',
  },
  {
    'country': 'American Samoa',
    'code': '',
  },
  {
    'country': 'Andorra',
    'code': '',
  },
  {
    'country': 'Angola',
    'code': '',
  },
  {
    'country': 'Anguilla',
    'code': '',
  },
  {
    'country': 'Antarctica',
    'code': '',
  },
  {
    'country': 'Antigua and Barbuda',
    'code': '',
  },
  {
    'country': 'Argentina',
    'code': '',
  },
  {
    'country': 'Armenia',
    'code': '',
  },
  {
    'country': 'Aruba',
    'code': '',
  },
  {
    'country': 'Australia',
    'code': '',
  },
  {
    'country': 'Austria',
    'code': '',
  },
  {
    'country': 'Azerbaijan',
    'code': '',
  },
  {
    'country': 'Bahamas',
    'code': '',
  },
  {
    'country': 'Bahrain',
    'code': '',
  },
  {
    'country': 'Bangladesh',
    'code': '',
  },
  {
    'country': 'Barbados',
    'code': '',
  },
  {
    'country': 'Belarus',
    'code': '',
  },
  {
    'country': 'Belgium',
    'code': '',
  },
  {
    'country': 'Belize',
    'code': '',
  },
  {
    'country': 'Benin',
    'code': '',
  },
  {
    'country': 'Bermuda',
    'code': '',
  },
  {
    'country': 'Bhutan',
    'code': '',
  },
  {
    'country': 'Bolivia',
    'code': '',
  },
  {
    'country': 'Bosnia and Herzegowina',
    'code': '',
  },
  {
    'country': 'Botswana',
    'code': '',
  },
  {
    'country': 'Bouvet Island',
    'code': '',
  },
  {
    'country': 'Brazil',
    'code': '',
  },
  {
    'country': 'British Indian Ocean Territory',
    'code': '',
  },
  {
    'country': 'Brunei Darussalam',
    'code': '',
  },
  {
    'country': 'Bulgaria',
    'code': '',
  },
  {
    'country': 'Burkina Faso',
    'code': '',
  },
  {
    'country': 'Burundi',
    'code': '',
  },
  {
    'country': 'Cambodia',
    'code': '',
  },
  {
    'country': 'Cameroon',
    'code': '',
  },
  {
    'country': 'Canada',
    'code': '',
  },
  {
    'country': 'Cape Verde',
    'code': '',
  },
  {
    'country': 'Cayman Islands',
    'code': '',
  },
  {
    'country': 'Central African Republic',
    'code': '',
  },
  {
    'country': 'Chad',
    'code': '',
  },
  {
    'country': 'Chile',
    'code': '',
  },
  {
    'country': 'China',
    'code': '',
  },
  {
    'country': 'Christmas Island',
    'code': '',
  },
  {
    'country': 'Cocos (Keeling) Islands',
    'code': '',
  },
  {
    'country': 'Colombia',
    'code': '',
  },
  {
    'country': 'Comoros',
    'code': '',
  },
  {
    'country': 'Congo',
    'code': '',
  },
  {
    'country': 'Congo, the Democratic Republic of the',
    'code': '',
  },
  {
    'country': 'Cook Islands',
    'code': '',
  },
  {
    'country': 'Costa Rica',
    'code': '',
  },
  {
    'country': 'Cote d\'Ivoire',
    'code': '',
  },
  {
    'country': 'Croatia (Hrvatska)',
    'code': '',
  },
  {
    'country': 'Cuba',
    'code': '',
  },
  {
    'country': 'Cyprus',
    'code': '',
  },
  {
    'country': 'Czech Republic',
    'code': '',
  },
  {
    'country': 'Denmark',
    'code': '',
  },
  {
    'country': 'Djibouti',
    'code': '',
  },
  {
    'country': 'Dominica',
    'code': '',
  },
  {
    'country': 'Dominican Republic',
    'code': '',
  },
  {
    'country': 'East Timor',
    'code': '',
  },
  {
    'country': 'Ecuador',
    'code': '',
  },
  {
    'country': 'Egypt',
    'code': '',
  },
  {
    'country': 'El Salvador',
    'code': '',
  },
  {
    'country': 'Equatorial Guinea',
    'code': '',
  },
  {
    'country': 'Eritrea',
    'code': '',
  },
  {
    'country': 'Estonia',
    'code': '',
  },
  {
    'country': 'Ethiopia',
    'code': '',
  },
  {
    'country': 'Falkland Islands (Malvinas)',
    'code': '',
  },
  {
    'country': 'Faroe Islands',
    'code': '',
  },
  {
    'country': 'Fiji',
    'code': '',
  },
  {
    'country': 'Finland',
    'code': '',
  },
  {
    'country': 'France',
    'code': '',
  },
  {
    'country': 'France Metropolitan',
    'code': '',
  },
  {
    'country': 'French Guiana',
    'code': '',
  },
  {
    'country': 'French Polynesia',
    'code': '',
  },
  {
    'country': 'French Southern Territories',
    'code': '',
  },
  {
    'country': 'Gabon',
    'code': '',
  },
  {
    'country': 'Gambia',
    'code': '',
  },
  {
    'country': 'Georgia',
    'code': '',
  },
  {
    'country': 'Germany',
    'code': '',
  },
  {
    'country': 'Ghana',
    'code': '',
  },
  {
    'country': 'Gibraltar',
    'code': '',
  },
  {
    'country': 'Greece',
    'code': '',
  },
  {
    'country': 'Greenland',
    'code': '',
  },
  {
    'country': 'Grenada',
    'code': '',
  },
  {
    'country': 'Guadeloupe',
    'code': '',
  },
  {
    'country': 'Guam',
    'code': '',
  },
  {
    'country': 'Guatemala',
    'code': '',
  },
  {
    'country': 'Guinea',
    'code': '',
  },
  {
    'country': 'Guinea-Bissau',
    'code': '',
  },
  {
    'country': 'Guyana',
    'code': '',
  },
  {
    'country': 'Haiti',
    'code': '',
  },
  {
    'country': 'Heard and Mc Donald Islands',
    'code': '',
  },
  {
    'country': 'Holy See (Vatican City State)',
    'code': '',
  },
  {
    'country': 'Honduras',
    'code': '',
  },
  {
    'country': 'Hong Kong',
    'code': '',
  },
  {
    'country': 'Hungary',
    'code': '',
  },
  {
    'country': 'Iceland',
    'code': '',
  },
  {
    'country': 'India',
    'code': '',
  },
  {
    'country': 'Indonesia',
    'code': '',
  },
  {
    'country': 'Iran (Islamic Republic of)',
    'code': '',
  },
  {
    'country': 'Iraq',
    'code': '',
  },
  {
    'country': 'Ireland',
    'code': '',
  },
  {
    'country': 'Israel',
    'code': '',
  },
  {
    'country': 'Italy',
    'code': '',
  },
  {
    'country': 'Jamaica',
    'code': '',
  },
  {
    'country': 'Japan',
    'code': '',
  },
  {
    'country': 'Jordan',
    'code': '',
  },
  {
    'country': 'Kazakhstan',
    'code': '',
  },
  {
    'country': 'Kenya',
    'code': '',
  },
  {
    'country': 'Kiribati',
    'code': '',
  },
  {
    'country': 'Korea, Democratic People\'s Republic of',
    'code': '',
  },
  {
    'country': 'Korea, Republic of',
    'code': '',
  },
  {
    'country': 'Kuwait',
    'code': '',
  },
  {
    'country': 'Kyrgyzstan',
    'code': '',
  },
  {
    'country': 'Lao, People\'s Democratic Republic',
    'code': '',
  },
  {
    'country': 'Latvia',
    'code': '',
  },
  {
    'country': 'Lebanon',
    'code': '',
  },
  {
    'country': 'Lesotho',
    'code': '',
  },
  {
    'country': 'Liberia',
    'code': '',
  },
  {
    'country': 'Libyan Arab Jamahiriya',
    'code': '',
  },
  {
    'country': 'Liechtenstein',
    'code': '',
  },
  {
    'country': 'Lithuania',
    'code': '',
  },
  {
    'country': 'Luxembourg',
    'code': '',
  },
  {
    'country': 'Macau',
    'code': '',
  },
  {
    'country': 'Macedonia, The Former Yugoslav Republic of',
    'code': '',
  },
  {
    'country': 'Madagascar',
    'code': '',
  },
  {
    'country': 'Malawi',
    'code': '',
  },
  {
    'country': 'Malaysia',
    'code': '',
  },
  {
    'country': 'Maldives',
    'code': '',
  },
  {
    'country': 'Mali',
    'code': '',
  },
  {
    'country': 'Malta',
    'code': '',
  },
  {
    'country': 'Marshall Islands',
    'code': '',
  },
  {
    'country': 'Martinique',
    'code': '',
  },
  {
    'country': 'Mauritania',
    'code': '',
  },
  {
    'country': 'Mauritius',
    'code': '',
  },
  {
    'country': 'Mayotte',
    'code': '',
  },
  {
    'country': 'Mexico',
    'code': '',
  },
  {
    'country': 'Micronesia, Federated States of',
    'code': '',
  },
  {
    'country': 'Moldova, Republic of',
    'code': '',
  },
  {
    'country': 'Monaco',
    'code': '',
  },
  {
    'country': 'Mongolia',
    'code': '',
  },
  {
    'country': 'Montserrat',
    'code': '',
  },
  {
    'country': 'Morocco',
    'code': '',
  },
  {
    'country': 'Mozambique',
    'code': '',
  },
  {
    'country': 'Myanmar',
    'code': '',
  },
  {
    'country': 'Namibia',
    'code': '',
  },
  {
    'country': 'Nauru',
    'code': '',
  },
  {
    'country': 'Nepal',
    'code': '',
  },
  {
    'country': 'Netherlands',
    'code': '',
  },
  {
    'country': 'Netherlands Antilles',
    'code': '',
  },
  {
    'country': 'New Caledonia',
    'code': '',
  },
  {
    'country': 'New Zealand',
    'code': '',
  },
  {
    'country': 'Nicaragua',
    'code': '',
  },
  {
    'country': 'Niger',
    'code': '',
  },
  {
    'country': 'Nigeria',
    'code': '',
  },
  {
    'country': 'Niue',
    'code': '',
  },
  {
    'country': 'Norfolk Island',
    'code': '',
  },
  {
    'country': 'Northern Mariana Islands',
    'code': '',
  },
  {
    'country': 'Norway',
    'code': '',
  },
  {
    'country': 'Oman',
    'code': '',
  },
  {
    'country': 'Pakistan',
    'code': '',
  },
  {
    'country': 'Palau',
    'code': '',
  },
  {
    'country': 'Panama',
    'code': '',
  },
  {
    'country': 'Papua New Guinea',
    'code': '',
  },
  {
    'country': 'Paraguay',
    'code': '',
  },
  {
    'country': 'Peru',
    'code': '',
  },
  {
    'country': 'Philippines',
    'code': '',
  },
  {
    'country': 'Pitcairn',
    'code': '',
  },
  {
    'country': 'Poland',
    'code': '',
  },
  {
    'country': 'Portugal',
    'code': '',
  },
  {
    'country': 'Puerto Rico',
    'code': '',
  },
  {
    'country': 'Qatar',
    'code': '',
  },
  {
    'country': 'Reunion',
    'code': '',
  },
  {
    'country': 'Romania',
    'code': '',
  },
  {
    'country': 'Russian Federation',
    'code': '',
  },
  {
    'country': 'Rwanda',
    'code': '',
  },
  {
    'country': 'Saint Kitts and Nevis',
    'code': '',
  },
  {
    'country': 'Saint Lucia',
    'code': '',
  },
  {
    'country': 'Saint Vincent and the Grenadines',
    'code': '',
  },
  {
    'country': 'Samoa',
    'code': '',
  },
  {
    'country': 'San Marino',
    'code': '',
  },
  {
    'country': 'Sao Tome and Principe',
    'code': '',
  },
  {
    'country': 'Saudi Arabia',
    'code': '',
  },
  {
    'country': 'Senegal',
    'code': '',
  },
  {
    'country': 'Seychelles',
    'code': '',
  },
  {
    'country': 'Sierra Leone',
    'code': '',
  },
  {
    'country': 'Singapore',
    'code': '',
  },
  {
    'country': 'Slovakia (Slovak Republic)',
    'code': '',
  },
  {
    'country': 'Slovenia',
    'code': '',
  },
  {
    'country': 'Solomon Islands',
    'code': '',
  },
  {
    'country': 'Somalia',
    'code': '',
  },
  {
    'country': 'South Africa',
    'code': '',
  },
  {
    'country': 'South Georgia and the South Sandwich Islands',
    'code': '',
  },
  {
    'country': 'Spain',
    'code': '',
  },
  {
    'country': 'Sri Lanka',
    'code': '',
  },
  {
    'country': 'St. Helena',
    'code': '',
  },
  {
    'country': 'St. Pierre and Miquelon',
    'code': '',
  },
  {
    'country': 'Sudan',
    'code': '',
  },
  {
    'country': 'Suriname',
    'code': '',
  },
  {
    'country': 'Svalbard and Jan Mayen Islands',
    'code': '',
  },
  {
    'country': 'Swaziland',
    'code': '',
  },
  {
    'country': 'Sweden',
    'code': '',
  },
  {
    'country': 'Switzerland',
    'code': '',
  },
  {
    'country': 'Syrian Arab Republic',
    'code': '',
  },
  {
    'country': 'Taiwan, Province of China',
    'code': '',
  },
  {
    'country': 'Tajikistan',
    'code': '',
  },
  {
    'country': 'Tanzania, United Republic of',
    'code': '',
  },
  {
    'country': 'Thailand',
    'code': '',
  },
  {
    'country': 'Togo',
    'code': '',
  },
  {
    'country': 'Tokelau',
    'code': '',
  },
  {
    'country': 'Tonga',
    'code': '',
  },
  {
    'country': 'Trinidad and Tobago',
    'code': '',
  },
  {
    'country': 'Tunisia',
    'code': '',
  },
  {
    'country': 'Turkey',
    'code': '',
  },
  {
    'country': 'Turkmenistan',
    'code': '',
  },
  {
    'country': 'Turks and Caicos Islands',
    'code': '',
  },
  {
    'country': 'Tuvalu',
    'code': '',
  },
  {
    'country': 'Uganda',
    'code': '',
  },
  {
    'country': 'Ukraine',
    'code': '',
  },
  {
    'country': 'United Arab Emirates',
    'code': '',
  },
  {
    'country': 'United Kingdom',
    'code': '',
  },
  {
    'country': 'United States',
    'code': '',
  },
  {
    'country': 'United States Minor Outlying Islands',
    'code': '',
  },
  {
    'country': 'Uruguay',
    'code': '',
  },
  {
    'country': 'Uzbekistan',
    'code': '',
  },
  {
    'country': 'Vanuatu',
    'code': '',
  },
  {
    'country': 'Venezuela',
    'code': '',
  },
  {
    'country': 'Vietnam',
    'code': '',
  },
  {
    'country': 'Virgin Islands (British)',
    'code': '',
  },
  {
    'country': 'Virgin Islands (U.S.)',
    'code': '',
  },
  {
    'country': 'Wallis and Futuna Islands',
    'code': '',
  },
  {
    'country': 'Western Sahara',
    'code': '',
  },
  {
    'country': 'Yemen',
    'code': '',
  },
  {
    'country': 'Yugoslavia',
    'code': '',
  },
  {
    'country': 'Zambia',
    'code': '',
  },
  {
    'country': 'Zimbabwe',
    'code': '',
  },
];

const allState = ['state1', 'state2', 'state3', 'Gujarat'];

const allTimeZone = [
  {'code': 'UTC-11:00', 'name': 'UTC-11:00 Midway Island, Samoa'},
  {'code': 'UTC-10:00', 'name': 'UTC-10:00 Hawaii'},
  {'code': 'UTC-09:00', 'name': 'UTC-09:00 Alaska'},
  {'code': 'UTC-08:00', 'name': 'UTC-08:00 Pacific Time (US & Canada); Los Angeles'},
  {'code': 'UTC-08:00', 'name': 'UTC-08:00 Pacific Time (US & Canada); Tijuana'},
  {'code': 'UTC-07:00', 'name': 'UTC-07:00 Arizona'},
  {'code': 'UTC-07:00', 'name': 'UTC-07:00 Mountain Time (US & Canada)'},
  {'code': 'UTC-06:00', 'name': 'UTC-06:00 Saskatchewan'},
  {'code': 'UTC-06:00', 'name': 'UTC-06:00 Eastern Time - Indiana - Starke County'},
  {'code': 'UTC-06:00', 'name': 'UTC-06:00 Nicaragua'},
  {'code': 'UTC-06:00', 'name': 'UTC-06:00 Mexico City, Tegucigalpa'},
  {'code': 'UTC-06:00', 'name': 'UTC-06:00 Central Time (US & Canada)'},
  {'code': 'UTC-05:00', 'name': 'UTC-05:00 Eastern Time (US & Canada)'},
  {'code': 'UTC-05:00', 'name': 'UTC-05:00 Bogota, Lima'},
  {'code': 'UTC-05:00', 'name': 'UTC-05:00 Eastern Time - Indiana - most locations'},
  {'code': 'UTC-04:00', 'name': 'UTC-04:00 Atlantic Time (Canada)'},
  {'code': 'UTC-04:00', 'name': 'UTC-04:00 La Paz'},
  {'code': 'UTC-04:00', 'name': 'UTC-04:00 Caracas'},
  {'code': 'UTC-03:00', 'name': 'UTC-03:00 NE Brazil (MA, PI, CE, RN, PB)'},
  {'code': 'UTC-03:00', 'name': 'UTC-03:00 E Argentina (BA, DF, SC, TF)'},
  {'code': 'UTC-03:30', 'name': 'UTC-03:00 Newfoundland'},
  {'code': 'UTC-03:00', 'name': 'UTC-03:00 Pernambuco'},
  {'code': 'UTC-03:00', 'name': 'UTC-03:00 S & SE Brazil (GO, DF, MG, ES, RJ, SP, PR, SC, RS)'},
  {'code': 'UTC-02:00', 'name': 'UTC-02:00 Mid-Atlantic'},
  {'code': 'UTC-01:00', 'name': 'UTC-01:00 Azores, Cape Verde Island'},
  {'code': 'UTC', 'name': 'UTC (no DST) Tangiers, Casablanca'},
  {'code': 'UTC', 'name': 'UTC (Coordinated Universal Time) Dublin, Edinburgh, London'},
  {'code': 'UTC+00:00', 'name': 'UTC+00:00 Libson'},
  {'code': 'UTC', 'name': 'UTC (Coordinated Universal Time)'},
  {'code': 'UTC+01:00', 'name': 'UTC+01:00 Prague, Warsaw'},
  {'code': 'UTC+01:00', 'name': 'UTC+01:00 Paris, Madrid'},
  {'code': 'UTC+01:00', 'name': 'UTC+01:00 Algeria'},
  {'code': 'UTC+02:00', 'name': 'UTC+02:00 Athens, Helsinki, Istanbul'},
  {'code': 'UTC+02:00', 'name': 'UTC+02:00 Eastern Europe'},
  {'code': 'UTC+02:00', 'name': 'UTC+02:00 Cairo'},
  {'code': 'UTC+02:00', 'name': 'UTC+02:00 Harare, Pretoria'},
  {'code': 'UTC+02:00', 'name': 'UTC+02:00 Israel'},
  {'code': 'UTC+03:00', 'name': 'UTC+03:00 Minsk'},
  {'code': 'UTC+03:00', 'name': 'UTC+03:00 Moscow, St. Petersburg, Volgograd'},
  {'code': 'UTC+03:30', 'name': 'UTC+03:30 Tehran'},
  {'code': 'UTC+03:00', 'name': 'UTC+03:00 Baghdad, Kuwait, Nairobi, Riyadh'},
  {'code': 'UTC+04:00', 'name': 'UTC+04:00 Abu Dhabi, Muscat, Tbilisi, Kazan'},
  {'code': 'UTC+05:00', 'name': 'UTC+05:00 Islamabad, Karachi'},
  {'code': 'UTC+04:30', 'name': 'UTC+04:30 Kabul'},
  {'code': 'UTC+04:00', 'name': 'UTC+04:00 Armenia'},
  {'code': 'UTC+05:45', 'name': 'UTC+05:45 Kathmandu, Nepal'},
  {'code': 'UTC+05:00', 'name': 'UTC+05:00 Tashkent'},
  {'code': 'UTC+05:00', 'name': 'UTC+05:00 Sverdlovsk'},
  {'code': 'UTC+06:00', 'name': 'UTC+06:00 Almaty, Dhaka'},
  {'code': 'UTC+05:30', 'name': 'UTC+05:30 Mumbai, Kolkata, Chennai, New Delhi'},
  {'code': 'UTC+06:00', 'name': 'UTC+06:00 Omsk, Novosibirsk'},
  {'code': 'UTC+07:00', 'name': 'UTC+07:00 Krasnoyarsk'},
  {'code': 'UTC+07:00', 'name': 'UTC+07:00 Bangkok, Jakarta, Hanoi'},
  {'code': 'UTC+08:00', 'name': 'UTC+08:00 Hong Kong SAR, Perth, Singapore, Taipei'},
  {'code': 'UTC+08:00', 'name': 'UTC+08:00 Irkutsk (Lake Baikal)'},
  {'code': 'UTC+08:00', 'name': 'UTC+08:00 Beijing, Chongqing, Urumqi'},
  {'code': 'UTC+09:00', 'name': 'UTC+09:00 Tokyo, Osaka, Sapporo, Seoul'},
  {'code': 'UTC+10:00', 'name': 'UTC+10:00 Guam, Port Moresby'},
  {'code': 'UTC+10:00', 'name': 'UTC+10:00 Magadan, Vladivostok'},
  {'code': 'UTC+11:00', 'name': 'UTC+11:00 Hobart'},
  {'code': 'UTC+09:30', 'name': 'UTC+09:30 Darwin'},
  {'code': 'UTC+10:00', 'name': 'UTC+10:00 Sydney, Melbourne'},
  {'code': 'UTC+10:00', 'name': 'UTC+10:00 Brisbane'},
  {'code': 'UTC+09:30', 'name': 'UTC+09:30 Adelaide'},
  {'code': 'UTC+10:00', 'name': 'UTC+10:00 Yakutsk (Lena River)'},
  {'code': 'UTC+12:00', 'name': 'UTC+12:00 Fiji Islands, Marshall Islands'},
  {'code': 'UTC+12:00', 'name': 'UTC+12:00 Wellington, Auckland'},
  {'code': 'UTC+12:00', 'name': 'UTC+12:00 Eniwetok, Kwajalein'},
  {'code': 'UTC+12:00', 'name': 'UTC+12:00 Kamchatka'},
  {'code': 'UTC+12:00', 'name': 'UTC+12:00 Solomon Islands, New Caledonia'},
  {'code': 'UTC+13:00', 'name': 'UTC+13:00 Apia (Samoa)'},
];

class Data {
  static TranslatorProfileModel translatorProfileModel = TranslatorProfileModel(
    firstName: 'Hemil',
    lastName: 'Gandhi',
    email: 'test@mailinator.com',
    taxId: 'test',
    phoneNumber: '1234567890',
    country: 'India',
    zipCode: '0226631',
    address: '123, Test Sciety, Adajan',
    addressLine2: 'Surat',
    city: 'Surat',
    state: 'Gujarat',
    timeZone: {'code': 'UTC+13:00', 'name': 'UTC+13:00 Apia (Samoa)'},
    countryCode: '+91',
    imageUrl:
        'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=701&q=80',
  );

  /// Payment history mock data
  static PaymentHistoryModel paymentHistory = paymentHistoryModelFromJson(json.encode([
    {
      "object": "list",
      "data": [
        {
          "id": "txn_1IOJ0X2eZvKYlo2CYVNQBTvB",
          "object": "balance_transaction",
          "amount": 939,
          "available_on": 1614729600,
          "created": 1614156368,
          "currency": "usd",
          "description": "e132777370fde2a6dc12b3a41b776b-receipt.png",
          "exchange_rate": null,
          "fee": 57,
          "fee_details": [
            {
              "amount": 57,
              "application": null,
              "currency": "usd",
              "description": "Stripe processing fees",
              "type": "stripe_fee"
            }
          ],
          "net": 882,
          "reporting_category": "charge",
          "source": "ch_1IOJ0W2eZvKYlo2CuCiKJQiu",
          "status": "available",
          "type": "charge"
        },
        {
          "id": "txn_1IOJ0X2eZvKYlo2Cert79NaI",
          "object": "balance_transaction",
          "amount": 734,
          "available_on": 1614729600,
          "created": 1614156368,
          "currency": "usd",
          "description": "213ed603da0bec8c417335ce80c5b8-receipt.png",
          "exchange_rate": null,
          "fee": 51,
          "fee_details": [
            {
              "amount": 51,
              "application": null,
              "currency": "usd",
              "description": "Stripe processing fees",
              "type": "stripe_fee"
            }
          ],
          "net": 683,
          "reporting_category": "charge",
          "source": "ch_1IOJ0W2eZvKYlo2CqZRyDmjr",
          "status": "available",
          "type": "charge"
        },
        {
          "id": "txn_1IOJ0X2eZvKYlo2CIBY1yFVX",
          "object": "balance_transaction",
          "amount": 925,
          "available_on": 1614729600,
          "created": 1614156368,
          "currency": "usd",
          "description": "1cd9f979e35315cde3721f21720284-receipt.png",
          "exchange_rate": null,
          "fee": 57,
          "fee_details": [
            {
              "amount": 57,
              "application": null,
              "currency": "usd",
              "description": "Stripe processing fees",
              "type": "stripe_fee"
            }
          ],
          "net": 868,
          "reporting_category": "charge",
          "source": "ch_1IOJ0W2eZvKYlo2CGXHIn6Zt",
          "status": "available",
          "type": "charge"
        },
        {
          "id": "txn_1IOJ0X2eZvKYlo2Cw5YIGMYV",
          "object": "balance_transaction",
          "amount": 679,
          "available_on": 1614729600,
          "created": 1614156368,
          "currency": "usd",
          "description": "368016c682f42c3a2f935f8dab4048-receipt.png",
          "exchange_rate": null,
          "fee": 50,
          "fee_details": [
            {
              "amount": 50,
              "application": null,
              "currency": "usd",
              "description": "Stripe processing fees",
              "type": "stripe_fee"
            }
          ],
          "net": 629,
          "reporting_category": "charge",
          "source": "ch_1IOJ0W2eZvKYlo2C1aDMOYEE",
          "status": "available",
          "type": "charge"
        },
        {
          "id": "txn_1IOJ0X2eZvKYlo2CFqHqS43p",
          "object": "balance_transaction",
          "amount": 359,
          "available_on": 1614729600,
          "created": 1614156368,
          "currency": "usd",
          "description": "9dc066b95ee09a128c4dc64ac9c261-receipt.png",
          "exchange_rate": null,
          "fee": 40,
          "fee_details": [
            {
              "amount": 40,
              "application": null,
              "currency": "usd",
              "description": "Stripe processing fees",
              "type": "stripe_fee"
            }
          ],
          "net": 319,
          "reporting_category": "charge",
          "source": "ch_1IOJ0W2eZvKYlo2CGORsPKwI",
          "status": "available",
          "type": "charge"
        },
        {
          "id": "txn_1IOJ0X2eZvKYlo2CN6R5hYMG",
          "object": "balance_transaction",
          "amount": 997,
          "available_on": 1614729600,
          "created": 1614156368,
          "currency": "usd",
          "description": "ecdc096f3ecb7a8b9979f0b092718b-receipt.png",
          "exchange_rate": null,
          "fee": 59,
          "fee_details": [
            {
              "amount": 59,
              "application": null,
              "currency": "usd",
              "description": "Stripe processing fees",
              "type": "stripe_fee"
            }
          ],
          "net": 938,
          "reporting_category": "charge",
          "source": "ch_1IOJ0W2eZvKYlo2CfEarouZt",
          "status": "available",
          "type": "charge"
        },
        {
          "id": "txn_1IOJ0X2eZvKYlo2CP0mL4Vdz",
          "object": "balance_transaction",
          "amount": 549,
          "available_on": 1614729600,
          "created": 1614156368,
          "currency": "usd",
          "description": "d21ff3505b0574d9576ea005cf65c9-receipt.png",
          "exchange_rate": null,
          "fee": 46,
          "fee_details": [
            {
              "amount": 46,
              "application": null,
              "currency": "usd",
              "description": "Stripe processing fees",
              "type": "stripe_fee"
            }
          ],
          "net": 503,
          "reporting_category": "charge",
          "source": "ch_1IOJ0W2eZvKYlo2C9y18VHCN",
          "status": "available",
          "type": "charge"
        },
        {
          "id": "txn_1IOJ0W2eZvKYlo2C4D0CdDff",
          "object": "balance_transaction",
          "amount": 501,
          "available_on": 1614729600,
          "created": 1614156368,
          "currency": "usd",
          "description": "c0cc62495856ad453e28af0c990c8f-receipt.png",
          "exchange_rate": null,
          "fee": 45,
          "fee_details": [
            {
              "amount": 45,
              "application": null,
              "currency": "usd",
              "description": "Stripe processing fees",
              "type": "stripe_fee"
            }
          ],
          "net": 456,
          "reporting_category": "charge",
          "source": "ch_1IOJ0W2eZvKYlo2CW8sMSWGn",
          "status": "available",
          "type": "charge"
        },
        {
          "id": "txn_1IOJ0W2eZvKYlo2C4CJoo9DM",
          "object": "balance_transaction",
          "amount": 951,
          "available_on": 1614729600,
          "created": 1614156368,
          "currency": "usd",
          "description": "5b065641fa5d9f5a014e0ecd15f3ea-receipt.png",
          "exchange_rate": null,
          "fee": 58,
          "fee_details": [
            {
              "amount": 58,
              "application": null,
              "currency": "usd",
              "description": "Stripe processing fees",
              "type": "stripe_fee"
            }
          ],
          "net": 893,
          "reporting_category": "charge",
          "source": "ch_1IOJ0W2eZvKYlo2CAIiZdiJq",
          "status": "available",
          "type": "charge"
        },
        {
          "id": "txn_1IOIyu2eZvKYlo2CuUodR9r9",
          "object": "balance_transaction",
          "amount": 1203,
          "available_on": 1614729600,
          "created": 1614156268,
          "currency": "usd",
          "description": "Payment for appointment with ID 45",
          "exchange_rate": 1.20308,
          "fee": 65,
          "fee_details": [
            {
              "amount": 65,
              "application": null,
              "currency": "usd",
              "description": "Stripe processing fees",
              "type": "stripe_fee"
            }
          ],
          "net": 1138,
          "reporting_category": "charge",
          "source": "ch_1IOIyu2eZvKYlo2Cl3cY025M",
          "status": "available",
          "type": "charge"
        },
        {
          "id": "txn_1IOIx72eZvKYlo2C31SZtbwv",
          "object": "balance_transaction",
          "amount": 3000,
          "available_on": 1614729600,
          "created": 1614156156,
          "currency": "usd",
          "description": null,
          "exchange_rate": null,
          "fee": 117,
          "fee_details": [
            {
              "amount": 117,
              "application": null,
              "currency": "usd",
              "description": "Stripe processing fees",
              "type": "stripe_fee"
            }
          ],
          "net": 2883,
          "reporting_category": "charge",
          "source": "ch_1IOIx62eZvKYlo2CIwZgQX4a",
          "status": "available",
          "type": "charge"
        },
        {
          "id": "txn_1IOIvr2eZvKYlo2CctCLxRWV",
          "object": "balance_transaction",
          "amount": 475000,
          "available_on": 1614729600,
          "created": 1614156079,
          "currency": "usd",
          "description": null,
          "exchange_rate": null,
          "fee": 13805,
          "fee_details": [
            {
              "amount": 13805,
              "application": null,
              "currency": "usd",
              "description": "Stripe processing fees",
              "type": "stripe_fee"
            }
          ],
          "net": 461195,
          "reporting_category": "charge",
          "source": "ch_1IOIvr2eZvKYlo2CdyC9Av9M",
          "status": "available",
          "type": "charge"
        },
        {
          "id": "txn_1IOIvi2eZvKYlo2CFPqDed4I",
          "object": "balance_transaction",
          "amount": 536,
          "available_on": 1614729600,
          "created": 1614156069,
          "currency": "usd",
          "description": "4f249e0f29d3bf93ac43a4273680b1-receipt.png",
          "exchange_rate": null,
          "fee": 46,
          "fee_details": [
            {
              "amount": 46,
              "application": null,
              "currency": "usd",
              "description": "Stripe processing fees",
              "type": "stripe_fee"
            }
          ],
          "net": 490,
          "reporting_category": "charge",
          "source": "ch_1IOIvh2eZvKYlo2Cg9rAhtrT",
          "status": "available",
          "type": "charge"
        },
        {
          "id": "txn_1IOIvh2eZvKYlo2Cl9Iv8czI",
          "object": "balance_transaction",
          "amount": 375,
          "available_on": 1614729600,
          "created": 1614156068,
          "currency": "usd",
          "description": "4ffb3daad5bd233e8d73af0c68864c-receipt.png",
          "exchange_rate": null,
          "fee": 41,
          "fee_details": [
            {
              "amount": 41,
              "application": null,
              "currency": "usd",
              "description": "Stripe processing fees",
              "type": "stripe_fee"
            }
          ],
          "net": 334,
          "reporting_category": "charge",
          "source": "ch_1IOIvg2eZvKYlo2C5UYOx1WV",
          "status": "available",
          "type": "charge"
        },
        {
          "id": "txn_1IOIvg2eZvKYlo2Ct7I6zxvd",
          "object": "balance_transaction",
          "amount": 680,
          "available_on": 1614729600,
          "created": 1614156068,
          "currency": "usd",
          "description": "16cace9dd267bc21feff20538bc529-receipt.png",
          "exchange_rate": null,
          "fee": 50,
          "fee_details": [
            {
              "amount": 50,
              "application": null,
              "currency": "usd",
              "description": "Stripe processing fees",
              "type": "stripe_fee"
            }
          ],
          "net": 630,
          "reporting_category": "charge",
          "source": "ch_1IOIvg2eZvKYlo2CG9AKF7Lu",
          "status": "available",
          "type": "charge"
        },
        {
          "id": "txn_1IOIvg2eZvKYlo2CyFQpZ2ca",
          "object": "balance_transaction",
          "amount": 857,
          "available_on": 1614729600,
          "created": 1614156068,
          "currency": "usd",
          "description": "f9a7bd76994b4e30c12861d968cbb0-receipt.png",
          "exchange_rate": null,
          "fee": 55,
          "fee_details": [
            {
              "amount": 55,
              "application": null,
              "currency": "usd",
              "description": "Stripe processing fees",
              "type": "stripe_fee"
            }
          ],
          "net": 802,
          "reporting_category": "charge",
          "source": "ch_1IOIvg2eZvKYlo2CjuYxB41e",
          "status": "available",
          "type": "charge"
        },
        {
          "id": "txn_1IOIvg2eZvKYlo2C6yeYduuJ",
          "object": "balance_transaction",
          "amount": 623,
          "available_on": 1614729600,
          "created": 1614156068,
          "currency": "usd",
          "description": "3503263355e9e7d915f7e45cdef0ab-receipt.png",
          "exchange_rate": null,
          "fee": 48,
          "fee_details": [
            {
              "amount": 48,
              "application": null,
              "currency": "usd",
              "description": "Stripe processing fees",
              "type": "stripe_fee"
            }
          ],
          "net": 575,
          "reporting_category": "charge",
          "source": "ch_1IOIvg2eZvKYlo2CnnPD34Tt",
          "status": "available",
          "type": "charge"
        },
        {
          "id": "txn_1IOIvg2eZvKYlo2Ck6aKOuJa",
          "object": "balance_transaction",
          "amount": 557,
          "available_on": 1614729600,
          "created": 1614156068,
          "currency": "usd",
          "description": "4310c4ba2528bb1782c17c602bd350-receipt.png",
          "exchange_rate": null,
          "fee": 46,
          "fee_details": [
            {
              "amount": 46,
              "application": null,
              "currency": "usd",
              "description": "Stripe processing fees",
              "type": "stripe_fee"
            }
          ],
          "net": 511,
          "reporting_category": "charge",
          "source": "ch_1IOIvg2eZvKYlo2COtT1SsOd",
          "status": "available",
          "type": "charge"
        },
        {
          "id": "txn_1IOIvg2eZvKYlo2CCMscEW09",
          "object": "balance_transaction",
          "amount": 910,
          "available_on": 1614729600,
          "created": 1614156068,
          "currency": "usd",
          "description": "dcb70a6a027f13e1d82c4c7bab693b-receipt.png",
          "exchange_rate": null,
          "fee": 56,
          "fee_details": [
            {
              "amount": 56,
              "application": null,
              "currency": "usd",
              "description": "Stripe processing fees",
              "type": "stripe_fee"
            }
          ],
          "net": 854,
          "reporting_category": "charge",
          "source": "ch_1IOIvg2eZvKYlo2CD2su3IlN",
          "status": "available",
          "type": "charge"
        },
        {
          "id": "txn_1IOIvg2eZvKYlo2CjVXbcTpk",
          "object": "balance_transaction",
          "amount": 931,
          "available_on": 1614729600,
          "created": 1614156068,
          "currency": "usd",
          "description": "e957e0b7037f2243cef3cc06404fae-receipt.png",
          "exchange_rate": null,
          "fee": 57,
          "fee_details": [
            {
              "amount": 57,
              "application": null,
              "currency": "usd",
              "description": "Stripe processing fees",
              "type": "stripe_fee"
            }
          ],
          "net": 874,
          "reporting_category": "charge",
          "source": "ch_1IOIvg2eZvKYlo2Cwr0SmU1X",
          "status": "available",
          "type": "charge"
        },
        {
          "id": "txn_1IOIvg2eZvKYlo2CZeesOZVX",
          "object": "balance_transaction",
          "amount": 157,
          "available_on": 1614729600,
          "created": 1614156067,
          "currency": "usd",
          "description": "3d78c8796394889d475f688855dfca-receipt.png",
          "exchange_rate": null,
          "fee": 35,
          "fee_details": [
            {
              "amount": 35,
              "application": null,
              "currency": "usd",
              "description": "Stripe processing fees",
              "type": "stripe_fee"
            }
          ],
          "net": 122,
          "reporting_category": "charge",
          "source": "ch_1IOIvf2eZvKYlo2C5HsIDAuS",
          "status": "available",
          "type": "charge"
        },
        {
          "id": "txn_1IOIve2eZvKYlo2CbCy9wTT2",
          "object": "balance_transaction",
          "amount": 999,
          "available_on": 1614729600,
          "created": 1614156066,
          "currency": "usd",
          "description": "Invoice B21AD8CA-0324",
          "exchange_rate": null,
          "fee": 59,
          "fee_details": [
            {
              "amount": 59,
              "application": null,
              "currency": "usd",
              "description": "Stripe processing fees",
              "type": "stripe_fee"
            }
          ],
          "net": 940,
          "reporting_category": "charge",
          "source": "ch_1IOIve2eZvKYlo2CGb2VJBQz",
          "status": "available",
          "type": "charge"
        },
        {
          "id": "txn_1IOIv62eZvKYlo2C8UrME7kC",
          "object": "balance_transaction",
          "amount": 10100,
          "available_on": 1614729600,
          "created": 1614156031,
          "currency": "usd",
          "description": null,
          "exchange_rate": null,
          "fee": 323,
          "fee_details": [
            {
              "amount": 323,
              "application": null,
              "currency": "usd",
              "description": "Stripe processing fees",
              "type": "stripe_fee"
            }
          ],
          "net": 9777,
          "reporting_category": "charge",
          "source": "ch_1IOIv52eZvKYlo2CgYiHB0tT",
          "status": "available",
          "type": "charge"
        },
        {
          "id": "txn_1IOIv02eZvKYlo2ChmTa5JRO",
          "object": "balance_transaction",
          "amount": 1050,
          "available_on": 1614729600,
          "created": 1614156026,
          "currency": "usd",
          "description": "DrHelpMySkin",
          "exchange_rate": null,
          "fee": 60,
          "fee_details": [
            {
              "amount": 60,
              "application": null,
              "currency": "usd",
              "description": "Stripe processing fees",
              "type": "stripe_fee"
            }
          ],
          "net": 990,
          "reporting_category": "charge",
          "source": "ch_1IOIv02eZvKYlo2COF1ZO7wf",
          "status": "available",
          "type": "charge"
        },
        {
          "id": "txn_1IOIs22eZvKYlo2CQ7UnazX4",
          "object": "balance_transaction",
          "amount": 999,
          "available_on": 1614729600,
          "created": 1614155842,
          "currency": "usd",
          "description": "Invoice FF5CBA0-0032",
          "exchange_rate": null,
          "fee": 59,
          "fee_details": [
            {
              "amount": 59,
              "application": null,
              "currency": "usd",
              "description": "Stripe processing fees",
              "type": "stripe_fee"
            }
          ],
          "net": 940,
          "reporting_category": "charge",
          "source": "ch_1IOIs22eZvKYlo2CnJsWXNoY",
          "status": "available",
          "type": "charge"
        },
        {
          "id": "txn_1IOIqr2eZvKYlo2CzDnA1wb0",
          "object": "balance_transaction",
          "amount": 379,
          "available_on": 1614729600,
          "created": 1614155769,
          "currency": "usd",
          "description": "6f81928baf58bc4f86744e1d35f660-receipt.png",
          "exchange_rate": null,
          "fee": 41,
          "fee_details": [
            {
              "amount": 41,
              "application": null,
              "currency": "usd",
              "description": "Stripe processing fees",
              "type": "stripe_fee"
            }
          ],
          "net": 338,
          "reporting_category": "charge",
          "source": "ch_1IOIqr2eZvKYlo2ChRzGfAwt",
          "status": "available",
          "type": "charge"
        },
        {
          "id": "txn_1IOIqr2eZvKYlo2CgV3R9nwF",
          "object": "balance_transaction",
          "amount": 622,
          "available_on": 1614729600,
          "created": 1614155769,
          "currency": "usd",
          "description": "302af889170b85bba16ffc9fe00daf-receipt.png",
          "exchange_rate": null,
          "fee": 48,
          "fee_details": [
            {
              "amount": 48,
              "application": null,
              "currency": "usd",
              "description": "Stripe processing fees",
              "type": "stripe_fee"
            }
          ],
          "net": 574,
          "reporting_category": "charge",
          "source": "ch_1IOIqr2eZvKYlo2CbfSFjjgE",
          "status": "available",
          "type": "charge"
        },
        {
          "id": "txn_1IOIqr2eZvKYlo2C9ncwRxrG",
          "object": "balance_transaction",
          "amount": 417,
          "available_on": 1614729600,
          "created": 1614155769,
          "currency": "usd",
          "description": "8a4e203ece3bebaf184ebc3191bde3-receipt.png",
          "exchange_rate": null,
          "fee": 42,
          "fee_details": [
            {
              "amount": 42,
              "application": null,
              "currency": "usd",
              "description": "Stripe processing fees",
              "type": "stripe_fee"
            }
          ],
          "net": 375,
          "reporting_category": "charge",
          "source": "ch_1IOIqr2eZvKYlo2C9RevVrnU",
          "status": "available",
          "type": "charge"
        },
        {
          "id": "txn_1IOIqr2eZvKYlo2CNZTMrRg4",
          "object": "balance_transaction",
          "amount": 335,
          "available_on": 1614729600,
          "created": 1614155769,
          "currency": "usd",
          "description": "2864faffd027a1a850c56f4a684379-receipt.png",
          "exchange_rate": null,
          "fee": 40,
          "fee_details": [
            {
              "amount": 40,
              "application": null,
              "currency": "usd",
              "description": "Stripe processing fees",
              "type": "stripe_fee"
            }
          ],
          "net": 295,
          "reporting_category": "charge",
          "source": "ch_1IOIqr2eZvKYlo2CVQ1b3QsQ",
          "status": "available",
          "type": "charge"
        },
        {
          "id": "txn_1IOIqq2eZvKYlo2CJv9WwQh8",
          "object": "balance_transaction",
          "amount": 607,
          "available_on": 1614729600,
          "created": 1614155768,
          "currency": "usd",
          "description": "da4bec3e32a52a3c664a933720d993-receipt.png",
          "exchange_rate": null,
          "fee": 48,
          "fee_details": [
            {
              "amount": 48,
              "application": null,
              "currency": "usd",
              "description": "Stripe processing fees",
              "type": "stripe_fee"
            }
          ],
          "net": 559,
          "reporting_category": "charge",
          "source": "ch_1IOIqq2eZvKYlo2CfXAtKIgU",
          "status": "available",
          "type": "charge"
        }
      ],
      "has_more": true,
      "url": "/v1/balance_transactions"
    }
  ]).toString());

  /// Posted jobs mock data
  static List<PostedJobsModel> postedJobsData = List.generate(
      25,
      (index) => PostedJobsModel(
            description: PostedJobsDescription(
              jobTitle: 'Full Stack Developer $index',
              jobDescription: 'Cloud-only - Hourly',
              jobFiles: [],
              service: 'Document Translation',
              serviceType: ['On-site'],
            ),
            language: PostedJobsLanguage(
              jobSourceLanguages: 'English',
              jobDestinationLanguages: 'Chinese',
              jobSpecializations: 'Law, Medical, Technical',
            ),
            place: PostedJobsLocation(
                streetAddress: '3037 Windsor Meadow Ln, Matthews, NC 28105, USA'),
            visibility: PostedJobsVisibility(
              jobBoundary: [],
              jobLanguageSpeciality: [],
              jobProficiency: 'Medium',
              jobExperiences: '5',
              jobRatings: '3',
              jobReviews: 'More than 50',
            ),
            schedule: PostedJobsSchedule(jobScheduleList: [
              ScheduleDateTime(
                fromDateTime: DateTime(2020 + index, 3, 25, 11, 52),
                toDateTime: DateTime(2020 + index, 3, 25, 18, 52),
              )
            ]),
            details: PostedJobsDetails(proposals: '1$index', messaged: '1$index', hired: '1$index'),
            filters: PostedJobsFilters(jobType: 'Active'),
            timeCreated: DateTime(2020 + index, 3, 25, 11, 52),
          ));

  /// Filter options for the posted jobs.
  static List<String> servicesTypeData = [
    'Interpretation',
    'Document Translation',
  ];

  static List<String> servicesData = [
    'On-site',
    'Remotely through telephone',
    'Remotely through internet'
  ];

  static List<String> jobStatusData = ['Active', 'Filed', 'Paused'];

  /// This function returns the list of the data based on the pagination and search.
  static Future<List<PaymentHistoryData>> currentPaymentHistoryData(int pageKey, int pageSize,
      {PaymentHistoryFilterModel filterModel}) async {
    paymentHistory.data.sort((a, b) => b.created.compareTo(a.created));
    return await Future.delayed(Duration(seconds: 1), () {
      if (!checkIfPaymentModelNull(filterModel)) {
        List<PaymentHistoryData> filterList = [];

        filterList.addAll(paymentHistory.data.where((element) => (filterModel.paymentSearch !=
                    null &&
                filterModel.paymentSearch.isNotEmpty &&
                (element.description.toLowerCase().contains(filterModel.paymentSearch)) ||
            (filterModel.amountStart != null &&
                filterModel.amountEnd != null &&
                checkIfAmountInBetween(
                    filterModel.amountStart, filterModel.amountEnd, element.amount.toString())) ||
            (filterModel.paymentStatus != null &&
                element.status.toLowerCase().contains(filterModel.paymentStatus.toLowerCase())) ||
            (filterModel.paidOnStart != null &&
                filterModel.paidOnEnd != null &&
                checkIfDateInBetween(filterModel.paidOnStart, filterModel.paidOnEnd,
                    DateTime.fromMillisecondsSinceEpoch(element.availableOn))))));

        return filterList.sublist(
            pageKey,
            (pageSize + pageKey) > filterList.length
                ? filterList.length
                : (pageSize + pageKey) > postedJobsData.length
                    ? postedJobsData.length
                    : (pageSize + pageKey));
      }

      return paymentHistory.data.sublist(
          pageKey,
          (pageSize + pageKey) >= paymentHistory.data.length
              ? paymentHistory.data.length
              : (pageSize + pageKey));
    });
  }

  /// Function which checks the amount in between
  static bool checkIfAmountInBetween(String startAmount, String endAmount, String amount) {
    return double.parse(amount) > double.parse(startAmount) &&
        double.parse(amount) < double.parse(endAmount);
  }

  /// Function which checks the amount in between
  static bool checkIfDateInBetween(DateTime startDate, DateTime endDate, DateTime date) {
    return date.isAfter(startDate) && date.isBefore(endDate);
  }

  /// Function which checks if the model is null.
  static bool checkIfPaymentModelNull(PaymentHistoryFilterModel model) {
    if (model.paymentStatus == null &&
        model.amountEnd == null &&
        model.amountStart == null &&
        model.paidOnEnd == null &&
        model.paidOnStart == null &&
        model.paymentSearch == null) {
      return true;
    }

    return false;
  }

  /// Filter options for the payment history
  static List<String> paymentStatusData = [
    'Paid',
    'UnPaid',
    'Pending',
    'Done',
  ];

  /// List which gives the specializations mock data
  static List<String> specializations = [
    'Law',
    'Medical',
    'Chemistry',
    'Technical',
    'Data Analysis'
  ];

  /// List which gives the proficiency mock data
  static List<String> proficiency = ['High', 'Medium', 'Low'];

  /// List which gives the ratings mock data
  static List<String> ratings = ['1', '2', '3', '4', '5'];

  /// List which gives the reviews mock data
  static List<String> reviews = [
    'Less than 50',
    'More than 50',
    'More than 100',
    'More than 200',
    'More than 500',
    'More than 1k',
  ];

  static List<String> employmentTypeList = [
    'Full-Time',
    'Part-Time',
    'Self-employed',
    'Freelance',
    'Internship',
    'Trainee'
  ];

  static List<TranslatorEducationModel> translateEducationModel = [
    TranslatorEducationModel(
        school: 'L.S.',
        degree: 'M.B.A',
        fieldOfStudy: 'Management',
        startDate: DateTime(2020, 02),
        endDate: DateTime(2020, 08),
        grade: '4.5',
        activities: 'Lorem ipsum sit dollar amet',
        description: 'Lorem ipsum sit dollar amet - Lorem ipsum sit dollar amet'),
    TranslatorEducationModel(
        school: 'G.E.C.',
        degree: 'B.E.',
        fieldOfStudy: 'Computer Engineering',
        startDate: DateTime(2021, 03),
        endDate: DateTime(2021, 03),
        grade: '7.4',
        activities: 'Lorem ipsum sit dollar amet',
        description: 'Lorem ipsum sit dollar amet - Lorem ipsum sit dollar amet'),
    TranslatorEducationModel(
        school: 'A.S.D.',
        degree: '12th',
        fieldOfStudy: 'Science',
        startDate: DateTime(2021, 03),
        endDate: DateTime(2021, 03),
        grade: '74',
        activities: 'Lorem ipsum sit dollar amet',
        description: 'Lorem ipsum sit dollar amet - Lorem ipsum sit dollar amet'),
  ];

  static List<TranslatorContractsModel> contractsModel = List.generate(
    25,
    (index) => TranslatorContractsModel(
      title: 'Contract $index',
      startDate: DateTime((1996 + index), index > 12 ? index - 12 : index, index),
      endDate: DateTime((1997 + index), index > 12 ? index - 12 : index, index),
      fromLanguage: 'Language $index',
      toLanguage: 'Language ${index + 1}',
      contractStatus: index % 3 == 0
          ? 'Active'
          : index % 3 == 1
              ? 'Paused'
              : 'Filed',
      contractBudget: '$index,000',
      speciality: 'Speciality $index',
      service: 'Interpretation',
      serviceType: 'Remotely through internet using Zoom, Teams, etc.',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque luctus tempor ultricies. Pellentesque tempus dictum molestie. Pellentesque non eros risus. Phasellus nec tempor velit. Nunc quis facilisis sem, a maximus nulla. Integer bibendum posuere lorem non consectetur. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Integer nunc tellus, placerat in odio eu, viverra suscipit massa. Proin eros nibh, fermentum in ornare in, tempus at est. Nullam aliquam ac odio id consequat. Ut id hendrerit turpis, vel rutrum quam. Pellentesque tincidunt neque eu lobortis lacinia',
      location: '3037 Windsor Meadow Ln, Matthews, NC 28105, USA',
      schedule: '03-02-2021 01:30 AM - 03-02-2021 02:30 AM',
      feedbackRating: 3,
      owner: 'Seth Kong',
    ),
  );

  static List<TranslatorEarningsModel> earnings = List.generate(
    4,
    (index) => TranslatorEarningsModel(
      description: 'This is the test description $index',
      paidOutDate: DateTime((2010 + index), index > 12 ? index - 12 : index, index),
      contractsModel: contractsModel[index],
      commission: '${15 + index}',
      amount: '${100 + index}',
    ),
  );

  static List<TranslatorEarningsHistoryModel> earningsHistory = List.generate(
    15,
    (index) => TranslatorEarningsHistoryModel(
        description: 'This is the test description $index',
        paidOutDate: DateTime((2010 + index), index > 12 ? index - 12 : index, index),
        contractsModel: contractsModel[index],
        commission: '${15 + index}',
        transactionDate: DateTime((2019 + index), index > 12 ? index - 12 : index, index),
        amount: '${100 + index}',
        paymentBy: 'User $index',
        amountPaid: '600'),
  );

  static List<String> taxClassification = [
    'Individual/Sole Proprietor or Single-member LLC',
    'Limited liability company',
    'C corporation',
    'S corporation',
    'Partnership',
    'Trust/estate',
    'Others',
  ];

  static List<String> taxPayer = [
    'Social Security Number(SSN)',
    'Employer Identification Number(EIN)',
  ];

  static List<String> yearList = ['2015', '2016', '2020', '2021'];

  static List<String> paymentType = [
    'Zelle',
    'PayPal',
    'Bank Transfer',
    'Cheque',
    'Money Order',
    'Debit Card'
  ];

  static List<String> languageList = [
    "English",
    "Spanish",
    "Italian",
    "Hindi",
    "Chinese",
    "Japanese",
    "Bengali",
    "Portuguese",
    "Russian",
    "Turkish",
    "Korean",
    "French",
    "Tamil",
    "Marathi",
    "Gujarati",
    "Polish",
    "Odia",
    "Dutch",
    "Thai"
  ];

  static List<TranslatorDetailsModel> translatorList = [
    TranslatorDetailsModel(
        'Test-English', '', 'English', 'This is the test', '699ea2a1-720c-4450-8d6d-1b52eb4b6cb5'),
    TranslatorDetailsModel('SpanishTranslator', '', 'Spanish', 'This is the test', 'TestTraUser2'),
    TranslatorDetailsModel('ItalianTranslator', '', 'Italian', 'This is the test', 'TestTraUser3'),
    TranslatorDetailsModel(
        'TestUser', '', 'English', 'This is the test', '1858f676-bd75-46a0-b0a8-a5b1346954da'),
    TranslatorDetailsModel(
        'TestUSer2', '', 'English', 'This is the test', '9f4cbba7-db2a-48ca-97ee-938f6228d9ec'),
    TranslatorDetailsModel('TestUSer3', '', 'English', 'This is the test', 'Chetna_Patel'),
  ];
}
