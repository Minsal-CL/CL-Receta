Profile:        DispensacionMedicamentoCL	
Parent:         MedicationDispense
Id:             DispensacionMedicamentoCl
Title:          "Dispensación_CL"
Description:    "Este Perfil ha sido desarrollado para cubrir las necesidades del Caso de Uso de Receta Electrónica desde la visión de la TFC que se usará para poder manejar fármacos ya registrados, los cuales deberán ser consultados por los prestadores a la hora de prescribir alguno."

//Identifier
* identifier MS
* identifier 0..1 
* identifier ^short = "Se usará en caso que se realice una dispensación con Id Local"
* identifier ^definition = "Es el número de Id Local, generado a nivel del dispensador."



* identifier.system ^short = "NameSpace de id de local"
* identifier.system ^definition = "NameSpace de id de local"
* identifier.value ^short = "Número identificador"
* identifier.value ^definition = "Número identificador"
* identifier.assigner.identifier ^short = "Si el identificador de la Farmacia que ha dado identifier a la receta"
* identifier.assigner.identifier ^definition = "Si el identificador de la Farmacia que ha dado identifier a la receta"
* identifier.system and identifier.value and identifier.assigner and identifier.assigner.identifier MS

* identifier.assigner.display ^short = "Nombre de la organización a la cual se hace la referencia"

//status
* status MS
* status 1..1
* status ^short = "Estado de la dispensación según estándar: preparation | in-progress | cancelled | on-hold | completed | entered-in-error | stopped | declined | unknown"
* status ^definition = "Estado de la dispensación, estos estados pueden ser: preparation | in-progress | cancelled | on-hold | completed | entered-in-error | stopped | declined | unknown"
* status ^comment = "Si bien los códigos para este elemento son mas que los mostrados en esta guía solo se considerarán los expuestos para el caso local"

//statusRasonCodeableConcept
* statusReasonCodeableConcept and statusReasonCodeableConcept.coding and statusReasonCodeableConcept.coding.system and statusReasonCodeableConcept.coding.code and statusReasonCodeableConcept.coding.display and statusReasonCodeableConcept.text MS
* statusReasonCodeableConcept ^short = "Razón por la cual no se realizó la dispensación"
* statusReasonCodeableConcept ^definition = "Razón por la cual no se realizó la dispensación, se debe utilizar la tabla definida por MINSAL."

* statusReasonCodeableConcept.coding.system ^short = "Identidad del sistema terminológico"
* statusReasonCodeableConcept.coding.system ^definition = "Identidad del sistema termonológico que define los códigos "

* statusReasonCodeableConcept.coding.code from VSRazonEstadoMD (extensible)
* statusReasonCodeableConcept.coding.code ^short = "Código referente a la razon de porque no se entrego la dispensacion"
* statusReasonCodeableConcept.coding.display ^short = "Glosa del código"
* statusReasonCodeableConcept.coding.code ^definition = "Código referente a la razon de porque no se entrego la dispensacion"
* statusReasonCodeableConcept.coding.display ^definition = "Glosa del código"

* statusReasonCodeableConcept.text ^short = "Razon de la cancelacion"
* statusReasonCodeableConcept.text ^definition = "Razon de la cancelacion, explicada en texto libre"
* statusReasonCodeableConcept.coding.system ^short = "Códigos definidos para motivos de rechazo de la dispensación. Tabla que será generada por MINSAL"
* statusReasonCodeableConcept.coding.system ^definition = "Códigos definidos para motivos de rechazo de la dispensación. Tabla que será generada por MINSAL"
* statusReasonCodeableConcept.coding.system ^comment = "Tabla que será generada por MINSAL, quedará disponible para que cada sistema la levante localmente y apunte a ella en esta ruta"
* statusReasonCodeableConcept.coding.code ^short = "Código referente a la razon de porque no se entrego la dispensación"
* statusReasonCodeableConcept.coding.system ^short = "Glosa del código"
* statusReasonCodeableConcept.text ^short = "Razón de la cancelación"
* statusReasonCodeableConcept.text ^definition = "Razón de la cancelación, explicada en texto libre"


