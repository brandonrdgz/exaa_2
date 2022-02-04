class SqlData {
  static List createTables = [
    """CREATE TABLE USERS(
    username TEXT NOT NULL,
    email TEXT PRIMARY KEY
    );""",
    """CREATE TABLE EXAM(
    id_exam INTEGER PRIMARY KEY,
    type_exam TEXT
    );""",
    """CREATE TABLE HISTORY(
    email TEXT,
    id_exam INTEGER,
    result NUMERIC,
    date_realization TEXT,
    CONSTRAINT FK_EMAIL FOREIGN KEY (email) REFERENCES USERS (email),
    CONSTRAINT FK_IDEXAMH FOREIGN KEY (id_exam) REFERENCES EXAM (id_exam)
    );""",
    """CREATE TABLE MODULE(
    name_module TEXT PRIMARY KEY,
    description_module TEXT,
    pathImage TEXT
    );""",
    """CREATE TABLE TOPIC(
    name_topic TEXT PRIMARY KEY,
    description_topic TEXT,
    name_module TEXT,
    CONSTRAINT FK_NAMEMOD FOREIGN KEY (name_module) REFERENCES MODULE (name_module)
    );""",
    """CREATE TABLE SUBTOPIC(
    name_subtopic TEXT PRIMARY KEY,
    content_subtopic TEXT,
    name_topic TEXT,
    CONSTRAINT FK_NAMETOP FOREIGN KEY (name_topic) REFERENCES TOPIC (name_topic)
    );""",
    """CREATE TABLE QUESTION(
    content_question TEXT PRIMARY KEY,
    name_subtopic TEXT,
    CONSTRAINT FK_NAMESUBT FOREIGN KEY (name_subtopic) REFERENCES SUBTOPIC (name_subtopic)
    );""",
    """CREATE TABLE EXAM_QUESTION(
    id_exam INTEGER,
    content_question TEXT,
    CONSTRAINT FK_CONTQ FOREIGN KEY (content_question) REFERENCES QUESTION (content_question),
    CONSTRAINT FK_IDEXAMQ FOREIGN KEY (id_exam) REFERENCES EXAM (id_exam)
    );""",
    """CREATE TABLE ANSWER(
    content_answer TEXT PRIMARY KEY,
    content_question TEXT,
    is_correct INTEGER,
    CONSTRAINT FK_CONTQA FOREIGN KEY (content_question) REFERENCES QUESTION (content_question)
    );"""
  ];

  static List<String> insertRecordsModule = [
    """INSERT INTO MODULE  VALUES ('PENSAMIENTO MATEMÁTICO','CAPACIDAD PARA MANEJAR DIESTRAMENTE LAS OPERACIONES CON NÚMEROS','assets/design/math1.png');""",
    """INSERT INTO MODULE  VALUES ('CÁLCULO','FORMA AVANZADA DEL ÁLGEBRA', 'assets/design/calculus.jpg');""",
    """INSERT INTO MODULE  VALUES ('FÍSICA','CIENCIA NATURAL QUE ESTUDIA LOS COMPONENTES FUNDAMENTALES DEL UNIVERSO', 'assets/design/physics.png');""",
    """INSERT INTO MODULE  VALUES ('ESTRUCTURA DE LA LENGUA','ESTUDIO DE LA LENGUA EN FORMA ORAL Y ESCRITA','assets/design/gramatic_structure.jpg');""",
    """INSERT INTO MODULE  VALUES ('COMPRENSIÓN LECTORA','CAPACIDAD DE ENTENDER LO QUE SE LEE','assets/design/lecture.jpg');"""
  ];

  //REGISTROS PARA PROBAR LOS TOPICOS
  static List<String> insertRecordsTopic = [
    """INSERT INTO TOPIC VALUES ('OPERACIONES BÁSICAS','LAS OPERACIONES BÁSICAS SE VERIFICAN A TRAVÉS DE SU OPERACIÓN INVERSA','PENSAMIENTO MATEMÁTICO');""",
    """INSERT INTO TOPIC VALUES ('JERARQUÍA DE OPERACIONES','RESOLVER LAS OPERACIONES MEDIANTE SU ORDEN JERÁRQUICO','PENSAMIENTO MATEMÁTICO');""",
    """INSERT INTO TOPIC VALUES ('PROPIEDADES DE LOS NÚMEROS REALES','LOS NÚMEROS REALES SON TODOS AQUELLOS QUE SE PUEDEN REPRESENTAR DENTRO DE UNA RECTA NÚMERICA','PENSAMIENTO MATEMÁTICO');""",
    """INSERT INTO TOPIC VALUES ('REGLAS DE LOS SIGNOS','SON REGLAS QUE PROPORCIONAN EL SIGNO DEL RESULTADO DE LA MULTIPLICACIÓN O DIVISIÓN DE DOS NÚMEROS','PENSAMIENTO MATEMÁTICO');""",
    """INSERT INTO TOPIC VALUES ('CÁLCULO DE PORCENTAJES','EL PORCENTAJE ES UN SÍMBOLO MATEMÁTICO, QUE REPRESENTA UNA PROPORCIÓN O FRACCIÓN','PENSAMIENTO MATEMÁTICO');""",
    """INSERT INTO TOPIC VALUES ('REGLA DE TRES','ES UNA RELACIÓN QUE SE ESTABLECE ENTRE TRES VALORES CONOCIDOS Y UNA INCÓGNITA','PENSAMIENTO MATEMÁTICO');""",
    """INSERT INTO TOPIC VALUES ('POTENCIA Y RAÍZ','POTENCIA SIGNIFICA MULTIPLICAR VARIAS VECES POR SÍ MISMO. LA RAÍZ CUADRADA ES LO CONTRARIO DE ELEVAR AL CUADRADO','PENSAMIENTO MATEMÁTICO');""",
    """INSERT INTO TOPIC VALUES ('PROPIEDADES DE LOS NÚMEROS','HAY CUATRO PROPIEDADES BÁSICAS DE LOS NÚMEROS: CONMUTATIVA, ASOCIATIVA, DISTRIBUTIVA Y DE IDENTIDAD','PENSAMIENTO MATEMÁTICO');""",
    """INSERT INTO TOPIC VALUES ('ESPACIO VECTORIAL','UN ESPACIO VECTORIAL ES UN CONCEPTO ABSTRACTO PARA PROBAR TEOREMAS','CÁLCULO');""",
    """INSERT INTO TOPIC VALUES ('LITERALES Y EXPONENTES','UNA LITERAL ES UNA RERESENTACIÓN GENERAL DE CIERTA MAGNITUD','CÁLCULO');""",
    """INSERT INTO TOPIC VALUES ('PRODUCTOS NOTABLES Y FACTORIZACIÓN','UN PRODUCTO NOTABLE ES UN PRODUCTO QUE CUMPLE CON REGLAS FIJAS, CADA PRODUCTO NOTABLE CORRESPONDE A UNA FÓRMULA DE FACTORIZACIÓN','CÁLCULO');""",
    """INSERT INTO TOPIC VALUES ('ECUACIONES DE PRIMER Y SEGUNDO GRADO','LAS ECUACIONES SON IGUALDADES EN LAS QUE APARECEN NÚMEROS Y LETRAS RELACIONADOS MEDIANTE OPERACIONES MATEMÁTICAS','CÁLCULO');""",
    """INSERT INTO TOPIC VALUES ('PROPORCIONES Y DESIGUALDADES','CUANDO SE TIENE UNA IGUALDAD ENTRE DOS RAZONES, ESTAMOS FRENTE A UNA PROPORCIÓN','CÁLCULO');""",
    """INSERT INTO TOPIC VALUES ('DESIGUALDADES','UNA DESIGUALDAD ES UNA RELACIÓN DE ORDEN QUE SE DA ENTRE DOS VALORES CUANDO ESTOS SON DISTINTOS','CÁLCULO');""",
    """INSERT INTO TOPIC VALUES ('FUNCIÓN Y LÍMITE','EL LÍMITE DE UNA FUNCIÓN ES UN CONCEPTO FUNDAMENTAL DEL ANÁLISIS APLICADO A LAS FUNCIONES','CÁLCULO');""",
    """INSERT INTO TOPIC VALUES ('ENERGÍA','CAPACIDAD DE LOS CUERPOS PARA REALIZAR UN TRABAJO','FÍSICA');""",
    """INSERT INTO TOPIC VALUES ('MECÁNICA','ESTUDIO Y ANÁLISIS DEL MOVIMIENTO Y REPOSO DE LOS CUERPOS','FÍSICA');""",
    """INSERT INTO TOPIC VALUES ('ELECTROMAGNETISMO','ESTUDIO DE FENÓMENOS ELÉCTRICOS Y MAGNÉTICOS EN UNA SOLA TEORÍA','FÍSICA');""",
    """INSERT INTO TOPIC VALUES ('ACÚSTICA','ESTUDIO DE ONDAS MECÁNICAS QUE SE PROPAGAN A TRAVÉS DE LA MATERIA','FÍSICA');""",
    """INSERT INTO TOPIC VALUES ('ÓPTICA','ESTUDIO DE FENÓMENOS DE LUZ, COMO ONDA Y PARTÍCULA','FÍSICA');""",
    """INSERT INTO TOPIC VALUES ('TERMODINÁMICA','ESTUDIO DE LA INTERACCIÓN ENTRE EL CALOR Y OTRAS MANIFESTACIONES DE LA ENERGÍA','FÍSICA');""",
    """INSERT INTO TOPIC VALUES ('ORTOGRAFÍA GENERAL','ES EL CONJUNTO DE REGLAS Y CONVENCIONES QUE RIGEN EL SISTEMA DE ESCRITURA PARA UNA LENGUA ESTÁNDAR','ESTRUCTURA DE LA LENGUA');""",
    """INSERT INTO TOPIC VALUES ('PUNTUACIÓN','ES EL USO DE MARCAS Y SIGNOS ESTÁNDAR EN LA ESCRITURA PARA SEPARAR PALABRAS EN FRASES Y ACLARAR ASÍ SU SIGNIFICADO','ESTRUCTURA DE LA LENGUA');""",
    """INSERT INTO TOPIC VALUES ('GRAMÁTICA Y VOCABULARIO','ESTUDIO DE LAS REGLAS Y PRINCIPIOS QUE GOBERNAN EL USO DE LAS LENGUAS, ASÍ COMO SU ORGANIZACIÓN Y OTROS CONSTITUYENTES SINTÁCTICOS','ESTRUCTURA DE LA LENGUA');""",
    """INSERT INTO TOPIC VALUES ('CONCORDANCIA Y DISCORDANCIA DE LAS PARTES DE UNA ORACIÓN','SE REFIERE A LA ORGANIZACIÓN CORRECTA DE UNA ORACIÓN','ESTRUCTURA DE LA LENGUA');""",
    """INSERT INTO TOPIC VALUES ('AUTORES Y OBRAS IMPORTANTES DE LA LITERATURA CLÁSICA','LA LITERATURA CLÁSICA SE CONSIDERA AQUELLA ESCRITA EN GRIEGO ANTIGUO O EN LATÍN','ESTRUCTURA DE LA LENGUA');""",
    """INSERT INTO TOPIC VALUES ('LA COMPRENSIÓN LECTORA','ES LA CAPACIDAD DE ENTENDER LO QUE SE LEE','COMPRENSIÓN LECTORA');""",
    """INSERT INTO TOPIC VALUES ('EL ESTABLECIMIENTO DE RELACIONES ENTRE PALABRAS Y FRASES SINÓNIMAS Y ANTÓNIMAS','SON RELACIONES QUE SE ENTABLAN DESDE EL CONTENIDO O EL SIGNIFICADO DE LA PALABRA','COMPRENSIÓN LECTORA');""",
    """INSERT INTO TOPIC VALUES ('EL ESTABLECIMIENTO DE INTERPRETACIONES DE RAZONAMIENTOS LÓGICOS Y ANALÓGICOS','EL RAZONAMIENTO LÓGICO ES UN PROCESO DE LÓGICA QUE PARTIENDO DE UNO O MÁS JUICIOS, SE DERIVA LA VALIDEZ O FALSEDAD DE OTRO JUICIO DISTINTO','COMPRENSIÓN LECTORA');""",
    """INSERT INTO TOPIC VALUES ('LA ELABORACIÓN DE INTERFERENCIAS LÓGICAS Y SILOGÍSTICAS','LA INTERFERENICA ES EL PROCESO POR EL CUAL SE DERIVAN CONCLUSIONES A PARTIR DE PREMISAS','COMPRENSIÓN LECTORA');""",
    """INSERT INTO TOPIC VALUES ('EL ESTABLECIMIENTO DE RELACIONES','SON AQUELLAS QUE SE ESTABLECEN ENTRE LOS SIGNIFICADOS LÉXICAS DE LAS PALABRAS','COMPRENSIÓN LECTORA');"""
  ];

  //REGISTROS PARA PROBAR LOS SUBTOPICOS
  static List<String> insertRecordsSubtopic = [
    """INSERT INTO SUBTOPIC (name_subtopic, content_subtopic, name_topic)
    VALUES ('Coma', "<div> <h1>This is a title</h1> <p>This is a <strong>paragraph</strong>.</p> <p>I like <i>dogs</i></p> <p>Red text</p> <ul> <li>List item 1</li> <li>List item 2</li> <li>List item 3</li> </ul> <img src='https://www.kindacode.com/wp-content/uploads/2020/11/my-dog.jpg' /> </div>", 'PUNTUACIÓN');""",
    """INSERT INTO SUBTOPIC (name_subtopic, content_subtopic, name_topic)
    VALUES ('Punto', 'Contenido', 'PUNTUACIÓN');""",
    """INSERT INTO SUBTOPIC (name_subtopic, content_subtopic, name_topic)
    VALUES ('Punto y coma', 'Contenido', 'PUNTUACIÓN');""",
    """INSERT INTO SUBTOPIC (name_subtopic, content_subtopic, name_topic)
    VALUES ('Pretérito', 'Contenido', 'GRAMÁTICA Y VOCABULARIO');""",
    """INSERT INTO SUBTOPIC (name_subtopic, content_subtopic, name_topic)
    VALUES ('Pasado', 'Contenido', 'GRAMÁTICA Y VOCABULARIO');""",
    """INSERT INTO SUBTOPIC (name_subtopic, content_subtopic, name_topic)
    VALUES ('Irregulares', 'Contenido', 'GRAMÁTICA Y VOCABULARIO');""",
    """INSERT INTO SUBTOPIC (name_subtopic, content_subtopic, name_topic)
    VALUES ('Regulares', 'Contenido', 'GRAMÁTICA Y VOCABULARIO');""",
  ];
}
