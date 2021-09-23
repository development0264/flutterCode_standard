import 'dart:convert';

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

  /// Function which checks the amount in between
  static bool checkIfAmountInBetween(String startAmount, String endAmount, String amount) {
    return double.parse(amount) > double.parse(startAmount) &&
        double.parse(amount) < double.parse(endAmount);
  }

  /// Function which checks the amount in between
  static bool checkIfDateInBetween(DateTime startDate, DateTime endDate, DateTime date) {
    return date.isAfter(startDate) && date.isBefore(endDate);
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


}