//subject
* subject and subject.display and subject.reference MS
* subject 1..1
* subject only Reference (Patient)
* subject ^short = "Referencia al Paciente  \"https://api-receta.minsal.cl/v2/Patient\" "
* subject ^definition = "La referencia en este caso solo se hace sobre el paciente al cual se le receta el fármaco independiente que sea otra la persona que hace retiro de estos. Se usa el repositorio \"https://api-receta.minsal.cl/v2/patient\""
* subject.display ^short = "Nombre del Paciente"
* subject.reference ^short = "URL de la referencia del recurso del paciente"


//authorizingPrescription
* authorizingPrescription and authorizingPrescription.reference and authorizingPrescription.display MS
* authorizingPrescription 1..1
* authorizingPrescription ^short = "Referencia a la prescripción que autoriza la dispensación."
* authorizingPrescription ^definition = "Referencia a la prescripción que autoriza la dispensación. Esta debe ser referenciada al recurso MedicationRequest involucrado en la receta presentada al momento de la dspensación"
* authorizingPrescription.reference ^short = "Referencia a la prescripción que autoriza la dispensación. \"https://api-receta.minsal.cl/v2/MedicationRequest\" (Obligada)"
* authorizingPrescription.reference ^definition = "Referencia a la receta que autoriza la dispensación. esta debe ser referenciada al recurso MedicationRequest involucrado en la receta presentada al momento de la dispensación. \"https://api-receta.minsal.cl/v2/MediationPrescription\" (Obligada)"

* authorizingPrescription.display ^short = "Id de la referencia a la prescripción"

//medicationReference

* medicationReference and medicationReference.display and medicationReference.reference MS
* medicationReference ^short = "Medicamento comercial dispensado. Como repositorio nacional: \"http://api-receta.minsal.cl/v2/Medication\"."
* medicationReference ^definition = "Medicamento dispenado que obedece al Producto Comercial que fue entregado a quien lo retira. Este se describe mediante el recurso de medicamento desde el reposotorio de estos. Solo se agrega en caso de ser dispensado el medicamento de otra forma no es necesario. El repositorio es \"https://api-receta.minsal.cl/v2/Medication\""
* medicationReference ^short = "Medicamento comercial dispensado. Como repositorio nacional: \"http://api-receta.minsal.cl/v2/Medication\" (Obligatorio)"
* medicationReference ^definition = "Medicamento dispensado correspondiente al Producto Comercial que fue entregado a quien lo retira. Este se describe mediante el recurso de medicamento desde el repositorio. Solo se agrega en caso de ser dispensado el medicamento, de otra forma no es necesario. El repositorio es \"https://api-receta.minsal.cl/v2/Medication\""
* medicationReference ^comment = "Solo se agrega en caso de ser dispensado el medicamento"

* medicationReference.display ^short = "Nombre del medicamento dispensado"
* medicationReference.reference ^short = "URL de la referencia al medicamento dispensado"

//whenHandedOver
* whenHandedOver MS
* whenHandedOver 1..1
* whenHandedOver ^short = "Fecha y hora cuando el medicamento fue dispensado. Formato YYYY-MM-DDThh:mm:ss+zz:zz, ej: 2018, 1973-06, 1905-08-23, 2015-02-07T13:28:17-05:00 or 2017-01-01T00:00:00.000Z"
* whenHandedOver ^short = "Fecha y hora cuando el medicamento fue dispensado. Se debe especificar en formato de fecha según HL7. YYYY-MM-DDThh:mm:ss+zz:zz, ej. 2018, 1973-06, 1905-08-23, 2015-02-07T13:28:17-05:00 or 2017-01-01T00:00:00.000Z."


//quantity
* quantity MS
* quantity 1..1
* quantity ^short = "Dosis recetada del medicamento"
* quantity ^definition = "Cantidad del medicamento dispensado"

//note
* note MS
* note ^short = "Información sobre la receta"

* dosageInstruction MS
  * sequence and text and patientInstruction and asNeededBoolean MS
  * timing MS
    * repeat MS
      * frequency and period and periodMax and periodUnit MS
  * route MS
    * coding MS
      * system and code and display MS
  * method MS
    * coding MS
      * system and code and display MS
  * doseAndRate MS
    * doseQuantity MS
      * value and unit and system and code MS
    * doseRange MS
      * low MS
        * value and unit and system and code MS
      * high MS
        * value and unit and system and code MS


