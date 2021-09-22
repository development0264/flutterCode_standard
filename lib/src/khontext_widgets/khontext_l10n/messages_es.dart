// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a es locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'es';

  static m0(max) => "El valor debe ser menor o igual que ${max}.";

  static m1(maxLength) => "El valor debe tener una longitud menor o igual a ${maxLength}";

  static m2(min) => "El valor debe ser mayor o igual que ${min}.";

  static m3(minLength) => "El valor debe tener una longitud mayor o igual a ${minLength}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "appNameText" : MessageLookupByLibrary.simpleMessage("Khontext"),

    // Validations
    "creditCardErrorText" : MessageLookupByLibrary.simpleMessage("Este campo requiere un número de tarjeta de crédito válido."),
    "dateStringErrorText" : MessageLookupByLibrary.simpleMessage("Este campo requiere una cadena de fecha válida."),
    "emailErrorText" : MessageLookupByLibrary.simpleMessage("Este campo requiere una dirección de correo electrónico válida."),
    "ipErrorText" : MessageLookupByLibrary.simpleMessage("Este campo requiere una IP válida."),
    "matchErrorText" : MessageLookupByLibrary.simpleMessage("El valor no coincide con el patrón requerido."),
    "maxErrorText" : m0,
    "maxLengthErrorText" : m1,
    "minErrorText" : m2,
    "minLengthErrorText" : m3,
    "numericErrorText" : MessageLookupByLibrary.simpleMessage("El valor debe ser numérico."),
    "requiredErrorText" : MessageLookupByLibrary.simpleMessage("Este campo no puede estar vacío."),
    "urlErrorText" : MessageLookupByLibrary.simpleMessage("Este campo requiere una dirección URL válida."),

    "emptyUsernameErrorText":MessageLookupByLibrary.simpleMessage("El nombre de usuario no puede estar vacío."),
    "emptyPasswordErrorText":MessageLookupByLibrary.simpleMessage("La contraseña no puede estar vacía."),
    "passwordLengthErrorText":MessageLookupByLibrary.simpleMessage("La contraseña debe tener más de 6 caracteres."),
    "emptyFirstNameErrorText":MessageLookupByLibrary.simpleMessage("El nombre no puede estar vacío."),
    "emptyMiddleNameErrorText":MessageLookupByLibrary.simpleMessage("El segundo nombre no puede estar vacío."),
    "emptyLastNameErrorText":MessageLookupByLibrary.simpleMessage("LastName no puede estar vacío."),
    "emptyPhoneNumberErrorText":MessageLookupByLibrary.simpleMessage("El número de teléfono no puede estar vacío."),
    "emptyEmailErrorText":MessageLookupByLibrary.simpleMessage("El correo electrónico no puede estar vacío."),
    "emailValidationErrorText":MessageLookupByLibrary.simpleMessage("El correo electrónico no es correcto."),
    "emptyConfirmPasswordErrorText":MessageLookupByLibrary.simpleMessage("La contraseña de confirmación no puede estar vacía."),
    "confirmPasswordValidationErrorText":MessageLookupByLibrary.simpleMessage("Las contraseñas no coinciden."),

    "emptyCountryErrorText":MessageLookupByLibrary.simpleMessage("El país no puede estar vacío."),
    "emptyZipErrorText":MessageLookupByLibrary.simpleMessage("El código postal no puede estar vacío."),
    "emptyAddressErrorText":MessageLookupByLibrary.simpleMessage("La dirección no puede estar vacía."),
    "emptyCityErrorText":MessageLookupByLibrary.simpleMessage("La ciudad no puede estar vacía."),
    "emptyTaxIdErrorText":MessageLookupByLibrary.simpleMessage("El número de identificación fiscal no puede estar vacío."),
    "countryCodeErrorText":MessageLookupByLibrary.simpleMessage("Seleccione el código de país."),
    "countryErrorText":MessageLookupByLibrary.simpleMessage("Por favor seleccione país."),
    "stateErrorText":MessageLookupByLibrary.simpleMessage("Seleccione el estado."),
    "timezoneErrorText":MessageLookupByLibrary.simpleMessage("Seleccione la zona horaria adecuada."),
    "dateValidationErrorText":MessageLookupByLibrary.simpleMessage("The start date should not be after end date."),
    "startDateErrorText":MessageLookupByLibrary.simpleMessage("Start date cannot be empty"),
    "endDateErrorText":MessageLookupByLibrary.simpleMessage("End date cannot be empty"),
    "addAllDetailsErrorText":MessageLookupByLibrary.simpleMessage("Primero agregue todos los datos"),

    // Sign in
    "seeYouBackText":MessageLookupByLibrary.simpleMessage("Un gusto de verte de nuevo"),
    "signInTitleText":MessageLookupByLibrary.simpleMessage("Inicie sesión en su cuenta"),
    "userNameHintText":MessageLookupByLibrary.simpleMessage("Correo electrónico"),
    "passwordHintText":MessageLookupByLibrary.simpleMessage("Contraseña"),
    "continueBtnText":MessageLookupByLibrary.simpleMessage("Seguir"),
    "noAccountText":MessageLookupByLibrary.simpleMessage("Aún no tienes la cuenta?"),
    "signUpText":MessageLookupByLibrary.simpleMessage("Contratar"),
    "rememberMeText":MessageLookupByLibrary.simpleMessage("Acuérdate de mí"),
    "noUserText":MessageLookupByLibrary.simpleMessage("Usuario no encontrado"),
    "forgetPasswordText":MessageLookupByLibrary.simpleMessage("Se te olvidó tu contraseña?"),
    "orConnectUsingText":MessageLookupByLibrary.simpleMessage("O conéctese usando"),

    // Verify identity
    "didNotReceivedCodeText":MessageLookupByLibrary.simpleMessage("Aún no has recibido un código?"),
    "resendCodeText":MessageLookupByLibrary.simpleMessage("Reenviar codigo"),
    "resendInText":MessageLookupByLibrary.simpleMessage("Reenviar en"),
    "enterCodeText":MessageLookupByLibrary.simpleMessage("Introduzca el código"),
    "enterCodeErrorText":MessageLookupByLibrary.simpleMessage("Por favor ingrese el codigo"),
    "codeSentText":MessageLookupByLibrary.simpleMessage("Enviamos un código a su número de teléfono y correo electrónico."),
    "verifyIdentityText":MessageLookupByLibrary.simpleMessage("Verifique por favor su Identidad"),
    "sendCodeErrorText":MessageLookupByLibrary.simpleMessage("No se pudo enviar el código. Vuelve a intentarlo más tarde."),
    "verifyUserErrorText":MessageLookupByLibrary.simpleMessage("No se puede verificar al usuario, inténtelo de nuevo más tarde."),

    // Forget password
    "restorePasswordText":MessageLookupByLibrary.simpleMessage("No se preocupe, lo ayudaremos a restaurarlo."),
    "emailPhoneText":MessageLookupByLibrary.simpleMessage("Correo electrónico o número de teléfono"),
    "emailPhoneErrorText":MessageLookupByLibrary.simpleMessage("Ingrese correo electrónico o número de teléfono"),
    "neverMindText":MessageLookupByLibrary.simpleMessage("¡No importa!"),
    "goBackText":MessageLookupByLibrary.simpleMessage("Regresa"),

    // Reset password
    "changePasswordText":MessageLookupByLibrary.simpleMessage("cambia tu contraseña"),
    "enterNewPasswordText":MessageLookupByLibrary.simpleMessage("Por favor ingrese nueva contraseña"),
    "saveBtnText":MessageLookupByLibrary.simpleMessage("Guardar e iniciar sesión"),
    "resetLinkErrorText":MessageLookupByLibrary.simpleMessage("No se puede enviar el enlace de restablecimiento. Vuelva a intentarlo más tarde."),
    "clickOnLinkText":MessageLookupByLibrary.simpleMessage("Haga clic en el enlace enviado en su correo electrónico registrado."),
    "resetPasswordErrorText":MessageLookupByLibrary.simpleMessage("No se puede enviar el enlace de restablecimiento. Vuelva a intentarlo más tarde."),
    "cannotResetErrorText":MessageLookupByLibrary.simpleMessage("No se puede restablecer la contraseña, inténtelo de nuevo más tarde."),
    "passwordResetSuccessText":MessageLookupByLibrary.simpleMessage("Se restableció su contraseña, inicie sesión nuevamente."),

    // Sign up
    "signUpTitleText":MessageLookupByLibrary.simpleMessage("Crea tu cuenta"),
    "firstNameHintText":MessageLookupByLibrary.simpleMessage("Primer nombre"),
    "middleNameHintText":MessageLookupByLibrary.simpleMessage("Segundo nombre"),
    "lastNameHintText":MessageLookupByLibrary.simpleMessage("Apellido"),
    "phoneNumberHintText":MessageLookupByLibrary.simpleMessage("Número de teléfono"),
    "emailHintText":MessageLookupByLibrary.simpleMessage("Correo electrónico"),
    "confirmPasswordHintText":MessageLookupByLibrary.simpleMessage("confirmar Contraseña"),
    "promoCodeHintText":MessageLookupByLibrary.simpleMessage("Codigo promocional (Opcional)"),
    "alreadyAccountText":MessageLookupByLibrary.simpleMessage("Ya tienes una cuenta?"),
    "signInText":MessageLookupByLibrary.simpleMessage("Registrarse"),
    "enterFullNameText":MessageLookupByLibrary.simpleMessage("Por favor ingresa tu nombre completo"),
    "enterEmailText":MessageLookupByLibrary.simpleMessage("Por favor ingrese su correo electrónico"),
    "confirmEmailText":MessageLookupByLibrary.simpleMessage("Confirmar correo electrónico"),
    "validateEmailsText":MessageLookupByLibrary.simpleMessage("Los correos electrónicos no coinciden."),
    "validateEmailDisplayText":MessageLookupByLibrary.simpleMessage("Por favor revise su correo electrónico para validar su correo electrónico"),
    "validateCodeText":MessageLookupByLibrary.simpleMessage("Código de validación de correo electrónico"),
    "emptyValidationCodeErrorText":MessageLookupByLibrary.simpleMessage("El código de validación de correo electrónico no puede estar vacío."),
    "phoneNumberDisplayText":MessageLookupByLibrary.simpleMessage("Por favor, introduzca su número de teléfono"),
    "phoneNumberValidationDisplayText":MessageLookupByLibrary.simpleMessage("Ingrese el código de validación de su teléfono"),
    "phoneNumberValidationCodeText":MessageLookupByLibrary.simpleMessage("Código de validación del teléfono"),
    "emptyPhoneValidationCodeErrorText":MessageLookupByLibrary.simpleMessage("El código de validación del teléfono no puede estar vacío."),
    "userNameText":MessageLookupByLibrary.simpleMessage("Nombre de usuario"),
    "userDetailsText":MessageLookupByLibrary.simpleMessage("Ingrese los datos del usuario"),
    "translatorQuestionText":MessageLookupByLibrary.simpleMessage("Estás buscando trabajar como traductor?"),
    "hireQuestionText":MessageLookupByLibrary.simpleMessage("Está buscando contratar un traductor?"),
    "yesText":MessageLookupByLibrary.simpleMessage("SÍ"),
    "noText":MessageLookupByLibrary.simpleMessage("NO"),
    "selectValueText":MessageLookupByLibrary.simpleMessage("Por favor seleccione el valor"),
    "promoCodeDisplayText":MessageLookupByLibrary.simpleMessage("Ingrese el código promocional"),
    "enterProperCodeText":MessageLookupByLibrary.simpleMessage("Ingrese el código correcto."),
    "userCreated":MessageLookupByLibrary.simpleMessage("Usuario creada con éxito."),
    "createAccountText":MessageLookupByLibrary.simpleMessage("Crea una cuenta"),
    "createAccountRequestText":MessageLookupByLibrary.simpleMessage("Por favor crea una cuenta"),
    "iAgreeText":MessageLookupByLibrary.simpleMessage("Estoy de acuerdo con el "),
    "termsAndServicesText":MessageLookupByLibrary.simpleMessage("Términos de servicio"),
    "andText":MessageLookupByLibrary.simpleMessage(" y "),
    "privacyPolicyText":MessageLookupByLibrary.simpleMessage("Política de privacidad."),
    "signInNowText":MessageLookupByLibrary.simpleMessage("Regístrate"),
    "checkTermsText":MessageLookupByLibrary.simpleMessage("Consulte los términos y condiciones."),
    "welcomeText":MessageLookupByLibrary.simpleMessage("Bienvenido a Khontext!"),
    "emailConfirmText":MessageLookupByLibrary.simpleMessage("por favor, confirma tu email"),
    "emailSentText":MessageLookupByLibrary.simpleMessage("Correo electrónico enviado correctamente."),
    "phoneConfirmText":MessageLookupByLibrary.simpleMessage("Por favor, introduzca su número de teléfono"),
    "verifyPhoneSecurityText":MessageLookupByLibrary.simpleMessage("Para aumentar su seguridad, enviamos un código a su número de teléfono:"),
    "translatorText":MessageLookupByLibrary.simpleMessage("Traductor"),
    "hireText":MessageLookupByLibrary.simpleMessage("Contratar"),
    "chooseRoleText":MessageLookupByLibrary.simpleMessage("Por favor, elija su rol"),
    "finishText":MessageLookupByLibrary.simpleMessage("Terminar"),
    "createAccountErrorText":MessageLookupByLibrary.simpleMessage("Error al enviar el código de verificación por correo electrónico."),
    "enterCorrectCodeErrorText":MessageLookupByLibrary.simpleMessage("Ingrese el código correcto"),
    "checkNumberErrorText":MessageLookupByLibrary.simpleMessage("Error al verificar el número de teléfono"),
    "verifyNumberErrorText":MessageLookupByLibrary.simpleMessage("Error al verificar el número de teléfono"),
    "completeProfileErrorText":MessageLookupByLibrary.simpleMessage("Error al obtener el perfil completo"),

    // Welcome screen
    "goNextText":MessageLookupByLibrary.simpleMessage("Siguiente"),
    "collectInfoText":MessageLookupByLibrary.simpleMessage("Recopilamos información para que pueda convertirse en un traductor profesional. Responda todas las preguntas antes de empezar a trabajar, ¡esto es muy importante para nosotros!"),
    "needToKnowText":MessageLookupByLibrary.simpleMessage("Necesitas saber"),
    "needToKnow1Text":MessageLookupByLibrary.simpleMessage("Pensamos en su valioso tiempo, toda la información se agregará automáticamente a su perfil:"),
    "needToKnow2Text":MessageLookupByLibrary.simpleMessage("Procesamos sus datos personales solo para fines predefinidos y legales:"),
    "needToKnow3Text":MessageLookupByLibrary.simpleMessage("Procesamos los datos personales necesarios para prevenir o detectar el blanqueo de capitales y la financiación del terrorismo, así como los datos personales necesarios para cumplir con las sanciones comerciales, siempre de acuerdo con la legislación local."),

    // Get started screen
    "getStartedText":MessageLookupByLibrary.simpleMessage("Estas listo para empezar?"),
    "getStartedInfoText":MessageLookupByLibrary.simpleMessage("Para convertirse en un traductor verificado en la plataforma Khontext, lo guiaremos a través del proceso de incorporación. Solo toma unos minutos hacerlo."),
    "onBoardingText":MessageLookupByLibrary.simpleMessage("Empezar a incorporar"),

    // Welcome back screen
    "welcomeBackText":MessageLookupByLibrary.simpleMessage("Bienvenido de nuevo,"),
    "welcomeBackInfoText":MessageLookupByLibrary.simpleMessage("¿Le gustaría continuar donde lo dejó?"),

    // On boarding address
    "addressServicesText":MessageLookupByLibrary.simpleMessage("Dirección y servicio"),
    "yourAddressText":MessageLookupByLibrary.simpleMessage("Cual es tu dirección?"),
    "yourTranslationText":MessageLookupByLibrary.simpleMessage("Qué tipo de traducción harás?"),
    "yourRatesText":MessageLookupByLibrary.simpleMessage("Cuáles son sus tarifas?"),
    "hourlyRateText":MessageLookupByLibrary.simpleMessage("Tarifa por hora"),
    "hourlyRateErrorText":MessageLookupByLibrary.simpleMessage("La tarifa por hora no puede estar vacía."),
    "ratePerPageText":MessageLookupByLibrary.simpleMessage("Tarifa por página"),
    "ratePerPageErrorText":MessageLookupByLibrary.simpleMessage("La tarifa por página no puede estar vacía."),
    "gasText":MessageLookupByLibrary.simpleMessage("Tasa de gas por milla / km"),
    "gasErrorText":MessageLookupByLibrary.simpleMessage("La tasa de gasolina por milla / km no puede estar vacía."),
    "nextStepText":MessageLookupByLibrary.simpleMessage("Próximo paso"),
    "streetAddressErrorText":MessageLookupByLibrary.simpleMessage("La dirección postal es obligatoria."),
    "loginFirstText":MessageLookupByLibrary.simpleMessage("Por favor ingresa primero"),
    "onBoardingErrorText":MessageLookupByLibrary.simpleMessage("No se pueden cargar los datos de embarque"),
    "jobServicesErrorText":MessageLookupByLibrary.simpleMessage("No se pueden cargar los servicios de trabajo"),
    "addUpdateAddressErrorText":MessageLookupByLibrary.simpleMessage("No se pueden agregar / actualizar la dirección y los servicios de embarque"),

    // On boarding language
    "languagesText":MessageLookupByLibrary.simpleMessage("Idiomas"),
    "languagesPossessText":MessageLookupByLibrary.simpleMessage("¿Qué idiomas posees?"),
    "selectLanguageText":MessageLookupByLibrary.simpleMessage("Seleccione un idioma e indique el área de especialización y el nivel de competencia que tiene."),
    "levelProficiencyText":MessageLookupByLibrary.simpleMessage("Nivel de competencia"),
    "levelSpecializationText":MessageLookupByLibrary.simpleMessage("Especialización en idiomas"),
    "selectedText":MessageLookupByLibrary.simpleMessage("Seleccionado"),
    "languageErrorText":MessageLookupByLibrary.simpleMessage("Por favor, seleccione un idioma."),
    "proficiencyErrorText":MessageLookupByLibrary.simpleMessage("Seleccione una competencia."),
    "specializationErrorText":MessageLookupByLibrary.simpleMessage("Seleccione al menos una especialización."),
    "clickLanguageText":MessageLookupByLibrary.simpleMessage("Haga clic en \"Agregar idioma \" si conoce más idiomas"),
    "addLanguageText":MessageLookupByLibrary.simpleMessage("Agregar idioma"),
    "languageEssentialsErrorText":MessageLookupByLibrary.simpleMessage("Error al obtener los conceptos básicos del idioma"),
    "languageAddErrorText":MessageLookupByLibrary.simpleMessage("Error al agregar el idioma"),
    "languageDeleteErrorText":MessageLookupByLibrary.simpleMessage("Error al eliminar el idioma"),

    // On boarding education
    "educationTellText":MessageLookupByLibrary.simpleMessage("Cuenta como tu educación"),
    "schoolText":MessageLookupByLibrary.simpleMessage("Colegio"),
    "schoolErrorText":MessageLookupByLibrary.simpleMessage("Por favor ingrese a la escuela"),
    "degreeText":MessageLookupByLibrary.simpleMessage("La licenciatura"),
    "degreeErrorText":MessageLookupByLibrary.simpleMessage("Por favor ingrese el grado"),
    "fieldOfStudyText":MessageLookupByLibrary.simpleMessage("Campo de estudio"),
    "fieldOfStudyErrorText":MessageLookupByLibrary.simpleMessage("Por favor ingrese Campo de estudio"),
    "gradeText":MessageLookupByLibrary.simpleMessage("Calificación"),
    "gradeErrorText":MessageLookupByLibrary.simpleMessage("Por favor ingrese el grado"),
    "activitiesText":MessageLookupByLibrary.simpleMessage("Ocupaciones"),
    "activitiesErrorText":MessageLookupByLibrary.simpleMessage("Por favor ingrese Actividades"),
    "descriptionText":MessageLookupByLibrary.simpleMessage("Descripción"),
    "descriptionErrorText":MessageLookupByLibrary.simpleMessage("Por favor ingrese una descripción"),
    "applyText":MessageLookupByLibrary.simpleMessage("Solicitar"),
    "startDateYearText":MessageLookupByLibrary.simpleMessage("Mes y año de inicio"),
    "endDateYearText":MessageLookupByLibrary.simpleMessage("Mes y año de finalización"),
    "studyHereText":MessageLookupByLibrary.simpleMessage("Estudio aqui ahora"),
    "activitiesAndSocietiesText":MessageLookupByLibrary.simpleMessage("Actividades y sociedades"),
    "attachmentsText":MessageLookupByLibrary.simpleMessage("Archivos adjuntos"),
    "addDocumentText":MessageLookupByLibrary.simpleMessage("Agregar nuevo documento"),
    "titleDescriptionText":MessageLookupByLibrary.simpleMessage("Título y descripción"),
    "selectDocumentText":MessageLookupByLibrary.simpleMessage("Seleccione el documento."),
    "addEducationText":MessageLookupByLibrary.simpleMessage("Agregar educación"),
    "addEducationErrorText":MessageLookupByLibrary.simpleMessage("Error al agregar la educación"),
    "deleteEducationErrorText":MessageLookupByLibrary.simpleMessage("Error al eliminar la educación"),

    // On boarding experience
    "experienceText":MessageLookupByLibrary.simpleMessage("Experiencia"),
    "addExperienceText":MessageLookupByLibrary.simpleMessage("Agregar experiencia"),
    "companyTitleText":MessageLookupByLibrary.simpleMessage("Compañía"),
    "employmentTypeText":MessageLookupByLibrary.simpleMessage("Tipo de empleo"),
    "employmentTypeErrorText":MessageLookupByLibrary.simpleMessage("Seleccione el tipo de empleo"),
    "locationText":MessageLookupByLibrary.simpleMessage("Localización"),
    "locationErrorText":MessageLookupByLibrary.simpleMessage("Ingrese la ubicación."),

    // Profile
    "profileTitleText":MessageLookupByLibrary.simpleMessage("Perfil"),
    "cancelText":MessageLookupByLibrary.simpleMessage("Cancelar"),
    "saveText":MessageLookupByLibrary.simpleMessage("Salvar"),
    "accountTitleText":MessageLookupByLibrary.simpleMessage("Cuenta"),
    "contactTitleText":MessageLookupByLibrary.simpleMessage("Contacto"),
    "companyNameText":MessageLookupByLibrary.simpleMessage("nombre de empresa"),
    "companyWebUrlText":MessageLookupByLibrary.simpleMessage("URL web de la empresa"),
    "companyTagLineText":MessageLookupByLibrary.simpleMessage("Lema de la empresa"),
    "companyDescriptionText":MessageLookupByLibrary.simpleMessage("Descripción de la compañía"),
    "ownerText":MessageLookupByLibrary.simpleMessage("Dueño"),
    "phoneText":MessageLookupByLibrary.simpleMessage("Teléfono"),
    "addressText":MessageLookupByLibrary.simpleMessage("Dirección"),
    "timeZoneText":MessageLookupByLibrary.simpleMessage("Zona horaria"),
    "taxIdText":MessageLookupByLibrary.simpleMessage("Identificación del impuesto"),
    "zipText":MessageLookupByLibrary.simpleMessage("Cremallera"),
    "address2Text":MessageLookupByLibrary.simpleMessage("Línea de dirección 2"),
    "cityText":MessageLookupByLibrary.simpleMessage("Ciudad"),
    "selectTypeText":MessageLookupByLibrary.simpleMessage("Seleccione tipo"),
    "cameraText":MessageLookupByLibrary.simpleMessage("Cámara"),
    "galleryText":MessageLookupByLibrary.simpleMessage("Galería"),
    "dataLoadText":MessageLookupByLibrary.simpleMessage("No se pueden cargar los datos, inténtelo de nuevo después de iniciar sesión."),
    "addressLoadText":MessageLookupByLibrary.simpleMessage("No se encontraron datos de contacto del usuario"),
    "imageSetText":MessageLookupByLibrary.simpleMessage("Imagen no configurada"),
    "addCompanyText":MessageLookupByLibrary.simpleMessage("Agregar datos de la empresa"),
    "companyDataNoText":MessageLookupByLibrary.simpleMessage("Datos de la empresa no encontrados"),
    "addContactText":MessageLookupByLibrary.simpleMessage("Agregar datos de contacto"),

    // Payment
    "paymentTitleText":MessageLookupByLibrary.simpleMessage("Facturación y pagos"),
    "balanceDueText":MessageLookupByLibrary.simpleMessage("Saldo adeudado"),
    "paymentMethodsText":MessageLookupByLibrary.simpleMessage("Métodos de pago"),
    "paymentHistoryText":MessageLookupByLibrary.simpleMessage("historial de pagos"),
    "addMethodText":MessageLookupByLibrary.simpleMessage("Agregar método"),
    "payNowText":MessageLookupByLibrary.simpleMessage("Pagar ahora"),
    "nameText":MessageLookupByLibrary.simpleMessage("Nombre"),
    "amountText":MessageLookupByLibrary.simpleMessage("Cantidad"),
    "paidDateText":MessageLookupByLibrary.simpleMessage("Fecha de pago"),
    "statusText":MessageLookupByLibrary.simpleMessage("Estado"),
    "updateText":MessageLookupByLibrary.simpleMessage("Actualizar"),
    "editText":MessageLookupByLibrary.simpleMessage("Editar"),
    "deleteText":MessageLookupByLibrary.simpleMessage("Borrar"),
    "cardEndingText":MessageLookupByLibrary.simpleMessage("Tarjeta terminada en"),
    "cardHolderText":MessageLookupByLibrary.simpleMessage("Titular de la tarjeta"),
    "cardNumberText":MessageLookupByLibrary.simpleMessage("Número de tarjeta"),
    "cardExpiryText":MessageLookupByLibrary.simpleMessage("fecha de expiración de la tarjeta"),
    "paymentText":MessageLookupByLibrary.simpleMessage("Pagos"),
    "addAddressText":MessageLookupByLibrary.simpleMessage("Añadir dirección"),
    "addressLine1Text":MessageLookupByLibrary.simpleMessage("Dirección Línea 1"),
    "addressLine2Text":MessageLookupByLibrary.simpleMessage("Línea de dirección 2"),
    "addNewAddressText":MessageLookupByLibrary.simpleMessage("Agregar nueva dirección"),
    "editAddressText":MessageLookupByLibrary.simpleMessage("Editar dirección"),
    "updateAddressText":MessageLookupByLibrary.simpleMessage("Actualizar dirección"),
    "changeAddressText":MessageLookupByLibrary.simpleMessage("Por favor cambie la dirección"),
    "noPaymentMethodText":MessageLookupByLibrary.simpleMessage("No se agregaron métodos de pago"),
    "addCardDetailsText":MessageLookupByLibrary.simpleMessage("Primero agregue los detalles de la tarjeta"),
    "addCardAddressText":MessageLookupByLibrary.simpleMessage("Agregue los detalles de la dirección de la tarjeta"),
    "tokenGenerateErrorText":MessageLookupByLibrary.simpleMessage("No se pudo generar el token de pago"),

    // Posted jobs
    "postedJobsText":MessageLookupByLibrary.simpleMessage("Empleos publicados"),
    "searchJobsText":MessageLookupByLibrary.simpleMessage("Buscar empleos"),
    "searchText":MessageLookupByLibrary.simpleMessage("Buscar"),
    "serviceText":MessageLookupByLibrary.simpleMessage("Servicio"),
    "serviceTypeText":MessageLookupByLibrary.simpleMessage("Tipo de servicio"),
    "jobStatusText":MessageLookupByLibrary.simpleMessage("Estado del trabajo"),
    "selectServiceText":MessageLookupByLibrary.simpleMessage("Seleccionar servicio"),
    "selectServiceTypeText":MessageLookupByLibrary.simpleMessage("Seleccione el tipo de servicio"),
    "selectJobStatusText":MessageLookupByLibrary.simpleMessage("Seleccionar estado del trabajo"),
    "filterText":MessageLookupByLibrary.simpleMessage("Filtrar"),

    //Posted job details
    "jobsDetailsText":MessageLookupByLibrary.simpleMessage("Detalles del trabajo"),
    "titleText":MessageLookupByLibrary.simpleMessage("Título"),
    "languageText":MessageLookupByLibrary.simpleMessage("Idioma"),
    "sourceLanguageText":MessageLookupByLibrary.simpleMessage("Lenguaje fuente"),
    "destinationLanguageText":MessageLookupByLibrary.simpleMessage("Idioma de destino"),
    "specializationsText":MessageLookupByLibrary.simpleMessage("Especializaciones"),
    "placeText":MessageLookupByLibrary.simpleMessage("Sitio"),
    "visibilityText":MessageLookupByLibrary.simpleMessage("Visibilidad"),
    "boundaryText":MessageLookupByLibrary.simpleMessage("Perímetro"),
    "specialityText":MessageLookupByLibrary.simpleMessage("Especialidad"),
    "proficiencyText":MessageLookupByLibrary.simpleMessage("Competencia"),
    "ratingsText":MessageLookupByLibrary.simpleMessage("Calificaciones"),
    "reviewsText":MessageLookupByLibrary.simpleMessage("Reseñas"),
    "scheduleText":MessageLookupByLibrary.simpleMessage("Calendario"),
    "fromText":MessageLookupByLibrary.simpleMessage("Desde"),
    "toText":MessageLookupByLibrary.simpleMessage("A"),
    "filtersText":MessageLookupByLibrary.simpleMessage("Filtros"),
    "jobTypeText":MessageLookupByLibrary.simpleMessage("El tipo de trabajo"),

    // Payment history
    "searchPaymentText":MessageLookupByLibrary.simpleMessage("Pago de búsqueda"),
    "paidOnStartText":MessageLookupByLibrary.simpleMessage("Pagado en la fecha de inicio"),
    "paidOnEndText":MessageLookupByLibrary.simpleMessage("Pagado en la fecha de finalización"),
    "paymentAmountText":MessageLookupByLibrary.simpleMessage("Monto del pago"),

    // Post a job - description
    "backText":MessageLookupByLibrary.simpleMessage("ESPALDA"),
    "continueText":MessageLookupByLibrary.simpleMessage("SEGUIR"),
    "titleEmptyErrorText":MessageLookupByLibrary.simpleMessage("Ingrese el título"),
    "descEmptyErrorText":MessageLookupByLibrary.simpleMessage("Se requiere una descripción."),
    "imagesText":MessageLookupByLibrary.simpleMessage("Imágenes (opcional)"),
    "pickImageText":MessageLookupByLibrary.simpleMessage("+ Elegir varios"),
    "noImageSelectedText":MessageLookupByLibrary.simpleMessage("No hay imágenes seleccionadas"),
    "allPhotosText":MessageLookupByLibrary.simpleMessage("Todas las fotos"),
    "selectServiceErrorText":MessageLookupByLibrary.simpleMessage("Por favor seleccione servicio"),
    "serviceFetchErrorText":MessageLookupByLibrary.simpleMessage("No se pueden recuperar los servicios"),

    // Post a job - language
    "fromLanguageText":MessageLookupByLibrary.simpleMessage("Del idioma"),
    "emptyFromLangErrorText":MessageLookupByLibrary.simpleMessage("Por favor ingrese desde el idioma"),
    "toLanguageText":MessageLookupByLibrary.simpleMessage("Al idioma"),
    "emptyToLangErrorText":MessageLookupByLibrary.simpleMessage("Por favor ingrese al idioma"),
    "specializationText":MessageLookupByLibrary.simpleMessage("Especialización"),
    "selectSpecializationsErrorText":MessageLookupByLibrary.simpleMessage("Seleccione especializaciones"),

    // Post a job - visibility
    "selectCountryText":MessageLookupByLibrary.simpleMessage("Seleccionar país"),
    "languageSpecialityText":MessageLookupByLibrary.simpleMessage("Especialidad en Idiomas"),
    "selectLanguageSpecErrorText":MessageLookupByLibrary.simpleMessage("Seleccione la especialidad de idioma"),
    "selectProficiencyErrorText":MessageLookupByLibrary.simpleMessage("Por favor seleccione competencia"),
    "selectExperienceErrorText":MessageLookupByLibrary.simpleMessage("Por favor ingrese experiencia"),
    "selectRatingsErrorText":MessageLookupByLibrary.simpleMessage("Por favor ingrese calificaciones"),
    "selectReviewsErrorText":MessageLookupByLibrary.simpleMessage("Por favor ingrese reseñas"),

    // Post a job - location
    "streetAddressText":MessageLookupByLibrary.simpleMessage("Dirección"),
    "stateProvinceRegionText":MessageLookupByLibrary.simpleMessage("Estado / Provincia / Región"),
    "stateProvinceRegionErrorText":MessageLookupByLibrary.simpleMessage("Se requiere estado / provincia / región."),
    "postalZipText":MessageLookupByLibrary.simpleMessage("Código postal"),
    "postalZipErrorText":MessageLookupByLibrary.simpleMessage("Se requiere el código postal."),
    "countryText":MessageLookupByLibrary.simpleMessage("País"),

    // Post a job - schedule
    "startDateTimeText":MessageLookupByLibrary.simpleMessage("Desde DateTime"),
    "endDateTimeText":MessageLookupByLibrary.simpleMessage("Hasta la fecha"),
    "noScheduleText":MessageLookupByLibrary.simpleMessage("No se agregó ningún horario"),
    "noReviewText":MessageLookupByLibrary.simpleMessage("No hay revisión disponible"),
    "addScheduleText":MessageLookupByLibrary.simpleMessage("Agregar horario"),
    "startDateText":MessageLookupByLibrary.simpleMessage("Fecha de inicio :"),
    "endDateText":MessageLookupByLibrary.simpleMessage("Fecha final :"),
    "properDateText":MessageLookupByLibrary.simpleMessage("Seleccione las fechas adecuadas"),

    // Translator profile
    "translatorProfileText":MessageLookupByLibrary.simpleMessage("Informacion personal"),

    // Translator language
    "updateLanguageText":MessageLookupByLibrary.simpleMessage("Actualizar idioma"),

    // Translator experience
    "updateExperienceText":MessageLookupByLibrary.simpleMessage("Experiencia de actualización"),
    "companyNameErrorText":MessageLookupByLibrary.simpleMessage("Introduzca el nombre de la empresa."),
    "fromErrorText":MessageLookupByLibrary.simpleMessage("Por favor ingrese desde la fecha."),
    "toErrorText":MessageLookupByLibrary.simpleMessage("Ingrese hasta la fecha."),
    "currentlyWorkingText":MessageLookupByLibrary.simpleMessage("Actualmente trabajando en este rol"),
    "presentText":MessageLookupByLibrary.simpleMessage("Regalo"),
    "noExperienceText":MessageLookupByLibrary.simpleMessage("Sin experiencia agregada"),

    // Translator education
    "educationText":MessageLookupByLibrary.simpleMessage("Educación"),
    "updateEducationText":MessageLookupByLibrary.simpleMessage("Actualizar educación"),
    "noEducationText":MessageLookupByLibrary.simpleMessage("No se agregó educación"),

    // Translator identification
    "additionalDisclosures":MessageLookupByLibrary.simpleMessage("Divulgaciones adicionales"),
    "hideDisclosures":MessageLookupByLibrary.simpleMessage("Ocultar divulgaciones"),
    "requiredText":MessageLookupByLibrary.simpleMessage("Se requieren al menos dos formas de identificación con foto del gobierno. *"),
    "authText":MessageLookupByLibrary.simpleMessage("RECONOCIMIENTO Y AUTORIZACIÓN PARA VERIFICACIÓN DE ANTECEDENTES"),
    "agreeText":MessageLookupByLibrary.simpleMessage("Estoy de acuerdo y reconozco"),
    "uploadText":MessageLookupByLibrary.simpleMessage("Subir"),
    "uploadTwoText":MessageLookupByLibrary.simpleMessage("Cargue dos formas de identificación con fotografías"),
    "chooseText":MessageLookupByLibrary.simpleMessage("Escoger"),

    // Translator jobs
    "sendMessageText":MessageLookupByLibrary.simpleMessage("Enviar un mensaje"),
    "copyLinkText":MessageLookupByLibrary.simpleMessage("Copiar link"),

    // Translator contracts
    "sendContractMessageText":MessageLookupByLibrary.simpleMessage("Enviar un mensaje"),
    "proposeText":MessageLookupByLibrary.simpleMessage("Proponer nuevo contrato"),
    "searchContractText":MessageLookupByLibrary.simpleMessage("Contratos de búsqueda"),

    // Translator contracts details
    "contractDetailsText":MessageLookupByLibrary.simpleMessage("Detalles del contrato"),
    "byText":MessageLookupByLibrary.simpleMessage("Por"),
    "budgetText":MessageLookupByLibrary.simpleMessage("Presupuesto"),
    "feedbackText":MessageLookupByLibrary.simpleMessage("Realimentación"),

    // Translator schedule
    "noEventsText":MessageLookupByLibrary.simpleMessage("No hay eventos para el día."),

    // Translator earnings
    "commissionText":MessageLookupByLibrary.simpleMessage("Comisión"),
    "paidOutText":MessageLookupByLibrary.simpleMessage("Pagado"),
    "earningsText":MessageLookupByLibrary.simpleMessage("Ganancias"),
    "withdrawalText":MessageLookupByLibrary.simpleMessage("Retiro"),
    "billingMethodsText":MessageLookupByLibrary.simpleMessage("Métodos de facturación"),
    "earningsHistoryText":MessageLookupByLibrary.simpleMessage("Historial de ganancias"),

    // Translator earnings history
    "transactionDateText":MessageLookupByLibrary.simpleMessage("Fecha de Transacción"),
    "paidOutDateText":MessageLookupByLibrary.simpleMessage("Fecha de pago"),
    "amountPaidText":MessageLookupByLibrary.simpleMessage("Cantidad pagada"),
    "searchEarningsText":MessageLookupByLibrary.simpleMessage("Ganancias de búsqueda"),

    // Translator tax
    "taxResidenceText":MessageLookupByLibrary.simpleMessage("Impuesto de residencia"),
    "displayInvoicesText":MessageLookupByLibrary.simpleMessage("Esta dirección se mostrará en las facturas."),
    "useLocationText":MessageLookupByLibrary.simpleMessage("Usar mi dirección de ubicación actual"),
    "w9Text":MessageLookupByLibrary.simpleMessage("W-9"),
    "w9DisplayText":MessageLookupByLibrary.simpleMessage("Antes de retirar fondos, todas las personas estadounidenses deben proporcionar su información fiscal W-9."),
    "legalNameText":MessageLookupByLibrary.simpleMessage("Nombre legal de la empresa"),
    "legalNameErrorText":MessageLookupByLibrary.simpleMessage("Ingrese el nombre legal"),
    "legalNameDisplayText":MessageLookupByLibrary.simpleMessage("Proporcione el mismo nombre que aparece en su declaración de impuestos."),
    "taxClassificationText":MessageLookupByLibrary.simpleMessage("Clasificación de impuestos federales"),
    "taxClassificationErrorText":MessageLookupByLibrary.simpleMessage("Seleccione la clasificación fiscal"),
    "payerIdentificationText":MessageLookupByLibrary.simpleMessage("Tipo de número de identificación del contribuyente"),
    "payerIdentificationErrorText":MessageLookupByLibrary.simpleMessage("Seleccione el tipo de número de identificación del pagador"),
    "ssnText":MessageLookupByLibrary.simpleMessage("SSN / EIN #"),
    "ssnErrorText":MessageLookupByLibrary.simpleMessage("Ingrese SSN / EIN #"),
    "iCertifyText":MessageLookupByLibrary.simpleMessage("Certifico, bajo pena de perjurio, que las declaraciones contenidas en este Certificado Tributario son verdaderas y correctas."),
    "taxFormText":MessageLookupByLibrary.simpleMessage("1099 - Formulario de impuestos"),
    "yearText":MessageLookupByLibrary.simpleMessage("Año"),
    "yearErrorText":MessageLookupByLibrary.simpleMessage("Por favor seleccione año"),
    "getCodeText":MessageLookupByLibrary.simpleMessage("Obtener código"),
    "verificationCodeText":MessageLookupByLibrary.simpleMessage("Código de verificación"),
    "verificationCodeErrorText":MessageLookupByLibrary.simpleMessage("Ingrese el código de verificación"),
    "downloadText":MessageLookupByLibrary.simpleMessage("Descargar"),

    // Request translator
    "searchForText":MessageLookupByLibrary.simpleMessage("Buscar"),
    "translatorsText":MessageLookupByLibrary.simpleMessage("Traductores"),
    "messageText":MessageLookupByLibrary.simpleMessage("Mensaje"),
    "callText":MessageLookupByLibrary.simpleMessage("Llamada"),

    // User chat
    "startNewConversationText":MessageLookupByLibrary.simpleMessage("Iniciar una nueva conversación!"),
    "writeMessageText":MessageLookupByLibrary.simpleMessage("Escribe un mensaje..."),

    // Translator payment method
    "personalDetailsText":MessageLookupByLibrary.simpleMessage("Verificar datos personales"),
    "ssNumberText":MessageLookupByLibrary.simpleMessage("Número de seguro social (SSN)"),
    "ssNNumber":MessageLookupByLibrary.simpleMessage("Número de SSN"),
    "ssNError":MessageLookupByLibrary.simpleMessage("El número de SSN no puede estar vacío"),
    "dateOfBirthText":MessageLookupByLibrary.simpleMessage("Fecha de nacimiento"),
    "idVerificationText":MessageLookupByLibrary.simpleMessage("Verificación de identificación para"),
    "securityText":MessageLookupByLibrary.simpleMessage("Para mayor seguridad, pídale a esta persona que termine de verificar su identidad con una identificación emitida por el gobierno."),
    "billingAddText":MessageLookupByLibrary.simpleMessage("Dirección de Envio"),
    "verifyText":MessageLookupByLibrary.simpleMessage("Verificar"),
    "chooseFileText":MessageLookupByLibrary.simpleMessage("Elija el archivo"),
    "selectFileText":MessageLookupByLibrary.simpleMessage("Por favor seleccione el archivo"),
    "browseFileText":MessageLookupByLibrary.simpleMessage("Buscar Archivo"),
    "fillDetailsText":MessageLookupByLibrary.simpleMessage("Por favor complete todos los detalles."),
    "dateOfBirthReqText":MessageLookupByLibrary.simpleMessage("Se requiere fecha de nacimiento"),
  };
}
