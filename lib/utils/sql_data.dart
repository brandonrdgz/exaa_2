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
    VALUES ('COMA', "<div> <h1>This is a title</h1> <p>This is a <strong>paragraph</strong>.</p> <p>I like <i>dogs</i></p> <p>Red text</p> <ul> <li>List item 1</li> <li>List item 2</li> <li>List item 3</li> </ul> <img src='https://drive.google.com/uc?id=1dcnRyMeqzBhfNVuSuk0lRYCKVRvWSY3E' /> </div>", 'PUNTUACIÓN');""",
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
    VALUES ('Regulares', "
	<h2>Autores y obras importantes de la literatura clásica</h2>
	<p>
		Cuando hablamos de mundo clásico nos referimos a las civilizaciones griega y romana, cuya influencia perdura hasta nuestros días y constituye el componente fundamental de la cultura occidental. Muchos aspectos de nuestra vida actual tienen sus remotos orígenes en el mundo clásico. La democracia, la república, la filosofía, la poesía, la tragedia e inclusive el atletismo, las olimpiadas y la escuela nacieron muchos siglos atrás, en las costas del mediterráneo. La civilización griega se remonta a la cultura de los aqueos. Esta cultura fue modificada posteriormente con la llegada de nuevos pueblos que, poco a poco, fueron consolidando una gran civilización formada por polis (ciudades-estados). La civilización griega llego a su plenitud alrededor del siglo V a. de. C., cuando Atenas alcanzo un formidable desarrollo artístico y cultural. Por otra parte, los hombres comunes anteriormente excluidos de la política por la nobleza empezaron a participar en ella, convirtiendo a Atenas en la primera democracia de nuestra historia.
	</p>
	<div>
		<h3>La mitología, fuente inagotable de temas literarios</h3>
	</div>
	<div>
		<h3>El arte griego</h3>
		<p>
			El arte griego se caracterizó por la búsqueda de la belleza y la perfección de los artistas, en especial los escultores se esforzaron por expresar la belleza ideal del cuerpo humano, que estaban en el equilibrio y la armonía.
		</p>
	</div>
	<div>
		<h3>La literatura griega poesía épica</h3>
		<p>
			Los primitivos habitantes de Grecia, los pueblos de las civilizaciones egea y micénica poseyeron una literatura oral compuesta en su mayor parte por canciones que hablaban de las guerras, las cosechas y los ritos funerarios. Los helenos se apropiaron de estas canciones en el segundo milenio a.C. y, aunque no se conserva ningún fragmento, los cantos de los aedos dedicados a los héroes prefiguran la poesía épica. La épica griega alcanzó su máximo esplendor con la Ilíada y la Odisea de Homero, aunque se cree que pueden ser obra de una sucesión de poetas que vivieron a lo largo del siglo IX a.C. Escritos en dialecto jónico con mezclas eólico, la perfección de sus versos hexámetros dáctilos indica que los poemas son la culminación, más que el principio, de una tradición literaria. Los poemas épicos homéricos se difundieron en las recitaciones de cantores profesionales que, en sucesivas generaciones, alteraron el original, actualizando el lenguaje. Esta tradición oral se mantuvo durante más de cuatro siglos.
		</p>
		<p>
			Otros acontecimientos míticos y heroicos que no se celebran en la obra homérica o que no se narran en su totalidad, se convirtieron en el argumento de varios poemas épicos posteriores, algunos de cuyos fragmentos se conservan. Un grupo de estos poemas épicos, compuestos entre 800-550 a.C., por un número indeterminado de poetas conocidos como poetas cíclicos, tratan de la guerra de Troya y la expedición de Los Siete contra Tebas. Entre los poetas épicos conocidos, casi todos posteriores, se cuentan Pisandro de Rodas, autor de la Heracleia, que trata de las hazañas del héroe mitológico Hércules; Paniasis de Halicarnaso, que escribió una obra también llamada Heracleia, de la que sólo se conservan algunos fragmentos, y Antímaco de Colofón o Claros, autor de la Tebas y considerado fundador de la llamada escuela de poesía épica. Antímaco influyó poderosamente en los poetas épicos alejandrinos posteriores
		</p>
		<p>
			La crítica textual contemporánea ha establecido que varias de las obras atribuidas en un principio a Homero son de autoría posterior. Las más tempranas son, probablemente, los llamados 34 himnos homéricos, fechados entre el 700 y el 400 a.C., una magnífica serie de himnos a los dioses escritos en hexámetros dactílicos. Entre otros poemas semejantes destaca la burlesca Batracomiomaquia.
		</p>
		<p>
			Poco después de Homero, el poeta Hesíodo escribió su obra principal, Los trabajos y los días, compuesta también en dialecto jónico con algunas mezclas de eólico. Es el primer poema griego que abandona la leyenda o el mito para centrarse en la vida cotidiana, las experiencias y pensamientos de un granjero beocio. La Teogonía, normalmente atribuida a Hesíodo, aunque algunos críticos la consideran posterior, narra el nacimiento del orden a partir del caos y el de los dioses.
		</p>
		<p>
			El dístico elegíaco se popularizó en toda Grecia durante el siglo VII a.C. y se utilizó en composiciones de todas clases, desde canciones fúnebres a canciones de amor. El primer autor conocido de elegías fue Calino de Éfeso. Otros famosos poetas elegíacos primitivos fueron Tirteo de Esparta, Mimnermo de Colofón, Arquíloco de Paros, Solón el primer poeta ateniense y Teognis de Megara.
		</p>
	</div>
	<div>
		<h3>Poesía lírica</h3>
		<p>
			La lírica procede de canciones acompañadas de la lira, y en la antigua Grecia había dos tipos principales, la personal y la coral. La lírica personal se desarrolló en la isla de Lesbos. El poeta y músico Terpandro, que había nacido en Lesbos pero que vivió casi toda su vida en Esparta, está considerado como el primer poeta lírico griego porque fue el que antes compuso música y poesía. La mayor parte de sus poemas eran nomos o himnos litúrgicos en honor de Apolo, y cantados por un solo intérprete acompañado de la lira.
		</p>
		<p>
			Después de Terpandro aparecieron en el siglo VII a.C. los grandes poetas de Lesbos. Los poemas líricos de Alceo, inventor de la estrofa alcea, hablan de temas políticos, religiosos e intimistas. Safo, la poetisa más importante de la antigua Grecia, creó la estrofa sáfica, aunque escribió también en otras formas líricas. Sus poemas de amor y amistad se encuentran entre los más apasionados y mejor trabajados de la tradición occidental. Los poetas lésbicos, así como varios poetas líricos posteriores de otras ciudades griegas, compusieron en dialecto eólico. En el siglo VI a.C., el poeta Anacreonte escribió alegres poemas sobre el vino y el amor en varios metros líricos; sus obras posteriores, similares en tono y tema, se conocen como anacreónticos. También escribió dísticos (pareados) elegíacos, epigramas y poemas en metros yámbicos.
		</p>
		<p>
			La lírica coral surgió en el siglo VII a.C. obra de poetas que escribieron en dialecto dórico, dominante en la región de Esparta, y que se utilizó incluso en épocas posteriores cuando los poetas de otros lugares de Grecia adoptaban este género lírico. Los poetas espartanos fueron los primeros en escribir de esta forma canciones para celebraciones públicas religiosas. Más tarde lo hicieron para celebrar triunfos personales, como, por ejemplo, una victoria en los juegos olímpicos. Taletas, que viajó de Creta a Esparta para sofocar una epidemia con himnos corales a Apolo, fue probablemente el primer poeta lírico coral. Le siguieron Terpandro, que escribió tanto poemas líricos intimistas como corales; Alcmán, autor sobre todo de partheneia, es decir, himnos procesionales corales cantados por un coro de doncellas y de carácter parcialmente religioso, de tono más ligero que los himnos a Apolo; y Arión, posible creador del ditirambo (forma poética en honor a Dioniso) y del estilo trágico, que se utilizó ampliamente en el drama griego. Entre los grandes escritores posteriores de poemas líricos corales se encuentran el poeta siciliano Estesícoro, contemporáneo de Alceo, que introdujo la forma ternaria de la oda coral, consistente en series de grupos de tres estrofas; Íbico de Reggio, autor de un largo fragmento que se conserva de una oda coral ternaria y de poemas líricos personales eróticos; Simónides de Ceos, cuya lírica coral incluye epinicia, u odas corales en honor de los vencedores en los juegos olímpicos, encomia, o himnos corales en honor a personas concretas, y cantos fúnebres, además de poemas líricos personales que incluyen epigramas; y Baquílides de Ceos, sobrino de Simónides, que escribió epinicios, de los que se conservan trece, y ditirambos, cinco de los cuales han llegado hasta la actualidad.
		</p>
		<p>
			La lírica coral alcanzó su apogeo hacia mediados del siglo V a.C. en las obras de Píndaro, que escribió muchos poemas de este género en todas las formas, incluyendo himnos, ditirambos y epinicios. Se conserva cerca de la cuarta parte de su obra, principalmente epinicios con la estructura trinaria creada por Estesícoro. Las tragedias de la época incluyen muchas odas corales importantes.
		</p>
	</div>
	<div>
		<h3>El teatro</h3>
		<p>
			A inicios de la primavera, las ciudades griegas celebraron fiestas populares en honor a Dionisio, dios del vino. Estas eran parecidas a los carnavales: la gente bailaba cantaba y se emborrachaba en las calles. Unos coros desfilaban por la ciudad, dirigidos por una persona que se llamaba corifeo. Paulatinamente los coros comenzaron a entablar diálogos con el corifeo, lo cual dio origen al establecimiento de parlamentos fijos para cada uno de ellos. De esta manera nació la forma expresiva fundamental del teatro: el dialogo.
		</p>
		<p>
			Con el paso del tiempo algunos interrogantes del coro se especializaron en la recitación de algunos pasajes del parlamento, con lo cual se dio origen a la figura del actor. Al comienzo el número de actores era muy reducido: dos o tres a lo sumo. Sin embargo , junto con el corifeo y el coro conformaron los elementos básicos de la representaciones teatrales en la Grecia antigua.
		</p>
		<p>
			El siguiente paso en la evolución del teatro fue la localización especifica de la representación: se abandona la calle como escenario de los diálogos y se creó un lugar especial: el teatro, un espacio destinado exclusivamente para la representación de los diálogos. Había dos tipos principales de obras, la tragedia y la comedia. Aunque ambas estaban escritas en verso existían entre ellas diferencias notables.
		</p>
	</div>
	<div>
		<h3>La tragedia</h3>
		<p>
			La tragedia, tal y como hoy se la conoce, se cree que fue creada en el siglo VI a.C. por el poeta ateniense Esquilo, que introdujo el papel de un segundo actor, aparte del coro. Sus tragedias, cerca de 90, versan sobre temas tan excelsos como la divinidad y las relaciones de los seres humanos con los dioses. Únicamente siete de sus obras han llegado hasta hoy, entre ellas Prometeo encadenado, que narra el castigo de Zeus al titán Prometeo, y la Orestiada, trilogía que retrata el asesinato del héroe griego Agamenón por su mujer, el de ésta por su hijo Orestes y el posterior destino de Orestes.
		</p>
	</div>
	<div>
		<h3>La comedia</h3>
		<p>
			Uno de los más grandes poetas cómicos fue Aristófanes, cuya primera comedia, Daitaleis, hoy perdida, data del 427 a.C. Empleando la sátira dramática, ridiculizó a Eurípides en Las ranas y a Sócrates en Las nubes. Estas obras representan la antigua comedia de la literatura griega.
		</p>
		<p>
			La comedia griega posterior se divide en dos grupos, la comedia media (400-336 a.C.) y la comedia nueva (336-250 a.C.). En la media, ejemplificada por las dos últimas obras de Aristófanes, La asamblea de las mujeres y Pluto, ambas escritas entre 392 y 388 a.C., la sátira personal y política se reemplaza por la parodia, la ridiculización de los mitos y la crítica literaria y filosófica. Los principales autores de la comedia media fueron Antífanes de Atenas y Alexis de Thruil. Sólo se conservan fragmentos de sus obras.
		</p>
		<p>
			En la comedia nueva, la sátira se sustituye por la comedia social, con tramas y personajes cotidianos y familiares, y temas de amor romántico. El principal autor de esta comedia nueva fue Menandro, cuya influencia alcanzó a los dramaturgos latinos de los siglos III y II a.C., sobre todo a Plauto y Terencio. Se conservan una obra completa de Menandro, El tacaño, y fragmentos de otras.
		</p>
	</div>
	<div>
		<h3>Autores</h3>
		<div>
			<h4>Homero</h4>
			<p>
				Nombre tradicionalmente asignado al famoso autor de la Iliada y la Odisea, las dos grandes epopeyas de la antigüedad griega. Nada se sabe de su persona, y de hecho algunos ponen en duda que sean de él estas dos obras. Sin embargo, los datos lingüísticos e históricos de que se dispone, permiten suponer que los poemas fueron escritos en los asentamientos griegos de la costa oeste de Asia Menor, hacia el siglo IX a.C.
			</p>
			<p>
				La Iliada: Las dos epopeyas narran hechos legendarios que supuestamente ocurrieron muchos siglos antes de la época en que fueron escritas. La Iliada se sitúa en el último año de la guerra de Troya, que constituye el telón de fondo de su trama. Narra la historia de la cólera del héroe griego Aquiles. Insultado por su comandante en jefe, Agamenón, el joven guerrero Aquiles se retira de la batalla, abandonando a su suerte a sus compatriotas griegos, que sufren terribles derrotas a manos de los troyanos. Aquiles rechaza todos los intentos de reconciliación por parte de los griegos, aunque finalmente cede en cierto modo al permitir a su compañero Patroclo ponerse a la cabeza de sus tropas. Patroclo muere en el combate, y Aquiles, presa de furia y rencor, dirige su odio hacia los troyanos, a cuyo líder, Héctor (hijo del rey Príamo), derrota en combate singular. El poema concluye cuando Aquiles entrega el cadáver de Héctor a Príamo, para que éste lo entierre, reconociendo así cierta afinidad con el rey troyano, puesto que ambos deben enfrentarse a la tragedia de la muerte y el luto.
			</p>
			<p>
				La odisea: La Odisea narra el regreso del héroe griego Odiseo de la guerra de Troya. En las escenas iniciales se relata el desorden en que ha quedado sumida la casa de Odiseo tras su larga ausencia. Un grupo de pretendientes de su esposa Penélope está acabando con sus propiedades. A continuación, la historia se centra en el propio héroe. El relato abarca sus diez años de viajes, en el curso de los cuales se enfrenta a diversos peligros, como el cíclope devorador de hombres, Polifemo, y a amenazas tan sutiles como la que representa la diosa Calipso, que le promete la inmortalidad si renuncia a volver a casa. La segunda mitad del poema comienza con la llegada de Odiseo a su isla natal, Ítaca. Aquí, haciendo gala de una sangre fría y una paciencia infinitas, pone a prueba la lealtad de sus sirvientes, trama y lleva a efecto una sangrienta venganza contra los pretendientes de Penélope, y se reúne de nuevo con su hijo, su esposa y su anciano padre.
			</p>
			<p>
				El mérito de Homero no está en la creación de los argumentos, ya que estos fueron tomados de leyendas muy conocida de su época, si no en el bello lenguaje que emplea para relatarlos. A lo largo de la obra se suceden poéticas descripciones y hábiles recursos con los que Homero da vida a sus personajes. El más conocido de estos recursos es el empleo de los epítetos con los que acompaña los nombres de sus protagonistas: Aquiles, el de los pies ligeros; Odiseo, el destructor de las ciudades, atenea, la de los ojos de lechuza, etc. Además, sus personajes son recordados a través de los siglos porque son profundamente humanos: sufren pasiones encendidas, odio y venganza, pero también actúan con lealtad, sienten amor y nostalgia y aceptan las limitaciones que les son impuestas por unos seres superiores: los dioses.
			</p>
		</div>
		<div>
			<h4>Sófocles</h4>
			<p>
				Sófocles nació en Colono Hípico (hoy parte de Atenas) alrededor del año 496 a.C. Hijo de Sofilo, un acomodado fabricante de armaduras, Sófocles recibió la mejor educación aristocrática tradicional. De joven fue llamado a dirigir el coro de muchachos para celebrar la victoria naval de Salamina en el año 480 a.C. En el 468 a.C., a la edad de 28 años, derrotó a Esquilo, cuya preeminencia como poeta trágico había sido indiscutible hasta entonces, en el curso de un concurso dramático. En el 441 a.C. fue derrotado a su vez por Eurípides en uno de los concursos dramáticos que se celebraban anualmente en Atenas. Sin embargo, a partir del 468 a.C., Sófocles ganó el primer premio en veinte ocasiones, y obtuvo en muchas otras el segundo. Su vida, que concluyó en el año 406 a.C., cuando el escritor contaba casi noventa años, coincidió con el periodo de esplendor de Atenas. Entre sus amigos figuran el historiador Heródoto y el estadista Pericles. Pese a no comprometerse activamente en la vida política y carecer de aspiraciones militares, fue elegido por los atenienses en dos ocasiones para desempeñar una importante función militar.
			</p>
			<p>
				Lo más importante para Sófocles era el estudio del alma humana. Sus personales son seres humanos sacudidos por hondas pasiones (el sufrimiento, la traición, la venganza, el deshonor, etc) y agitados por un destino que no pueden controlar con su voluntad. Sófocles no se muestra ajeno al sufrimiento de los hombres, sino que los expone con dramática claridad.
			</p>
			<p>
				Uno de los aspectos más interesantes del estilo de Sófocles es la presentación de la psiquis de los personajes. El conflicto trágico en Sófocles no es el carácter absoluto, es decir, no se plantea en función del cumplimiento de un destino inexorable, sin o que surge el interior del alma humana como una contraposición entre el sujeto y el mundo. En este sentido, los conflictos de las tragedias de Sófocles tiene una dimensión muy interesante. Esta forma básica del conflicto será retomada siglos después en otros géneros típicamente modernos tales como la novela y el drama
			</p>
		</div>
	</div>
	<div>
		<h3>La literatura romana</h3>
		<p>
			A la llegada de los conquistadores romanos, Grecia ya había alcanzado el punto más alto de sus logros culturales e iniciaban la decadencia. Los romanos, entusiasmados por una cultura muy superior a la suya, empezaron por copias los modelos griegos de la arquitectura y escultura. Es así como construyeron templos con columnas y frontis, y también esculpieron retratos realistas al estilo griego. Incluso la mitología griega se trasladó al mundo romano con ligeras modificaciones: cambiaron los nombres de los dioses, pero no las virtudes y poderes que los caracterizaba. Esta adaptación del mundo griego sirvió como fundamento para el florecimiento de las formas artísticas de expresión al interior del imperio.
		</p>
		<p>
			En cuanto a la literatura, los romanos se esforzaron por adaptar a su lengua, el latín, los modelos griegos del teatro, la poesía épica y la lírica. Por eso la literatura romana se considera una prolongación de la griega, pero revitalizada con la energía y la lengua del joven pueblo romano.
		</p>
		<div>
			<h4>Principales periodos de la literatura latina</h4>
			<p>
				La literatura anterior a la conquista de Grecia era bastante rudimentaria. No existían aun los tres géneros literarios clásicos (épica, lírica y teatro) y consistía en pequeñas composiciones poéticas denominadas carmina que se interpretaba en los actos públicos y en las ceremonias religiosas.
				<ul>
					<li>
						SIGLO III Y II a. De C.: EL FLORECIMIENTO DEL TEATRO
						</br>
						El natalicio de la literatura latina suele ubicarse en el año 240 a. De. C. Ese año, los magistrados romanos encargaron al Livio Andrónico, un esclavo griego, que tradujera y adaptara una comedia y una tragedia griegas para ofrecerlas al pueblo romano como un espectáculo más de los juegos públicos. El éxito determinó que desde entonces la representación de este tipo de obras se hiciera habitual. Pero el teatro romano tenía un objetivo muy diferente al del teatro griego: no pretendía la catarsis o purificación de las pasiones, sino que era un espectáculo más, como el circo , cuyo fin era divertir y hacer reír al público. Esto se debe fundamenta a que en el alma romana no existía una conciencia clara del valor ritual que para los griegos tenían las representaciones dramáticas: la puesta en escena de los acontecimientos vividos por los personajes no tenía un sentido trascendental, sino que se contemplaba desde el exterior, sin lograr la identificación que provocaba la catarsis. Por eso, los romanos prefirieron la comedia a la tragedia; y en especial, l presentación de la costumbres situaciones amorosas y de la vida diaria, con presencia de los “personajes tipo” y que culminaba con un final feliz.
					</li>
					<li>
						LA EDAD MEDIA
						</br>
						Nacen las lenguas romances: Tras la caída de Romo, Europa se fragmento y las distintas regiones quedaron aisladas. Como resultado, las diferencias del latín que se habla en cada lugar se fueron haciendo enormes. Así aparecieron las diversas lenguas romances como el castellano, francés, el italiano, el portugués, etc. Entre los siglos V y XII, las obras literarias fueron muy escasas. La mayor parte de ellas eran obras de carácter religioso, escritas en latín por los clérigos de esta época. Son embargo también nos han llegado algunas piezas literarias que pertenecieron a la tradición oral de los pueblos germánicos y anglosajones. Entre ellos destacan la leyenda de los nibelungos, de origen germánico y el Beowulf, un extenso poema épico que es considerado una de las obras más importantes de la historia literaria inglesa.
					</li>
					<li>
						LA LITERATURA ENTRE LOS SIGLOS XII Y XIV
						</br>
						En el comienzo de toda literatura es frecuente que los géneros literarios no aparezcan en estado puro. Esto es lo que sucede también en la literatura medieval. Por es, existen diversas composiciones difíciles de encasillar en un genero determinado. Tal acontece, por ejemplo, con los famosos debates o disputas que tanto prestigio tuvieron en la literatura provenzal. El género que aparece antes es la lírica. Las primeras composiciones líricas suelen ser cancioncillas, puestas generalmente en labios de una mujer, que se recitaban durante el transcurso de algunos actos solemnes o cotidianos. Después de la lírica surge la épica, género que permite narrar hazañas de unos héroes colectivos en la formación de los pueblos. Mas inciertos son los orígenes del teatro medieval, acaso ligados a representaciones de carácter religioso. Las celebración de la liturgia en la que un celebrante el sacerdote es respondido por un coro los fieles lleva en si el germen del teatro y solo cabe esperar que esta representación se formalice y se independice como pieza teatral. La prosa, por su parte, es de aparición posterior al verso y coincide generalmente con la consolidación de las lenguas romances. A partir del siglo XII, y como consecuencia de la consolidación de las lenguas romances, empezó a desarrollarse en Europa una importante literatura compuesta en los primitivos dialectos que dieron origen al castellano, al francés y al italiano. 
					</li>
					<li>
						EL RENACIMIENTO
						</br>
						Corriente artística y literaria que predominó en Europa entre los siglos XV y XVI. Debe su nombre al hecho de que significo el resurgimiento del arte y la cultura grecolatina de la antigüedad. Para muchos, el renacimiento significó un cambio profundo en todos los órdenes de la vida.  Los escritores renacentistas tuvieron como modelo la obra de los autores clásicos, particularmente de los latinos Horacio, Virgilio y Ovidio. Sin embargo , y a pesar de la fuerte influencia grecolatina, durante esta época surgieron algunos de los más grandes autores de la literatura universal. Ellos, guiados por los principios clásicos de belleza y armonía, renovación la lengua poética y crearon nuevas formas de expresión. Durante la edad media las obras literarias perseguían casi siempre un fin didáctico o moralizador; la función artística quedaba subordinada al propósito de enseñar o instruir en las verdades de la moral y la religión. Durante el Renacimiento, en cambio , predominó en el arte una intencionalidad estética, y los poetas concibieron por lo general sus creaciones literarias como obras de arte. De ahí el esmero con el que los escritores renacentistas cuidaron la forma de sus obras. Fue un poeta nacido en la época medieval, aunque de espíritu renacentista, el italiano Francesco Petrarca, quien proporcionó las nuevas claves de la obra literaria. Su concepto idealizo del amor, su imagen de la mujer amada y el sentido plástico y armónico de la belleza en la composición del poema marcaron las pautas de la poesía durante el siglo XVI.
						</br>
						Obras y autores más representativos
						</br>
						<img src='https://drive.google.com/uc?id=1dcnRyMeqzBhfNVuSuk0lRYCKVRvWSY3E' alt='El renacimiento' />
						
					</li>
					
					<li>
						LITERATURA NEOCLÁSICA 
						</br>
						El neoclasicismo fue un movimiento literario iniciado en Francia en el siglo XVII y todo el siglo XVIII, se preocupó por restaurar el gusto y normas de la antigüedad, especialmente de la cultura griega y romana y del período Renacentista, es también conocido como el “Siglo de las luces”. En esta etapa de la literatura, el hombre pone más énfasis en el uso de la razón, y convirtió a la razón en la facultad generadora de la obra de arte, que la expresaban de manera natural; Todo esto era con la finalidad de romper con lo superstición fomentada durante el barroco. Aquí el hombre hacia sus creaciones, pero en base a la razón y lo natural, tanto así que a veces solían parecer muy simples sus obras. En pocas palabras el hombre de esta época consideraba a la razón como fuente primaria de la verdad.
						</br>
						Obras y autores más representativos
						</br>
						<img src='https://drive.google.com/uc?id=1Qh2QB5vBq8QGXvJTCbjaXXZqecLkuCG1' alt='Neoclásica' />
					</li>
					<li>
						LITERATURA ROMÁNTICA
						</br>
						El periodo conocido como Romanticismo, es la manifestación de una crisis ideológica, política, analítica y social. Es la búsqueda de la libertad, la exaltación del sentimiento y de la pasión. Este periodo de la historia tiene su inicio en la primera mitad del siglo XVII y principios del siglo XIX. En el romanticismo se busca la expresión del sentimiento y la pasión. Desecha las reglas establecidas, en la realidad política se busca la libertad, al igual que en la expresión literaria. El hombre de este momento toma profunda conciencia de sí mismo y de sus derechos, y por esto el arte romántico le va servir para expresar con absoluta libertad sus sentimientos, sus deseos, sus esperanzas, sus sueños, sus incongruencias, sus locuras, sus miedos, ya que es un arte libre que permite sacar la exaltación vital de este nuevo hombre, un hombre que quiere gritar, llorar, reírse a carcajadas, temer a la muerte, a la soledad; poner en un altar lo divino, el ser amado, el heroísmo y, en fin, la libertad.
						</br>
						Obras y Autores más representativos:
						</br>
						<img src='https://drive.google.com/uc?id=1ENi4MWlEFzQveW5Tz1zA1Of-kwIAq7Et' alt='Romántica' />
					</li>
					<li>
						LITERATURA REALISTA Y NATURALISTA
						</br>
						El periodo del realismo abarca la segunda mitad del siglo XIX, y el término realismo y realista se utilizaron en Francia para designar, peyorativamente, a obras cuyo tema era sacado de la vida cotidiana, término que con el tiempo se aplicó al arte que tenía como finalidad reflejar objetiva y verazmente la vida diaria. En este periodo el hombre busca darle un nuevo equilibrio al arte, ya que el romanticismo, llego a caer en la exageración, en cambio en el realismo, el hombre propone volver a la realidad y dejar atrás el mundo ideal y subjetivo, prefiere lo objetivo y lo racional. El hombre del realismo rechaza las exaltaciones emotivas y la búsqueda idealista para centrarse en lo real.
					</li>
					<li>
						NATURALISTA
						</br>
						Corriente literaria europea de finales del siglo XIX desarrollada fundamentalmente entre 1880 y 1900. El naturalismo es una forma de concebir la existencia humana y un método para estudiar y transcribir el comportamiento humano. El naturalismo presenta seres humanos, cuyas actuaciones obedecían a sus instintos. El hombre del naturalismo estudiaba, y explicaba los hechos y las conductas humanas como producto de fuerzas físicas gobernadas por las circunstancias que controlan su entorno.
						</br>
						Obras y Autores más representativos:
						</br>
						<img src='https://drive.google.com/uc?id=1oKIETcp-SNH76Mlknu2W8BBRtmyUyiVR' alt='Naturalista' />
					</li>
					<li>
						LITERATURA DEL MODERNISMO Y GENERACIÓN DEL 98 
						</br>
						A este periodo del modernismo y generación del 98 se le conoce históricamente, como “el fin de siglo”, y tiene lugar los últimos años del siglo XIX y principios del XX. La manera de percibir la realidad en este periodo, se da de dos maneras fundamentales, según los filósofos que mayor influencia tuvieron: kierkegaard consideraba que la fe cristiana no puede hallarse por medio de la racionalización, si no con el sentimiento, de igual manera el hombre llega a conocer a Dios después de conocer su interior. En cuanto a Bergson y Nietzche son vitalistas, es decir se oponen al racionalismo: la vida es el valor fundamental, el hombre puede convertirse en superhombre por su propia voluntad; es por la intuición y no por la razón que obtenemos en el conocimiento directo e inmediato de las cosas. En el modernismo el hombre busca un mundo nuevo, moderno, audaz y emprendedor.
					</li>
					<li>
						MODERNA
						</br>
						El modernismo gozó de los principios del parnaso y simbolismo y se caracterizó por: Repudio de lo convencional y dogmático, Rebeldía contra los convencionalismos sociales. Revaloración de la antigüedad indígena., Afrancesamiento. Cosmopolitismo, El erotismo como muestra máxima de rebeldía, al cual se oponen en la efusiva religiosidad y el misticismo. El modernismo se inspiró en otras dos escuelas literarias: el Parnaso y el simbolismo. El parnasianismo, instauró el culto a la perfección formal. El simbolismo persiguió un mundo profundo y sensible, símbolo o reflejo de la realidad existente.
						</br>
						<img src='https://drive.google.com/uc?id=1R6c6gARBfyOmgqaGoWv6z0FuAAfwdzBN' alt='Moderna' />
					</li>
					<li>
						VANGUARDISMO 
						</br>
						Este periodo abarca la primera mitad del siglo XX. El termino vanguardia se utiliza para designar a todas aquellas tendencias artísticas que aparecen en la primera mitad de este siglo, y que tienen como finalidad oponerse a lo anterior, al proponer nuevos conceptos y técnicas. El hombre de este periodo, busca romper con todo lo que se había venido dando anteriormente, es decir, busca entrar en una nueva etapa, que no se hubiera visto antes, y todo eso se puede ver o percibir en las características del arte de este periodo.
						</br>
						Obras y Autores más representativos:
						</br>
						<img src='https://drive.google.com/uc?id=1bH_xtaaNATmfs8dZggX9UPQUgg8IUuYv' alt='Vanguardismo' />
					</li>
					<li>
						LITERATURA CONTEMPORÁNEA 
						</br>
						Este periodo a partir de la segunda mitad del siglo XX se presenta en un ambiente de intranquilidad y protesta, debido a las circunstancias del momento. El hombre de nuestros tiempo vive más preocupado quizás, que el hombre de la antigüedad, porque sus miedos, ya no son a decir lo que siente, si no a que si lo dice, puede ser presa de un secuestro, o de la misma drogadicción que cada ves va en decremento, debido que el salario de los empleados se va empobreciendo, sienten la necesidad de hacerse dependientes de algún tipo de vicio, según ellos para olvidar muchos de los problemas que cada uno como persona acarrea en la vida.
						</br>
						Obras y Autores más representativos:
						</br>
						<img src='https://drive.google.com/uc?id=1n4EToeFojj7IT3jhZ6bxpSofDRaHfstE' alt='contemporánea' />
					</li>
					<li>
						BOOM LATINOAMERICANO
						</br>
						Este periodo se inicia con el padre y maestro del 'Boom' latinoamericano, lo cual se hacer referencia a la sorpresa del mundo occidental cuando se leyeron las obras de Rulfo, Fuentes, Cortázar, Paz, Vargas Llosa, Carpentier, García Márquez. En esta parte de la historia me referiré más acerca de la forma de ver el mundo de los escritores, que fueron quienes iniciaron este movimiento, que más que literario, fue revelación a escribir acerca de los movimientos que antes se mencionan, retomando el romanticismo, naturalismo, barroco, vuelven a lo clásico, pero sobre todo adoptan una nueva conciencia profesional. En general los poetas actuales prefieren volver los ojos a su intimidad que manifestarse a favor de alguna ideología.
						</br>
						Obras y Autores más representativos:
						</br>
						<img src='https://drive.google.com/uc?id=1_1YEDwS0zHOeTvaQ_bQsKNJUa6G2ENtP' alt='latinoamericano' />
					</li>
				</ul>
			</p>
		</div>
	</div>", 'GRAMÁTICA Y VOCABULARIO');""",
  ];
}