* dosageInstruction ^short = "Cómo se debe administrar el medicamento. Este se llena automaticamente al vincularlo con la Prescripción"
* dosageInstruction ^definition = "Si bien se especifica, al momento de vicular el recuso con el recurso MedicationPrescription, este elemento con todas sus rutas se completan de manera automática, por lo que no es deber del dispensador llenar estos campos."
* dosageInstruction ^comment = "Este elemento y todos los que lo desriben se completan de manera automática al vincularse este recucurso conun recurso MedicationRequest"

* dosageInstruction.sequence 1..1 MS
* dosageInstruction.sequence ^short = "Secuencia de administracion del medicamento"
* dosageInstruction.sequence ^definition = "Indica el orden en el que se deben aplicar o interpretar las instrucciones de dosificación."

* dosageInstruction.text ^short = "Instruccion de dosificación"
* dosageInstruction.text ^definition = "Instruccion de dosificación"

//* dosageInstruction.text ^short = "Instrucción de dosificación"
//* dosageInstruction.text ^definition = "Instrucción de dosificación"
//* dosageInstruction.additionalInstruction ^short = "Instrucciones, advertencias y/o efectos secundarios"
//* dosageInstruction.additionalInstruction ^definition = "Instrucciones, advertencias y/o efectos secundarios"
//* dosageInstruction.additionalInstruction.coding.code from http://hl7.org/fhir/ValueSet/additional-instruction-codes (example)
//* dosageInstruction.additionalInstruction.coding.code ^short = "Codigo de las instrucciones adicionales"
//* dosageInstruction.additionalInstruction.coding.code ^definition = "Codigo de las instrucciones adicionales" 
//* dosageInstruction.additionalInstruction.coding.system ^short = "Systema terminológico para los códigos"
//* dosageInstruction.additionalInstruction.coding.system ^definition = "Systema terminológico para los códigos"
//* dosageInstruction.additionalInstruction.coding.display ^short = "Definición en texto del código"
//* dosageInstruction.additionalInstruction.coding.display ^definition = "Definición en texto del código"

* dosageInstruction.patientInstruction ^short = "Instrucciones para el paciente"
* dosageInstruction.patientInstruction ^definition = "Instrucciones con detalle o lenguaje que los pacientes puedan comprender"

* dosageInstruction.timing.repeat ^short = "Administración del medicamento en temporalidad"
* dosageInstruction.timing.repeat.frequency ^short = "Cantidad de repeticiones"
* dosageInstruction.timing.repeat.frequency ^definition = "El número de veces que se debe repetir la acción dentro del periodo especificado. Si frequencyMax está presente, este elemento indica el límite inferior del rango permitido de la frecuencia."

* dosageInstruction.timing.repeat.period ^short = "Período en el cual se realizan las repeticiones"
* dosageInstruction.timing.repeat.period ^definition = "Período en el cual se realizan las repeticiones"

* dosageInstruction.timing.repeat.periodMax ^short = "Periodo máximo en el cual se realizan las repeticiones"
* dosageInstruction.timing.repeat.periodMax ^definition = "Periodo máximo en el cual se realizan las repeticiones"

* dosageInstruction.timing.repeat.periodUnit ^short = "s | min | h | d | wk | mo | a - unidad de tiempo (UCUM)"
* dosageInstruction.timing.repeat.periodUnit ^definition = "Unidad de tiempo según Unidades de Tiempo definidias en UCUM"
* dosageInstruction.timing.repeat.periodUnit from http://hl7.org/fhir/ValueSet/units-of-time

* dosageInstruction.asNeededBoolean ^short = "Se define para uso de fármaco sin receta o indicación en esta."
* dosageInstruction.asNeededBoolean ^definition = "Para indicar si el fármaco se puede usar sin respetar diretamente lo presctito en el dosaje, como por ejemplo medicamentos que se pueden usar en caso de SOS"
	
