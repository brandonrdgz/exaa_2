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
    """INSERT INTO MODULE (name_module, description_module, pathImage)
    VALUES ('Estructura de la lengua', 'Descripción', 'assets/design/gramatic_structure.jpg');""",
    """INSERT INTO MODULE (name_module, description_module, pathImage)
    VALUES ('Pensamiento Matemático', 'Descripción', 'assets/design/math1.png');"""
  ];

  //REGISTROS PARA PROBAR LOS TOPICOS
  static List<String> insertRecordsTopic = [
    """INSERT INTO MODULE (name_topic, description_topic, name_module)
    VALUES ('Signos de puntuación', 'Descripción', 'Estructura de la lengua');""",
    """INSERT INTO MODULE (name_module, description_module, pathImage)
    VALUES ('Álgebra', 'Descripción', 'Pensamiento Matemático');"""
  ];
}