* dosageInstruction.route ^short = "via por la cual es administrado el medicamento"
//* dosageInstruction.route.coding.system = "http://snomed.info/sct"
* dosageInstruction.route.coding.system ^short = "NameSpace de Snomed"
* dosageInstruction.route.coding.system ^definition = "NameSpace de Snomed"
* dosageInstruction.route.coding.code from  VSViasAdmin (extensible)
* dosageInstruction.route.coding.code ^short = "Código de la via por medio de subset de Snomed" 
* dosageInstruction.route.coding.code ^definition = "Código de la via por medio de subset de Snomed"
* dosageInstruction.route.coding.display ^short = "Descripción del código"
* dosageInstruction.route.coding.display ^definition = "Descripción del código"
* dosageInstruction.route ^short = "Como se debe administrar el medicamento (Vía de administración o como debe el farmaco entrar al cuerpo)"
* dosageInstruction.route ^definition = "Como se debe administrar el medicamento (Vía de administración o como debe el farmaco entrar al cuerpo)"
* dosageInstruction.method ^short = "Técnica para administrar el medicamento"
* dosageInstruction.method ^definition = "Es un valor codificado que indica el método mediante el cual se introduce el medicamento en el cuerpo o sobre él. Más comúnmente utilizado para inyecciones. Por ejemplo, empuje lento; Profundo IV."
* dosageInstruction.doseAndRate ^short = "Cantidad de los medicamentos a administrar"
* dosageInstruction.doseAndRate ^definition = "Cantidad de los medicamentos a administrar"



* dosageInstruction.method MS
* dosageInstruction.method ^short = "Forma exacta en el fármaco ingresa al organismo"
* dosageInstruction.method ^definition = "Forma exacta en el fármaco ingresa al organismo. En este caso se define la ruta plausible para vías de administración"
//* dosageInstruction.method.coding.system = "http://snomed.info/sct"
* dosageInstruction.method.coding.system ^short = "NameSpace de los códigos desde Snomed."
* dosageInstruction.method.coding.system ^definition = "NameSpace de los códigos desde Snomed."

* dosageInstruction.method.coding.code ^short = "Códigos del Set de Valores definidos desde Snomed"
* dosageInstruction.method.coding.code ^definition = "Código en Snomed-Ct correspondiente al método"
* dosageInstruction.method.coding.code from VSMetodos (extensible)

* dosageInstruction.doseAndRate ^short = "Cantidad de medicamento administrado puede ser Cantidad o Rango"	
* dosageInstruction.doseAndRate ^definition = "Cantidad de medicamento administrado puede ser Cantidad o Rango, solo se puede usar uno de ellos en el Dosaje"

* dosageInstruction.doseAndRate.doseQuantity.value ^short = "Valor de la cantidad a administrar"
* dosageInstruction.doseAndRate.doseQuantity.value ^definition = "Valor de la cantidad a administrar"


* dosageInstruction.doseAndRate.doseQuantity.unit ^definition = "Unidad de medida asociado al valueSet referenciado en el system"
* dosageInstruction.doseAndRate.doseQuantity.unit ^short = "Unidad de medida asociado al valueSet del system"

			
* dosageInstruction.doseAndRate.doseQuantity.system ^short = "Nombre del sistema de codificacion."
* dosageInstruction.doseAndRate.doseQuantity.system ^definition = "Se usará el valueSet UnidadAsistencial como sistema para unidades"


* dosageInstruction.doseAndRate.doseQuantity.code ^short = "Código para el tipo de forma del fármaco"
* dosageInstruction.doseAndRate.doseQuantity.code ^definition = "Código para el tipo de forma del fármaco, este en principio no será validado estará dado en la Norma Técnica"
* dosageInstruction.doseAndRate.doseQuantity.code from VSUnidadAsistencial (extensible)



* dosageInstruction.doseAndRate.doseRange.low.value ^short = "Valor de la cantidad mínima a administrar"
* dosageInstruction.doseAndRate.doseRange.low.unit ^short = "Unidad de medida asociado al valueSet del system"
			
* dosageInstruction.doseAndRate.doseRange.low.system ^short = "Nombre del sistema de codificacion."
* dosageInstruction.doseAndRate.doseRange.low.code ^short = "Código para el tipo de forma del fármaco, este en principio no será validado estará dado en la Norma Técnica"
* dosageInstruction.doseAndRate.doseRange.low.code from VSUnidadAsistencial (extensible)


* dosageInstruction.doseAndRate.doseRange.high.value ^short = "Valor de la cantidad máxima a administrar"
* dosageInstruction.doseAndRate.doseRange.high.unit ^short = "Unidad de medida asociado al valueSet del system"
			
* dosageInstruction.doseAndRate.doseRange.high.system ^short = "Nombre del sistema de codificacion."
* dosageInstruction.doseAndRate.doseRange.high.code ^short = "Código para el tipo de forma del fármaco, este en principio no será validado estará dado en la Norma Técnica"
* dosageInstruction.doseAndRate.doseRange.high.code from VSUnidadAsistencial (extensible)


* dosageInstruction.doseAndRate.doseRange.low.value ^definition = "Valor mínimo del rango"
* dosageInstruction.doseAndRate.doseRange.low.unit ^definition = "Unidad de medida asociado al valueSet del system"
			
* dosageInstruction.doseAndRate.doseRange.low.system ^definition = "Se definirá mas adelante "
* dosageInstruction.doseAndRate.doseRange.low.code ^definition = "Código para el tipo de forma del fármaco, este en principio no será validado estará dado en la Norma Técnica"
		
* dosageInstruction.doseAndRate.doseRange.high.value ^definition = "Valor mínimo del rango"
* dosageInstruction.doseAndRate.doseRange.high.unit ^definition = "Unidad de medida asociado al valueSet del system"
			
* dosageInstruction.doseAndRate.doseRange.high.system ^definition = "Se definirá mas adelante "
* dosageInstruction.doseAndRate.doseRange.high.code ^definition = "Código para el tipo de forma del fármaco, este en principio no será validado estará dado en la Norma Técnica"
		
		
//performer
* performer MS
* performer 1..2
* performer ^slicing.discriminator.type = #value
* performer ^slicing.discriminator.path = "function.coding.code"
* performer ^slicing.rules = #closed

* performer contains
	Dispensador 1..1 and Validador 0..1

* performer ^short = "Profesional que realizó la orden."

* performer ^definition = "Profesional que realizó o validó la entrega de la orden de fármacos."
* performer ^comment = "Se definen dos tipos de dispensador, no excluyentes mutuamente. El primero es el dispensador del fármaco pero el segundo es el validador. El dispensador es obligado. Ambos son iguales desde el punto de vista del desarrollo de cada slice es el mismo solo debe cambiar el valor del código del la ruta performer.function.code"

* performer[Dispensador] and performer[Dispensador].function and performer[Dispensador].function.coding and performer[Dispensador].function.coding.system and performer[Dispensador].function.coding.code and performer[Dispensador].actor and performer[Dispensador].actor.reference and performer[Dispensador].actor.display MS
* performer[Dispensador] ^short = "Aquel individuo que realiza la entega de medicamentos"
* performer[Dispensador] ^definition = "Se entiende por dispensador al individuo que entrega los medicamentos a quien los solicite en el punto de entrega. Simpre en el proceso de dispensación existe un dispensador"

* performer[Dispensador].function 1..1
* performer[Dispensador].function ^short = "Función que desarrolla el Performer, en este caso dispensador"
* performer[Dispensador].function ^definition = "Función que desarrolla el Performer, en este caso dispensador"

* performer[Dispensador].function.coding.system ^comment = "Dado que estos códigos quedarán normativos y con motivo de simplificación  de desarrollo, se puede obviar la ruta *performer[Validador].function.coding.system*"
* performer[Dispensador].function.coding.code ^short = "Código del tipo de dispensador. El valor obligado es \"Dispensador\""
* performer[Dispensador].function.coding.code ^definition = "Código del tipo de dispensador según tabla maestra. En este caso debe ser Dispensador"
* performer[Dispensador].function.coding.code = #Dispensador

* performer[Dispensador].actor only Reference(Practitioner)
* performer[Dispensador].actor ^short = "Profesional que realiza la dispensación. El endPoint es \"http://api-receta.minsal.cl/v2/Practitioner\""
* performer[Dispensador].actor.reference ^short = "La referencia del recurso especificado debe ser al endPoint \"http://api-receta.minsal.cl/v2/Practitioner\""
* performer[Dispensador].actor.reference ^definition = "La referencia del recurso especificado debe ser al endPoint \"http://api-receta.minsal.cl/v2/Practitioner\". En el caso nacional el dispensador estaría dentro de los recucursos desarrollados para Prestadores"
* performer[Dispensador].actor.display ^short = "Nombre del dispensador de la receta"

* performer[Validador] and performer[Validador].function and performer[Validador].function.coding and performer[Validador].function.coding.system and performer[Validador].function.coding.code and performer[Validador].actor and performer[Validador].actor.reference and performer[Validador].actor.display MS
* performer[Validador] ^short = "Aquel individuo que realiza la validación ante la entega de medicamentos"
* performer[Validador] ^definition = "Se entiende por dispensador al individuo que valida la entrega de los medicamentos a quien los solicite en el punto de entrega. Por lo común es un Químico Farmacéutico de Profesión"

* performer[Validador].function 1..1
* performer[Validador].function ^short = "Función que desarrolla el Validador, en este caso siempre será un Químico Farmaceutico"
* performer[Validador].function ^definition = "Función que desarrolla el Performer, en este caso validador"
* performer[Validador].function.coding.system ^comment = "Dado que estos códigos quedarán normativos y con motivo de simplificación  de desarrollo, se puede obviar la ruta *performer[Validador].function.coding.system*"
* performer[Validador].function.coding.code ^short = "Código de validador. Debe ser **Validador** para definir un Validador"
* performer[Validador].function.coding.code ^definition = "Código de validador según tabla maestra. En este caso debe ser Validador"
* performer[Validador].function.coding.code = #Validador
* performer[Validador].actor.display ^short = "Nombre de quien valida la receta antes de la entrega."


* performer[Validador].actor only Reference(Practitioner)
* performer[Validador].actor ^short = "Profesional que realiza la validación. El endPoint es \"http://api-receta.minsal.cl/v2/practitioner\""
* performer[Validador].actor.reference ^short = "La referencia del recurso especificado debe ser al endPoint \"http://api-receta.minsal.cl/v2/practitioner\""
* performer[Validador].actor.reference ^definition = "La referencia del recurso especificado debe ser al endPoint \"http://api-receta.minsal.cl/v2/practitioner\". En el caso nacional el dispensador estaría dentro de los recucursos desarrollados para Prestadores"


//localización

* location 1..1
* location and location.reference and location.display MS
* location ^short = "Ubicación Georeferenciada de la dispensación"
* location ^definition = "La ubicación física principal en la cual se desarrolló la dispensación"
* location.reference ^short = "Identificación del recurso de lcalización de los dispensadores. \"https://api-receta.minsal.cl/v2/Location\" (Obligatoria)"
* location.reference ^definition = "El repositorio Central tendrá listada la ubicación de todos los dispensadores en recurso location. Estas deberán ser alcanzadas desde \"https://api-receta.minsal.cl/v2/Location\" (Obligatoria)"
* location.display ^short = "Descripción de la ubicacion o localización donde se realiza la dispensación"


//receiver
* receiver only Reference(Patient)
* receiver and receiver.display and receiver.reference MS
* receiver 0..1

* receiver ^short = "Persona a la cual se le hace entrega de los fármacos."
* receiver.display ^short = "Se debe  escribir el nombre y apellido de quien recibe el medicamento "
* receiver.display ^definition = "Se define el nombre y apellido de quien recibe el medicamento. Este elemento si bien no es obligatorio debería serlo en el servicio público y solo en caso que quien recibe el medicamento no sea el paciente sobre el cual fueron recetados "
* receiver.display ^comment = "Debe ser obligatorio en dispensaciones realizadas en el sector de salud Público"
* receiver.reference ^short = "URL del recurso Paciente"
* receiver.reference ^short = "Se debe agregar la URL del recurso Paciente"


//"Profesional quien hizo la receta. La manera correcta de hacer la referencia es referenciando a la API de MINSAL, mas el identificador del médico (https://api.receta.minsal.asimov.cl/practitioner)"

//location
//* location MS
//* location ^short = "Referencia a la geo-localizacion del dispensador de los medicamentos"

//detectedIssue
* detectedIssue  and detectedIssue.display and detectedIssue.reference MS
* detectedIssue ^short = "Evento adverso detectado como contraindicación al farmaco dispensado"
* detectedIssue ^definition = "Indica un problema clinico real o potencial, con acciones clinicas posibles, por ejemplo, una interaccion farmaco-farmaco, doble dosis de medicamentos, etc."
* detectedIssue.display ^short = "Texto libre que describe el potencial evento adverso o contraindicación"
* detectedIssue.display ^definition = "Texto libre que describe el potencial evento adverso o contraindicación. Por momento solo se considera la redacción en texto libre de este campo"
* detectedIssue.reference ^short = "Referencia al evendo adverso detectado."


Instance : DispensacionMedicamentoCL
Title : "Ejemplo de la dispensación del Medicamento Oxycodone Vía Oral"
InstanceOf : DispensacionMedicamentoCl	
Usage: #example

//////////////////
* identifier.system = "http://minsal.cl/portalReceta/dispensacion"
* identifier.value = "Dispensacion-001"

//////////////////
* status = #cancelled

//////////////////
* statusReasonCodeableConcept.coding.system = "http://minsal.cl/razon-de-no-dispensacion"
* statusReasonCodeableConcept.coding.code = #1123654
* statusReasonCodeableConcept.coding.display = "medicamento agotado"

//////////////////
* medicationReference.reference = "https://api-receta.minsal.cl/v2/Medication/Med#22353"

//////////////////
//* performer[Dispensador].function.coding.system = "http://farmaciaLocal.cl/api-R/Tablas/TablaFunc"
* performer[Dispensador].function.coding.code = #Dispensador
* performer[Dispensador].function.coding.display = "Vendedor"
* performer[Dispensador].actor.reference = "https://api-receta.minsal.cl/v2/Practitioner/Di#14785214"
* performer[Dispensador].actor.display = "Juan Bastidas"
//* performer[Dispensador].function.text = "Dispensador de la Prescripción"

//* performer[Validador].function.coding.system = "http://farmaciaLocal.cl/api-R/Tablas/TablaFunc"
* performer[Validador].function.coding.code = #Validador
* performer[Validador].function.coding.display = "Químico Farmaceutico"
* performer[Validador].actor.reference = "https://api-receta.minsal.cl/v2/Practitioner/Di#245993"
* performer[Validador].actor.display = "Sofia Galindo"
//* performer[Validador].function.text = "Validador de la Prescripción Dispensada"

//////////////////
* subject.reference = "https://api-receta.minsal.cl/v2/Patient/Paciente#2411224"
* subject.display = "Patricio Perez"



////////////////////////
* location.reference = "https://api-receta.minsal.cl/v2/Location/145874"

///////////////////////
* authorizingPrescription.reference = "https://api-receta.minsal.cl/v2/MedicationReference/Pres#1321"



/////////////////////
* whenHandedOver = "2020-01-10T16:22:12-04:00"

//////////////////////
* quantity.value = 1
* quantity.system = "http://unitsofmeasure.org"
//* quantity.code = "mL"

/////////////////////
* note.text = "El medicamento solo se receta en caso de dolor extremo y cuando este persista por mas de 10 dias"

* dosageInstruction.sequence = 1
* dosageInstruction.text = "una-dos pastillas cada 4-6 horas en caso de aumento de dolor"
* dosageInstruction.additionalInstruction.coding.system = "http://snomed.info/sct"
* dosageInstruction.additionalInstruction.coding.code = #418639000
* dosageInstruction.additionalInstruction.coding.display = "Advertencia. Puede provocar somnolencia. Si le afecta no conduzca ni maneje maquinaria. Evitar las bebidas alcohólicas (valor calificativo)"
* dosageInstruction.patientInstruction = "Tomar una o dos pastillas cada 4-6 horas en caso de aumento de dolor"
* dosageInstruction.timing.repeat.frequency = 1
* dosageInstruction.timing.repeat.frequencyMax = 2
* dosageInstruction.timing.repeat.period = 4
* dosageInstruction.timing.repeat.periodMax = 6
* dosageInstruction.timing.repeat.periodUnit = #h

* dosageInstruction.asNeededBoolean = false

* dosageInstruction.route.coding.system = "http://snomed.info/sct"
* dosageInstruction.route.coding.code = #26643006
* dosageInstruction.route.coding.display = "Ruta Oral"
* dosageInstruction.method.coding.system = "http://snomed.info/sct"
* dosageInstruction.method.coding.code = #421521009
* dosageInstruction.method.coding.display = "Tragarsela - imperativo contar con información de dosaje (qualifier value)"
* dosageInstruction.doseAndRate.type.coding.system = "http://terminology.hl7.org/CodeSystem/dose-rate-type"
* dosageInstruction.doseAndRate.type.coding.code =  #ordered
* dosageInstruction.doseAndRate.type.coding.display =  "Ordered"
* dosageInstruction.doseAndRate.doseRange.low.value = 1.0
* dosageInstruction.doseAndRate.doseRange.low.unit = "TAB"
* dosageInstruction.doseAndRate.doseRange.low.system = "http://terminology.hl7.org/CodeSystem/v3-orderableDrugForm"
* dosageInstruction.doseAndRate.doseRange.low.code = #TAB
* dosageInstruction.doseAndRate.doseRange.high.value = 2.0 
* dosageInstruction.doseAndRate.doseRange.high.unit = "TAB"
* dosageInstruction.doseAndRate.doseRange.high.system = "http://terminology.hl7.org/CodeSystem/v3-orderableDrugForm"
* dosageInstruction.doseAndRate.doseRange.high.code = #TAB



Alias: $TablaFunc = http://receta.minsal.gob.cl/Tablas/TablaFunc
Alias: $sct = http://snomed.info/sct

Instance : DispensacionMedicamentoCL-2
Title : "Ejemplo de la dispensacion del Medicamento Kitadol 500mg"
InstanceOf : DispensacionMedicamentoCl
Usage: #example

* status = #completed
* authorizingPrescription = Reference(https://api-receta.minsal.cl/v2/MedicationRequest/l3gerwpo41pn7305mfoi)
* medicationReference = Reference(https://api-receta.minsal.cl/v2/Medication/2123731000167117) "kitadol 500 mg comprimido (Lab Chile) 24 comprimidos"
* subject = Reference(https://api-receta.minsal.cl/v2/Patient/1115090713) "PABLO PIZARRO"
* quantity.value = 1
* quantity.system = "http://unitsofmeasure.org"
* location = Reference(https://api-receta.minsal.cl/v2/Location/cbc1a58wefvbwlebm51z)

* performer[0].function = $TablaFunc#Dispensador "Dispensador"
* performer[=].actor = Reference(https://api-receta.minsal.cl/v2/Practitioner/323073548642) "FRANCO MAURICIO ULLOA MEDINA"
* performer[+].function = $TablaFunc#Validador "Validador"
* performer[=].actor = Reference(https://api-receta.minsal.cl/v2/Practitioner/2309028611) "NICOLÁS ALEXIS SOTO DURÁN"

* dosageInstruction.route = $sct#26643006 "Vía Oral"
* dosageInstruction.method = $sct#738995006 "Tragar (método de administración)"

* dosageInstruction.timing.repeat.period = 1
* dosageInstruction.timing.repeat.frequency = 1
* dosageInstruction.timing.repeat.periodUnit = #d

* dosageInstruction.timing.repeat.boundsDuration.value = 1 
* dosageInstruction.timing.repeat.boundsDuration.unit = #d
* dosageInstruction.timing.repeat.boundsDuration.system = "http://unitsofmeasure.org"


* dosageInstruction.doseAndRate.doseQuantity.value = 1 
* dosageInstruction.doseAndRate.doseQuantity.unit = "comprimido"
* whenHandedOver = "2021-08-23T14:22:27.900Z"