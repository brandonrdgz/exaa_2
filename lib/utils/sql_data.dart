import 'package:exaa_2/services/db_provider.dart';

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
  /*static List<String> insertRecordsSubtopic = [
    """INSERT INTO SUBTOPIC (name_subtopic, content_subtopic, name_topic)
    VALUES ('COMA', "<div> <h1>This is a title</h1> <p>This is a <strong>paragraph</strong>.</p> <p>I like <i>dogs</i></p> <p>Red text</p> <ul> <li>List item 1</li> <li>List item 2</li> <li>List item 3</li> </ul> <img src='https://www.kindacode.com/wp-content/uploads/2020/11/my-dog.jpg' /> </div>", 'PUNTUACIÓN');""",
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
  ];*/

  //ESTRUCTURA DE LA LENGUA

//ORTOGRAFÍA GENERAL

  static List<String> insertRecordsSubtopic = [
    """INSERT INTO SUBTOPIC VALUES ('Reglas del acento',"<div>
    <h3>Reglas del acento</h3>
    <p>Llevan acento ortográfico:
      <ul>
        <li>
          Las palabras agudas terminadas en vocal y en las consonantes n - s. Ejemplo: café, compás, león, manatí.
        </li>		
        <li>
          Las palabras graves o llanas terminadas en consonante, que no sean n - s. Ejemplo: árbol, cáliz, carácter.
        </li>
        <li>
          Todas las palabras esdrújulas. Ejemplo: cántaro, húmedo, héroe
        </li>
      </ul>
    </p>
    <div>
      <h4>Casos particulares</h4>
        <ul>
          <li>
            Los monosílabos no llevan acento, menos:
            <ul>
              <li>
                Sí (adverbio de afirmación, nombre, pronombre), para no confundirlo con si (conjunción). Ejemplo: Si me dices que sí, vendrás de paseo.
              </li>
              <li>
                Dé y sé (verbos), para no confundirlos con de (preposición) y se (pronombre). Ejemplo: Sé que debo estudiar. No se puede.
              </li>
              <li>Él - tú - mí (pronombres) para no confundirlos con el (artículo) y tu - mi (adjetivos). Ejemplo: ¿Tú quieres ir? Eso es para mí.
              </li>
              <li>
                Más (adverbio), para no confundirlo con mas (conjunción). Ejemplo: Quiero más pan, mas no tostado.
              </li>
              <li>
                La conjunción o llevará acento cuando esté colocada entre números, para no confundirla con el cero. Ejemplo: Tengo 8 ó 9 estampas.- Iré hoy o mañana.
              </li>
              <li>
                Aún (adverbio de tiempo) llevará acento cuando sea sinónimo de «todavía». Ejemplo: El yate no ha venido aún al puerto.
              </li>
            </ul>
          </li>
          <li>
            Los monosílabos verbales fue, fui, vio y dio se escribirán sin acento ortográfico. Ejemplo: Juan fue al parque, vio los leones y después dio un largo paseo.
          </li>
          <li>
            Las palabras que - quien - cuan - cuando - cuanto-donde-como llevarán acento siempre que se usen en forma admirativa, interrogativa o dubitativa. Ejemplo: ¡Cuánta gente en la calle! ¿Quién llama? No sé cómo decírtelo. ¿Dónde vives?
          </li>
          <li>
            Cuando una palabra termina en io-ia, sobre la i colocaremos un acento, deshaciéndose el diptongo. Ejemplo: Alegría, caserío, gentío, María. Excepto las palabras graves o llanas terminadas en estas vocales. Ejemplo: Guardia, garfio, media, radio, feria.
          </li>
          <li>
            Sobre las letras mayúsculas colocaremos acento ortográfico siempre que por las reglas generales del acento les corresponda llevarlo. Ejemplo: Álvaro. Árbol. Él es muy aplicado.
          </li>
          <li>
            Cuando un vocablo simple entre a formar parte de un compuesto como primer complemento de este, se escribirá sin el acento ortográfico que como simple le habría correspondido. Ejemplo: decimoséptimo, asimismo, piamadre. Se exceptúan de esta regla los adverbios terminados en -mente, como ágilmente, cortésmente
          </li>
        </ul>
      </div>
      <div>
        <h4>Reglas generales</h4>
        <p>
          Delante de p y b siempre se escribe m y nunca n.
          Ejemplo: Bombilla, lámpara.
          </br>
          Se escribe d a fin de palabra cuando el plural lo hace en des.
          Ejemplo: De bondad, bondades.
          </br>
          Se escribe z a fin de palabra cuando el plural lo hace en ces. 
          Ejemplo: De juez, jueces.
          </br>
          Se escribe y a fin de palabra cuando no sean agudas terminadas en esta vocal. 
          Ejemplo: Muy, rey, ley, hoy, doy, voy.
          Excepciones: Colibrí, manatí, hurí.
          </br>
          Después de las consonantes l-n-s y al principio de palabra, se escribe r aunque se lea como rr. 
          Ejemplo: Alrededor, honra, Israel, rabia.
          </br>
          Se escriben con mayúscula los nombres propios, al empezar un escrito y después de punto. 
          Ejemplo: José, Morelia, Ebro, Ibérica.
          </br>
          Las palabras derivadas se escriben con la misma ortografía que las primitivas de donde proceden, menos las siguientes:
          </br>
          De hueco, oquedad. De huérfano, orfandad, orfanato. De hueso, óseo, osario, osamenta. De huevo, oval, ovoide, ovíparo. De Huelva, onubense. De Huesca, oscense
        </p>
      </div>
      <div>
        <h4>Reglas de la h</h4>
        <p>
          Se escriben con h: Las palabras que empiezan por hipo-hidro - hiper, como: hipócrita - hidrógeno - hipérbola. Las palabras que empiezan por hue - hui - hia - hie, como: hueco - huida - hiato - hielo.
          </br>
          Las palabras que empiezan por hu más m más vocal, como: humedad - humano.
          Todos los tiempos de los verbos haber, hacer, hablar, hallar y habitar, como: hubo - hago - hallo - hablo - habito.
        </p>
      </div>
      <div>
        <h4>Reglas de la g</h4>
        <p>
          Se escriben con g: Las palabras que empiezan por in, menos: injerto - injertar, como: indígena - ingeniero. Las palabras que empiezan por gen, menos: Jenaro - jenable - jengibre, como: genio - gente. Las palabras que terminan en gen - gente, menos: comején - jején, como: imagen - urgente. Las palabras que terminan en ger - gir - igerar, menos: mujer - tejer - crujir - desquijerar, como: proteger - afligir - aligerar.
        </p>
      </div>
      <div>
        <h4>Reglas de la j</h4>
        <p>
          Se escriben con j: Las palabras que empiezan por aje - eje, menos: agencia, agenda, agente, como: ajedrez, ejercer. Las palabras que terminan en aje - eje, menos: protege, como: coraje, hereje. Las palabras que terminan en jero - jera - jeria, menos: aligero-flamígero-belígero-ligero. Las palabras que terminan en jear, como: canjear - cojear.
        </p>
      </div>
      <div>
        <h4>Reglas de la m</h4>
        <p>
          Se escribe m a fin de sílaba cuando la sílaba siguiente empieza por na, ne, ni, no, como: columna - alumno - solemne - amnesia, menos: perenne, y los compuestos de las preposiciones en - in – con sin, como: ennoblecer, innovar, connatural, sinnúmero
        </p>
      </div>
      <div>
        <h4>Reglas de la ll</h4>
        <p>
          Se escriben con ll: Las palabras que empiezan por fa - fo - fu, como: falleba - folleto - fullería. Las palabras que terminan en illo - illa, como: ovillo - pastilla.
        </p>
      </div>
      <div>
        <h4>Reglas de la x</h4>
        <p>
          Se escriben con x: Las palabras que empiezan por extra, menos: estrada – estrafalario, estragar, estrangular – estratagema, estraza, como: extraño - extravío. Delante de las sílabas pla - ple - pli – plo - pre - pri - pro, menos esplendor y espliego, como: explotar, expresar, exprimir.
        </p>
      </div>
      <div>
        <h4>Reglas de la b</h4>
        <p>
          Se escriben con b: Las palabras que empiezan por al, menos: Álvaro - alvéolo - altavoz - altivez, como: albañil, alboroto. Las palabras que empiezan por es, menos: esclavo - esclavina - esclavitud, como: esbelto, escarbar. Las palabras que empiezan por ab - ob, como: abdicar, objeto. Las palabras que empiezan por bu - bur - bus, como: bujía, burbuja, busto. Las palabras que empiezan por bien, menos: Viena -viento - vientre, como: bienvenido, bienestar. Las palabras que terminan en bilidad, menos: movilidad - civilidad, como posibilidad. Las palabras que terminan en bundo - bunda, como: meditabundo, moribunda. Las palabras que terminan en probar, como: aprobar, comprobar. Las terminaciones del pretérito imperfecto del indicativo de los verbos, que en infinitivo terminan en ar, y también el mismo tiempo del verbo ir (iba - ibas - iba - íbamos - ibais - iban), como: amaba, rezábamos, llorabais, iban.
        </p>
      </div>
      <div>
        <h4>Reglas de la v</h4>
        <p>
          Se escriben con v: Las palabras que empiezan por di, menos: dibujo - dibujar - dibujante, como: divino, diversión. Las palabras que empiezan por vice-villa, menos: billar - bíceps, como: viceversa, villanía. Las palabras que empiezan por ad, como: adverbio, adversario. Las palabras que empiezan por lla - lle - llo - llu, como: llave, llevar, llover, lluvia. Las palabras que empiezan por pre - pri - pro - pol, menos: prebenda - probar - probeta - probo, como: prevenir, privar, provecho, polvo. Las palabras que terminan en venir, como: convenir, prevenir. Las palabras que terminan en tivo - tiva - tivamente, como: caritativo, activa, positivamente. Las palabras que terminan en ava - ave- avo; eva - eve - evo; iva - ive - ivo, menos: haba, jarabe, cabo; prueba, debe, sebo; arriba, caribe, recibo, y algunas más.
        </p>
      </div>
  </div>",'ORTOGRAFÍA GENERAL');""",
    """INSERT INTO SUBTOPIC VALUES ('La coma',"<div>
		<h3>La coma</h3>
		<ul>
			<li>
				El nombre en vocativo llevará una coma detrás de sí cuando estuviere al principio de lo que se diga, y en otros casos la llevará antes y después: ¡Amigos, ayudadme!; Pedro, ven; Por favor, Rubén, haz lo que te digo.
			</li>
			<li>
				Siempre que en lo escrito se empleen dos o más partes de la oración consecutivas y de una misma clase, se separarán con una coma para que al leerlas haya de hacerse una leve pausa que separe su sentido. Se excepcionan los casos en que mediare alguna de las conjunciones y, ni, o. Roberto, Rubén y Pedro; alto, delgado y rubio; vine, vi y vencí; ni corto ni perezoso; sobresaliente, notable o aprobado.
			</li>
			<li>
				Con la coma también se dividen los distintos miembros independientes entre sí de una cláusula, vayan o no precedidos de conjunción: Todos mataban, todos se compadecían, ninguno sabía detenerse; Al apuntar el alba cantan las aves, y el campo se alegra, y el ambiente cobra movimiento y frescura.
			</li>
			<li>
				Cuando una oración se interrumpe, bien para citar o para indicar el sujeto o la obra de donde se ha tomado o porque se inserta como de paso otra que aclara o amplía lo que se está diciendo, esas palabras, que suspenden momentáneamente el relato principal, se encierran entre dos comas: La esperanza, dice el refrán popular, es lo último que se debe perder; Los vientos del sur, que en aquellas abrasadas regiones son muy frecuentes, ponen en grave conflicto a los viajeros.
			</li>
			<li>
				Igualmente suelen ir precedidas y seguidas de coma las expresiones esto es, es decir, en fin, por último, por consiguiente, sin embargo, no obstante, y otras parecidas: Anoche, sin embargo, el cielo comenzó a nublarse; Juan, por consiguiente, sacó su ropa de invierno.
			</li>
			<li>
				Cuando se invierte el orden regular de las oraciones de la cláusula, adelantando lo que había de ir después, debe ponerse una coma al fin de la parte que se anticipa: Donde interviene conocerse las personas, tengo para mí, aunque simple y pecador, que no hay encantamento alguno. Como el orden regular de este ejemplo de Cervantes, Quijote, I, 37, seria: No hay encantamento alguno donde interviene conocerse las personas , importa para la claridad que se haga una breve pausa en personas, la cual se indica con la coma. Es de advertir que en las transposiciones cortas y muy perceptibles no se ha de poner esta señal.
			</li>
			<li>
				
			</li>
		</ul>
	</div>",'PUNTUACIÓN');""",
    """INSERT INTO SUBTOPIC VALUES ('El punto y coma','<div>
		<h3>El punto y coma</h3>
		<ul>
			<li>
				Cuando los miembros de un período constan de más de una oración, por lo cual o por otra causa llevan ya alguna coma, se separarán con punto y coma unos y otros: Vinieron los aquilones de noviembre, glaciales y recios; arrebataron sus hojas a los árboles, llevándolas, ya rodando por la tierra, ya volando entre nubes de grueso polvo. se guareció el rabadán en su cabaña, y el labrador en su alquería; la nieve, descendiendo espesa sobre el monte y el valle, borró los matices del suelo, toda la variedad riquísima de la Naturaleza.
			</li>
			<li>
				En todo período de alguna extensión se pondrá punto y coma antes de las conjunciones adversativas mas, pero, aunque, etc.; verbigracia: Salieron los soldados a media noche y anduvieron nueve horas sin descansar; pero el fatal estado de los caminos malogró la empresa. Cuando la cláusula sea corta, bastará una simple coma antes de la conjunción; como en Vendrá, pero tarde; Lo hizo, aunque de mala gana.
			</li>
			<li>
				Siempre que a una oración sigue, precedida de c onjunción, otra oración que, en orden a la idea que expresa, no tiene perfecto enlace con la anterior, hay que poner al fin de la primera punto y coma: Pero nada bastó para desalojar al enemigo, hasta que se abrevió el asalto por el camino que abrió la artillería; y se observó que uno solo, de tantos como fueron deshechos en este adoratorio, se rindió a la merced de los españoles (Solís, Historia de Nueva España, III, 7) . Si después de la palabra artillería solo se pusiese coma, la oración y se observó, etc., vendría regida de la preposición hasta y cambiaría el sentido.
			</li>
		</ul>
	</div>','PUNTUACIÓN');""",
    """INSERT INTO SUBTOPIC VALUES ('Los dos puntos','<div>
		<h3>Los dos puntos</h3>
		<ul>
			<li>
				Cuando se sienta una proposición general y en s eguida se comprueba y explica con otras oraciones, se la separa de estas por medio de los dos puntos: No aflige a los mortales vicio más pernicioso que el juego: por él gentes muy acomodadas han venido a parar en la mayor miseria, y aun en el patíbulo; por él, además del caudal, pierde el hombre la vergüenza y hasta la estimación de sí propio.
			</li>
			<li>
				Cuando a una o varias oraciones sigue otra que es consecuencia o resumen de lo que antecede, esta se ha de separar con dos puntos: Aquel que por sus riquezas y esplendor fue tan aplaudido como envidiado cuando entraba triunfante por las puertas de Constantinopla, y cuyo nombre era respetado y temido desde la capital del Imperio hasta el confín de los arenales de la Líbia, murió ciego, pobre, olvidado y mendigando su alimento de puerta en puerta:¡raro y espantoso ejemplo de las vicisitudes de la fortuna!
			</li>
			<li>
				En los decretos y sentencias, bandos y edictos se ponen dos puntos al final de cada motivo o fundamento de la resolución, aunque estos van en párrafos distintos y principian con letra mayúscula. En certificaciones y memoriales también se ponen dos puntos antes de ciertos párrafos con letra inicial mayúscula.
			</li>
			<li>
				Citando palabras textuales, se han de poner dos puntos antes del primer vocablo de la cita, el cual suele principiar con mayúscula: Cicerón en sus Oficios dice a este propósito lo siguiente: No hay cosa que tanto degrade al hombre como la envidia.
			</li>
			<li>
				También se emplean los dos puntos después del M uy señor mío y otras expresiones semejantes con que se suele dar principio a las cartas: Muy señor mío: Sírvase usted tomar a su cargo, etc.; Amigo mío: En contestación a la estimada de usted, etc. Después de los dos puntos se escribe indistintamente con letra mayúscula o minúscula el vocablo que sigue.
			</li>
		</ul>
	</div>','PUNTUACIÓN');""",
    """INSERT INTO SUBTOPIC VALUES ('El punto','<div>
		<h3>El punto</h3>
		<p>
			Se pone punto cuando el período forma sentido completo, en términos de poderse pasar a otro nuevo sin quedar pendiente la comprensión de aquel. Es la mayor pausa sintáctica que la ortografía señala.
		</p>
		<p>
			En la lectura, la duración de la pausa indicada por el punto puede variar más o menos, según el sentido y la interpretación del lector; pero en todo caso, es mayor que la que señalan la coma y el punto y coma.
		</p>
		<p>
			En la escritura, se le llama punto y seguido (o punto seguido), cuando el texto continúa inmediatamente después del punto en el mismo renglón, o en el siguiente sin blanco inicial; y punto y aparte (o punto aparte), cuando termina párrafo, y el texto continúa en otro renglón más entrado o saliente que los demás de la plana. Por último, punto final es el que acaba un escrito o una división importante del texto (parte, capítulo, etc.).
		</p>
		<p>
			Resta advertir que en toda clase de escritos suelen hacerse después del punto final ciertas separaciones o divisiones llamadas párrafos, cada una de las cuales ha de empezar en renglón distinto de aquel en que acabe el anterior, y más adentro que las otras líneas de la plana. Deben principalmente usarse tales divisiones cuando se va a pasar a diverso asunto, o bien a considerar el mismo desde otro aspecto.
		</p>
	</div>','PUNTUACIÓN');""",
    """INSERT INTO SUBTOPIC VALUES ('Los puntos suspensivos','<div>
		<h3>Los puntos suspensivos</h3>
		<ul>
			<li>
				Cuando conviene al escritor dejar la oración incompleta y el sentido suspenso, lo denota con los puntos suspensivos: Él concitó la plebe contra los patricios; él acaudilló y juramentó a los mozos más corrompidos y perversos de la República para subvertirla con su auxilio; él sobornó con oro y con promesas... Pero ¿a qué repetir lo que a todos es notorio?
			</li>
			<li>
				Si en una cláusula de completo sentido gramatical se necesita pararse un poco, expresando temor o duda, o para sorprender al lector con lo inesperado de la salida, se indicará la pausa con puntos suspensivos: ¿Le diré que ha muerto su padre?... No tengo valor para tanto; Se citó a junta, distribuyéronse centenares de esquelas, y llegamos a reunirnos... cuatro personas.
			</li>
			<li>
				También se usan dichos puntos cuando se copia a algún texto o autoridad los cuales no hace al caso insertar íntegros, indicando así lo que se omite.
			</li>
		</ul>
	</div>','PUNTUACIÓN');""",
    """INSERT INTO SUBTOPIC VALUES ('La interrogación y la admiración','<div>
		<h3>La interrogación y la admiración</h3>
		<p>
			Los signos de interrogación y de admiración se ponen al principio y al fin de la oración que deba llevarlos: ¿Dónde estás?; ¿A qué vienes?; ¿Te veré mañana?; ¡Qué asombro!; ¡Ay de mí!
		</p>
		<p>
			Si las oraciones con interrogación o admiración son varias, breves y seguidas, no hay necesidad de que, exceptuada la primera, empiecen con mayúscula: ¿Dónde has estado?, ¿qué has hecho en tantos días?, ¿como no te pusiste en camino, así que recibiste mi carta?; ¡Cuánto engaño!, ¡cuánta perfidia!, ¡qué impudencia!
		</p>
		<p>
			Cuando lo escrito después de la interrogación o la admiración fuere complemento de la pregunta o de la frase admirativa, no comenzará con letra mayúscula: ¿Digo yo que no tengas razón?, contestó Blas a Diego; ¡A las armas!, gritaron todos.
		</p>
		<p>
			El signo de principio de interrogación o admiración se ha de colocar donde empieza la pregunta o el sentido admirativo, aunque allí no comience el período: Privado del racional discurso, ¿que es el hombre sino una criatura desvalida, inferior a los brutos? Y si la caprichosa fortuna lo encumbra en alto puesto, ¡cuántas lágrimas y ruina y sangre le cercarán en torno!
		</p>
		<p>
			El signo de principio de interrogación o admiración refleja el movimiento de la entonación en las frases de este tipo, da claridad a la escritura, y no debe suprimirse por imitar, con mal acuerdo, la ortografía de lenguas extranjeras, que solo usa el signo final.
		</p>
		<p>
			Hay cláusulas que son al par interrogativas y admirativas, y en ellas podrá ponerse nota de admiración al principio y de interrogación al fin, o viceversa: ¡Que esté negado al hombre saber cuándo será la hora de su muerte? ¿Qué persecución es esta, Dios mío!
		</p>
	</div>','PUNTUACIÓN');""",
    """INSERT INTO SUBTOPIC VALUES ('El paréntesis','<div>
		<h3>El paréntesis</h3>
			<ul>
				<li>
					Cuando se interrumpe el sentido y giro del disc urso con una oración aclaratoria o incidental y esta es larga o tiene conexión escasa con lo anterior, se encierra dentro de un paréntesis, como en el siguiente ejemplo: Acostados todos en un género de lechos que rodeaban la mesa (pues los romanos comían tendidos y soslayado el cuerpo sobre el codo izquierdo), empezó a echarles en cara la tibieza de su fe, etc.
				</li>
				<li>
					En este ejemplo se ha puesto como después del p aréntesis porque allí finaliza el miembro del periodo con que va unida la oración comprendida en el paréntesis; y al fin de él o dentro se ha de usar, además, la puntuación que la cláusula necesitare. Cuando el paréntesis termine la cláusula de que depende, el punto final irá fuera.
				</li>
				<li>
					En las obras dramáticas suele encerrarse entre paréntesis lo que los interlocutores dicen aparte. Para que tales paréntesis no se confundan con otros convendría valerse de los rectangulares, en esta forma [ ], que algunos impresores usaban en el siglo pasado. El punto final de los apartes va colocado dentro del paréntesis.
				</li>
				<li>
					Se emplea también el paréntesis curvo para ence rrar en él noticias o datos aclaratorios, explicaciones de abreviaturas, etc.; y el rectangular, para indicar en la copia de códices o inscripciones lo que falta en el original y se suple conjeturalmente. Ejemplos: El hijo del rayo de guerra, Carlos V (D. Juan De Austria); Perdió Boabdil a Granada en la hégira 897 (1492); Imp(eratori) Caes(ari) [Nervae] Traiano [Aug(usto)] p(ontifici) m(aximo). etc.
			</ul>
	</div>','PUNTUACIÓN');""",
    """INSERT INTO SUBTOPIC VALUES ('La diéresis o crema','<div>
		<h3>La diéresis o crema</h3>
		<p>
			El uso de la diéresis solo es preceptivo para indicar que ha de pronunciarse la u en las combinaciones gue, gui: pingüe, pingüino, argüir.
		</p>
		<p>
			Queda a salvo el uso discrecional cuando, por licencia poética o con otro propósito, interese una pronunciación determinada.
		</p>
	</div>','PUNTUACIÓN');""",
    """INSERT INTO SUBTOPIC VALUES ('Las comillas','<div>
		<h3>Las comillas</h3>
		<p>
			Para distinguir las palabras sobre las cuales quiere el que escribe llamar particularmente la atención del lector, se subrayan en lo manuscrito; y en lo impreso se ponen de letra cursiva, y a veces con versales u otras que resalten por su figura o su tamaño. Se practica lo mismo con las voces o citas en idioma extranjero, con el texto literal de citas en castellano, con los títulos de libros y con las dicciones y cláusulas que en las obras de enseñanza y otras se ponen, por ejemplo. Mas cuando las cláusulas de este género tienen alguna extensión o llenan varias líneas, se les suelen poner comillas inversas al principio de cada uno de los renglones que ocupan: Dice un escritor célebre: «El hombre tiene aptitud, por su naturaleza, para habitar en todos los países del mundo: en los arenales del desierto, en los montes más encumbrados, en los climas polares puede vivir y propagarse. No así los animales, que, sujetos a más estrechos límites, perecen fuera de ellos o arrastran vida penosa.»
		</p>
		<p>
			Las comillas simples se usan al principio y al final de una palabra o frase incluidas como cita o puestas de relieve dentro de un texto entrecomillado más extenso. También se emplean para indicar que una palabra está usada en su valor conceptual o como definición de otra, ejemplo: espiar acechar.
		</p>
	</div>','PUNTUACIÓN');""",
    """INSERT INTO SUBTOPIC VALUES ('El guion','<div>
		<h3>El guion</h3>
		<p>
			Cada vocablo de por sí, ya simple, como guardia, poner, ya compuesto, como salvaguardia, reponer, se ha de escribir aislado, o con entera separación del que le preceda o siga. Sin embargo, en la escritura hay necesidad muchas veces de dividir una palabra, y entonces se ha de observar lo siguiente:
			<ul>
				<li>
					Cuando al fin del renglón no cupiere un vocablo entero, se escribirá solo una parte, la cual siempre ha de formar sílaba cabal. Así, las palabras con-ca-vi-dad, pro-tes-ta, sub-si-guien-te, podrán dividirse a fin de renglón por donde señalan los guiones que van interpuesto en dichas voces, mas no de otra suerte.
				</li>
				<li>
					Esto, no obstante, cuando un compuesto sea claramente analizable como formado de palabras que por sí solas tienen uso en la lengua, o de una de estas palabras y un prefijo, será potestativo dividir el compuesto separando sus componentes, aunque no coincida la división con el silabeo del compuesto. Así, podrá dividirse no-sotros o nos-otros, de-samparo o des-amparo.
				</li>
				<li>
					Como cualquiera diptongo o triptongo no forma sino una sílaba, no deben dividirse las letras que lo componen. Así, se escribirá gra-cio-so, tiem-po, no-ti-ciáis, a-ve-ri-güéis.
				</li>
				<li>
					Cuando la primera o la última sílaba de una palabra fuere una vocal, se evitará poner esta letra sola en fin o en principio de línea.
				</li>
				<li>
					Cuando al dividir una palabra por sus sílabas haya de quedar en principio de línea con h precedida de consonante, se dejará esta al fin del reglón y se comenzará el siguiente con la h: al- haraca, in-humación, clor-hidrato, des-hidratar.
				</li>
				<li>
					En las dicciones compuestas de preposición castellana o latina, cuando después de ella viene una s y otra consonante además, como en constante, inspirar, obstar, perspicacia, se han de dividir las sílabas agregando la s a la preoposición y escribiendo, por consiguiente, cons-tan-te, ins- pi-rar, obs-tar, pers-pi-ca-cia.
				</li>
				<li>
					La ch y la ll, letras simples en su pronunciación y dobles en su figura, no se desunirán jamás. Así, co-che y ca-lle se dividirán como aquí se ve. La erre (rr) se halla en el mismo caso, y por ello debe evitarse separar los dos signos de que consta, que habrán de ponerse de esta manera: ca- rre-ta, pe-rro
				</li>
				<li>
					Cuando los gentilicios de dos pueblos o territorios formen un compuesto aplicable a una tercera entidad geográfica o política en la que se han fundido los caracteres de ambos pueblos o territorios, dicho compuesto se escribirá sin separación de sus elementos: hispanoamericano, checoslovaco, afroantillano. En los demás casos, es decir, cuando no hay fusión, sino oposición o contraste entre los elementos componentes, se unirán estos con guion: franco-prusiano, germano- soviético.
				</li>
			</ul>
		</p>
	</div>','PUNTUACIÓN');""",
    """INSERT INTO SUBTOPIC VALUES ('Las dos rayas','<div>
		<h3>Las dos rayas</h3>
		<p>
			Este signo se usaba para dividir algunas palabras compuestas; actualmente se emplea solo en las copias, para denotar que en el original se pasa a párrafo distinto.
		</p>
	</div>','PUNTUACIÓN');""",
    """INSERT INTO SUBTOPIC VALUES ('Otros signos auxiliares','<div>
		<h3>Otros signos auxiliares</h3>
		<ul>
			<li>
				Apóstrofo. Solía emplearse antiguamente, sobre todo en poesía, colocado a la mayor altura de los palos de las letras, con el fin de indicar la omisión o elisión de una vocal. Recientemente, y para evitar dudas al lector, se ha restablecido en algunas reimpresiones de obras antiguas, donde palabras de esta clase aparecen como si fuera una sola; v. gr.: daquel, laspereza, ques.
			</li>
			<li>
				Párrafo (§). Sirvió en lo antiguo para distinguir los diversos miembros de un escrito, y como signatura de pliegos impresos. Ahora se emplea en los libros, seguido del número que corresponda, para indicar divisiones internas de los capítulos: § 12, § 13, etc.
			</li>
			<li>
				Calderón ( ¶ ). Tuvo antiguamente los mismos oficios que el signo anterior. Ahora se emplea en lo impreso para señalar alguna observación especial.
			</li>
			<li>
				Asterisco ( * ). Es una estrellita que se pone sencilla, doble o triple en ciertas palabras del texto, como llamada a nota que en el margen o al pie de la plana va encabezada con el mismo signo. Para igual fin se emplean letras, números, cruces, etc., en vez de asteriscos. En obras de lingüística se coloca delante de las formas cuya existencia se supone sin estar documentada.
			</li>
			<li>
				Llave o corchete ( {} ) . Su oficio es abrazar diversas partidas en una cuenta, varios miembros en un cuadro sinóptico, etc., que deben considerarse agrupados y unidos para determinado fin. f) Manecilla - Puesta al margen o en el texto de un escrito, da a entender que lo señalado por ella es particularmente útil o interesante.
			</li>
		</ul>
	</div>','PUNTUACIÓN');""",
    """INSERT INTO SUBTOPIC VALUES ('Sintaxis','<div>
		<h3>Sintaxis</h3>
		<p>
			La sintaxis es una subdisciplina de la lingüística. Es la parte de la gramática que se encarga de estudiar las reglas que gobiernan la forma en que las palabras se organizan en sintagmas y, a su vez, estos sintagmas en oraciones
		</p>
</div>','GRAMÁTICA Y VOCABULARIO');""",
    """INSERT INTO SUBTOPIC VALUES ('Morfología','<div>
		<h3>Morfología</h3>
		<p>
			Es la rama de la lingüística que estudia la estructura interna de las palabras para delimitar, definir y clasificar las unidades de la misma, las clases de palabras a las que da lugar (morfología flexiva) y la formación de nuevas palabras (morfología léxica). El morfema (llamado formante por otros autores) es la unidad mínima significativa de la primera articulación o división del signo lingüístico: la palabra. Así pues, una palabra está constituida generalmente por dos clases de morfemas: los lexemas y los morfemas gramaticales. Los lexemas son los morfemas, comúnmente conocidos como raíces, que contienen el significado de la palabra. Constituyen casi siempre la parte invariable, autónoma y de significado más concreto de la misma. Forman la parte más numerosa del léxico y su número en toda lengua es siempre muy superior al de morfemas.
		</p>
		<p>
			Los morfemas gramaticales son las unidades que constituyen la parte variable de la palabra y cuyo significado puede ser o bien complementario o bien de carácter meramente lingüístico y gramatical. No son autónomos, sino que se presentan siempre asociados a lexemas. Los morfemas gramaticales se clasifican en: afijos, son formantes facultativos que matizan o complementan el significado básico. Todos son átonos salvo los sufijos. Aniñados morfema derivativo: a- inutilizable morfemas derivativos: in-, -able
		</p>
		<p>
			Según su posición respecto al lexema, se distinguen tres tipos de morfemas gramaticales  derivativos:
			<ul>
				<li>
					Sufijos: Van después del radical o lexema y antes de los morfemas dependientes gramaticales. Pueden cambiar la categoría gramatical de la palabra o el género de los sustantivos y son tónicos, es decir, cargan con el acento de la palabra. Repetible sufijo: -able, transforma un verbo en adjetivo tranquilamente sufijo: -mente, transforma un adjetivo en adverbio casón sufijo: -on, transforma el género del sustantivo casa.
				</li>
				<li>
					Prefijos: Preceden al radical o lexema. Son átonos y poseen significado. Si cargan con acento son en realidad prefijoides o prefijos cercanos a los lexemas. Infranqueable prefijo: in-, significado de negación o privación monosilábico prefijo: mono-, significado de único o uno solo infijos o interfijos: Se colocan entre los prefijos y sufijos para evitar la cacofonía entre dos sonidos y las homonimias. Son átonos y no poseen significado. Muchos de ellos funcionaron también como sufijos, pero quedaron sin significado perceptible. Humareda infijo: -ar-
				</li>
			</ul>
		</p>
		<div>
			<h4>Morfemas gramaticales flexivos</h4>
			<p>
				Son formantes constitutivos que ocupan siempre la posición final de la palabra y la información que ofrecen es de tipo gramatical, como el género, el número, la persona, el modo, etc. Niños morfemas flexivos: -o, género masculino-s, número plural
			</p>
		</div>
		<div>
			<h4>Morfemas libres o independientes</h4>
			<p>
				Existe otra clase de morfemas denominados morfemas libres o independientes que no van unidos a ningún lexema, pero confieren de significación gramatical a las palabras con las que se asocian. Los determinantes, las preposiciones y las conjunciones puede actuar como morfemas libres. Casi todos ellos son átonos. Por ejemplo, el artículo hace de morfema flexivo para el sustantivo.
			</p>
		</div>
		<div>
			<h4>Morfema cero</h4>
			<p>
				Es aquel morfema que, aunque existe morfológicamente, no se refleja gráficamente. Por ejemplo, en la palabra hombre, el morfema de número no está presente, y esa es precisamente la razón por la cual el número es singular.
			</p>
		</div>
		<div>
			<h4>Alomorfos</h4>
			<p>
				Los alomorfos son las diferentes representaciones fónicas de un determinado morfema. Por ejemplo, -s y -es son alomorfos del morfema de número plural del español. También son alomorfos: -ble y -bil como en imposible e imposibilidad o nece- y neci como en necio y necedad.
			</p>
		</div>
	</div>','GRAMÁTICA Y VOCABULARIO');""",
    """INSERT INTO SUBTOPIC VALUES ('Semántica','<div>
		<h3>Semántica</h3>
		<p>
			La semántica es un subcampo de la gramática y, por extensión, de la lingüística. Proviene del griego "semantikos", que quería decir "significado relevante", derivada de "sema", lo que significaba "signo". Se dedica al estudio del significado de los signos lingüísticos y de sus combinaciones, desde un punto de vista sincrónico o diacrónico.
		</p>
		<div>
			<h4>Funciones del sustantivo dentro de la oración</h4>
			<p>
				Sujeto: sólo pueden funcionar como sujetos los sustantivos o palabras sustantivadas. Cuando el sujeto está formado por varias palabras existe un sustantivo o palabra sustantivada que es el núcleo del sujeto.
			</p>
			<p>
				Predicado: esta función es propia del adjetivo y del verbo, pero el sustantivo, al funcionar como predicado toma un valor adjetivo. Por ejemplo: Juan es profesor.
			</p>
			<p>
				Atributo: el atributo es sustantivo que forma parte del predicado de una oración en la que el verbo es ser, estar o parecer.
			</p>
			<p>
				La estructura sería está Sujeto + verbo (ser, estar, parecer) + atributo Ejemplo: Las tardes tienen armonía.
			</p>
		</div>
		<div>
			<h4>Tipos</h4>
			<ul>
				<li>
					Comunes: los nombres comunes son aquellos que indican la clase de objeto a que pertenece lo designado. Ej: casa, perro, hombre.
				</li>
				<li>
					Propios: aquellos mediante los cuales se identifica a un ser, un individuo, bien entre los de su clase, bien por constituir el único individuo de una clase. Ej: Jaén, Nicolás. Tradicionalmente se consideran accidentes del nombre el género y el número a los que puede añadirse la comparación. En el caso concreto del español no existe, en realidad, la declinación y, por lo tanto, no hay casos, si exceptuamos las formas de los pronombres personales.
				</li>
				<li>
					El género.- Los sustantivos pueden ser, según ya hemos indicado, sólo masculinos o femeninos (gato, gata). Sin embargo, existen nombres que tienen género común, es decir, la misma palabra puede servir para referirse a personas de sexo masculino o femenino. Ej: testigo, estudiante. Para definir si se refiere a un hombre o a una mujer se utiliza el artículo. Ej: el amante, la amante.
				</li>
				<li>
					El número.- Existen los objetos llamados contables o discretos, como libros o plumas, que se muestran como una multiplicidad de unidades y por otra los llamados compactos o masivos como el trigo o la leche, en los cuales no puede percibirse la suma de unidades. La idea de plural se manifiesta por medio de los sufijos -s o -es.
				</li>
			</ul>
			<p>
				No todos los sustantivos suelen tener plural. Los nombres propios y los de objetos únicos sólo pueden tenerlo en casos especiales, así como los nombres abstractos como la tolerancia y la sabiduría. Existen algunas palabras, más conocidas como colectivos que se refieren a lo singular y lo plural a la vez. Ej: tijeras, pantalones. Son formas en plural que hacen referencia a una unidad.
			</p>
		</div>
	</div>','GRAMÁTICA Y VOCABULARIO');""",
    """INSERT INTO SUBTOPIC VALUES ('Adjetivo','<div>
		<h3>Adjetivo</h3>
		<p>
			El adjetivo es aquella parte de la oración que se junta al sustantivo para calificarlo o no presenta una forma externa que le distinga de la categoría más afín, que es el sustantivo. Entre una y otra clase de palabras o semantemas existe un constante movimiento: substantivos que se hacen adjetivos, y a la inversa. El adjetivo se caracteriza por su dependencia del sustantivo y de ahí su función fundamental de atributo, junto a la de predicado nominal.
		</p>
		<div>
			<h4>Colocación del adjetivo</h4>
			<p>
				Cada lengua tiene sus normas para la colocación del adjetivo. En español, se ha dicho que el adjetivo calificativo tiene un valor subjetivo, emotivo, mientras que en la posición contraria restringe la significación del sustantivo, o sea actúa como determinativo. Por ejemplo, no es lo mismo decir Saqué los cuadros valiosos que decir En la sala había cuadros valiosos. En el primer caso se refiere a que saqué sólo los cuadros valiosos porque no todos los cuadros lo eran y en el segundo caso se indica que todos los cuadros de la sala son valiosos.
			</p>
		</div>
		<div>
			<h4>Tipos de adjetivos</h4>
			<p>
				En castellano se distingue entre calificativos y determinativos. Veamos en qué se diferencian
				<ul>
					<li>
						Especificativo: en la oración Ana hizo un ramo con las rosas blancas de su jardín el adjetivo blancas califica a rosas distinguiéndola del resto (sólo las rosas de color blanco). Si quitamos el adjetivo, la oración pierde significado. El adjetivo especificativo es el que expresa una cualidad necesaria del nombre que lo diferencia de los demás. Suele ir detrás del nombre. El jugador hábil marcó un gol.
					</li>
					<li>
						Explicativo: Ana paseaba sobre la blanca nieve. En la primera oración el adjetivo blanca va delante del nombre para llamar la atención; ya que indica una cualidad propia de la nieve (la nieve siempre es blanca) y además, si quitásemos el adjetivo no se alteraría el significado de la oración.
					</li>
				</ul>
				El adjetivo explicativo o epíteto es el que expresa una cualidad no necesaria del nombre, pero que añade mayor belleza e interés literario al texto. Suele ir antepuesto al nombre. El hábil jugador marcó un gol. 
			</p>
		</div>
	</div>','GRAMÁTICA Y VOCABULARIO');""",
    """INSERT INTO SUBTOPIC VALUES ('Pronombre','<div>
		<h3>Pronombre</h3>
		<p>
			El pronombre es la parte de la oración que sustituye al nombre, sin embargo, no es una parte de la oración en el mismo sentido que lo son los sustantivos, el adjetivo, el verbo o el adverbio. Los pronombres se nos presentan en clases más perfiladas e independientes de las que hemos visto al estudiar los sustantivos y los adjetivos. Distinguiremos los personales, posesivos, demostrativos, relativos, interrogativos e indefinidos.
			<ul>
				<li>
					Pronombres personales.- La denominación personales sólo está parcialmente acertada, ya que existen formas que no designan a personas necesariamente, o a seres personificados. En español las dos primeras personas son realmente personales, pero no la tercera, que puede designar también seres no personales. Se basan en las personas que pueden intervenir en el coloquio, que son por lo menos tres: la que habla, aquella a quien se habla, y aquella de quien se habla y sus respectivos plurales.
				</li>
				<li>
					Los pronombres demostrativos se caracterizan por su función deíctica o mostrativa que les es esencial. Los pronombres demostrativos sirven para nombrar y distinguir elementos que ya se han mencionado anteriormente, pero sin repetirlos. La forma de esos pronombres demostrativos varía según el género y el número, así como de los seres o las cosas que representan. La función que ocupan en la frase no conlleva ningún cambio en su forma.
					</br>
					<img src="https://drive.google.com/uc?id=1ts05jQB5y6PoR-imeTRIyqLELCNr5HZR" alt="Pronombres demostrativos">
					</br>
					Llámense relativos los demostrativos que reproducen un concepto anterior, y sirven especialmente para enlazar una proposición con otra. El de más frecuente uso es que, adjetivo de todo género, número y persona. En el navío que viene de Londres es de género masculino, número singular y tercera persona; en vosotras que me oís es de género femenino, numero plural y segunda persona. Debemos siempre concebir en él, no obstante, su terminación invariable, el género, número y persona del sustantivo reproducido, que se llama su antecedente.
				</li>
				<li>
					Los pronombres relativos pasan a interrogativos acentuándose. ¿Qué pasajeros han llegad?: el qué es aquí adjetivo y forma con pasajeros el sujeto de la proposición. ¿Qué ha sucedido?; el qué hace de sujeto y es un sustantivo, porque envuelve el significado de cosa o cosas. De lo dicho se sigue que un complemento puede tener por término, no sólo un sustantivo, un predicado, un adverbio, un complemento, sino también una proposición interrogativa indirecta; pero es porque las proposiciones interrogativas indirectas hacen en la oración el oficio de sustantivos.
				</li>
				<li>
					Los pronombres interrogativos, junto con los indefinidos, presentan características peculiares. Los pronombres interrogativos son usados en la interrogación parcial, o sea, aquella en la que se pregunta por el sujeto, el predicado nominal o los complementos.
				</li>
			</ul>
		</p>
	</div>','GRAMÁTICA Y VOCABULARIO');""",
    """INSERT INTO SUBTOPIC VALUES ('Oración','<div>
		<h3>Oración</h3>
		<p>
			Se llama Oración toda proposición o conjunto de proposiciones que forma sentido completo: de que está alfombrada la ribera es proposición perfecta, pero no es oración
		</p>
	</div>','GRAMÁTICA Y VOCABULARIO');""",
    """INSERT INTO SUBTOPIC VALUES ('Numerales','<div>
		<h3>Numerales</h3>
		<p>
			Los numerales son un tipo de partículas que hay que relacionar con los indefinidos de cantidad y, por otra con los adjetivos calificativos, de cuales se diferencian porque en lugar de expresar cualidad indican cantidad. En realidad, forman un grupo dentro de ellos.
		</p>
		<p>
			Antes de explicar la verdadera naturaleza de los numerales es mejor identificar todas las clases que hay.
			<ul>
				<li>
					Numerales ordinales: se confunden con los adjetivos calificativos. Se pueden colocar o bien delante o detrás del sustantivo y presentan variaciones de género y número según el sistema al que acompaña. Ejemplos: la última de la fila suspende siempre, El primer autobús sale a las 10.00 horas
				</li>
				<li>
					Numerales cardinales: tienen un valor puramente adjetivo: uno, dos, tres, etc. Sin embargo, cuando nos referimos al número por sí mismo, el tres, el cuatro, aquí nos encontramos con un sustantivo. No presentan variaciones de género ni número. Ejemplos: En la caja había tres cartas En los dos casos se repite la terminación. 
				</li>
				<li>
					Determinantes partitivos: señalan una parte de la unidad: medio, doceavo, cuarto... Multiplicativos: doble, triple, cuádruple...
				</li>
				<li>
					Distributivo: sendos. Dual: ambos.
				</li>
			</ul>
		</p>
	</div>','GRAMÁTICA Y VOCABULARIO');""",
    """INSERT INTO SUBTOPIC VALUES ('Articulo','<div>
		<h3>Artículo</h3>
		<p>
			El artículo se antepone al sustantivo para anunciar su género, su número y su función gramatical. Con frecuencia el artículo determina la extensión del sustantivo. Pongamos un ejemplo, las expresiones comprar libros y comprar los libros. En el primer caso queda completamente indeterminado el sustantivo libros; no sabemos a cuántos libros nos referimos; en cambio, cuando decimos comprar los libros, entendemos que se trata de libros conocidos por la persona a quien dirigimos la palabra. Las formas del artículo son: el, la, lo, para el masculino, femenino y neutro del singular, respectivamente: los, las, para el plural masculino y femenino. Este artículo se llama determinado. Delante de nombres femeninos que empiezan por a, á o ha, usamos la forma el; por ejemplo: el hada, el agua, el áncora.
		</p>
		<p>
			Se usa también el artículo indeterminado: un, una, unos, unas. Se llama así porque delimita el concepto del sustantivo mucho menos que el artículo determinado. Basta fijarse en la diferencia que media entre te entregaré un libro y te entregaré el libro. En el primer caso puede ser un libro cualquiera y en el segundo es un libro que ambos sujetos conocen.
		</p>
		<p>
			Determinados Indeterminados: Masculino, Femenino, Neutro, Masculino, Femenino , el, la, lo, uno, una, los, las, unos, unas.
		</p>
	</div>','GRAMÁTICA Y VOCABULARIO');""",
    """INSERT INTO SUBTOPIC VALUES ('Verbo','<div>
		<h3>Verbo</h3>
		<p>
			El verbo es una parte de la oración que expresa acción, presión o estado. El concepto de verbo aparece unido a una importante función dentro de la oración, el predicado. Por ello, la presencia del verbo es indispensable para formar una oración. El verbo suele combinarse con determinados morfemas que indican el tiempo, modo, aspecto, voz, número y persona. La persona es común a los pronombres personales, el número es común al nombre. El tiempo, el modo y el aspecto son en español sólo verbales y también la voz, aunque no existe para ésta un medio de expresión tan claro.
		</p>
		<div>
			<h4>Tipos de verbos</h4>
			<p>
				Al igual que los sustantivos existen verbos simples y compuestos (beber- entresacar); primitivos y derivados (dar, abofetear) derivados de otras categorías: de sustantivos (martirizar); de adjetivos (endulzar) y también de otros verbos (reconstruir). Sin embargo, existen otras distinciones más importantes desde el punto de vista de la forma gramatical.
				<ul>
					<li>
						Verbos transitivos e intransitivos: los primeros admiten un complemento directo a diferencia de los segundos. Una cosa a tener en cuenta en cuenta es que un verbo no puede considerarse ni transitivo ni intransitivo aisladamente; sólo su función en la frase le da dicho carácter. Pongamos algunos ejemplos: llevar, decir y hacer son verbos transitivos que siempre necesitan de un complemento directo, ya que ninguna expresión de llevar, decir o hacer, por sí sola, es completa. Otros verbos, como comer o beber tienen posibilidades transitivas e intransitivas.
					</li>
					<li>
						Verbos copulativos y auxiliares: el verbo copulativo sirve esencialmente para unir el sujeto con el predicado nominal. Los verbos copulativos por excelencia son ser, estar y parecer. Con ser, el predicado se expresa como una cualidad del sujeto y con estar es un estado lo que se expresa. Ejemplos: El canario es amarillo, La anciana está sentada
					</li>
					<li>
						Los verbos transitivos pueden desempeñar, en algún caso, una función copulativa, por ejemplo, tengo a mi padre enfermo equivale a mi padre está enfermo.
					</li>
					<li>
						Los verbos auxiliares son aquellos que se unen al participio, gerundio e infinitivo formando así perífrasis verbales. Ej: ir a comer, tener que estudiar. La lengua española es rica en construcciones perifrásticas con verbos auxiliares, que le permiten completar la conjugación que podríamos llamar normal en la expresión de ciertos morfemas (voz, aspecto y tiempo). Los reflexivos: a diferencia de las otras modalidades estos verbos se forman con un verbo y la partícula se. Hay que tener claro que no todos los verbos son capaces de tener la forma reflexiva. Ejemplos: lavarse, peinarse y ducharse. Los accidentes del verbo, que son los siguientes: el tiempo, el número, la persona y el modo.
					</li>
				</ul>
			</p>
		</div>
		<div>
			<h4>El número</h4>
			<p>
				Es la variación del verbo según se refiere a un o a varios sujetos. En español  encontramos singular y plural.
				-	Singular si el verbo se refiere a un solo sujeto; ej.: yo canto, tú escribes, Marta estudia, El gato come.
				-	Plural si el verbo se refiere a más de un sujeto; ej.: nosotras cantamos, vosotros escribís, Marta y José estudian, El gato y el perro comen.
			</p>
		</div>
		<div>
			<h4>La persona</h4>
			<p>
				Sirve para señalar la persona que realiza la acción del verbo. Primera, segunda y tercera persona. El verbo está en primera persona (1a) cuando éste se refiere a la persona que habla, ej.: yo hablo. El verbo está en segunda persona (2a) cuando éste se refiere a aquélla con la que se habla, ej.: tú estudias. El verbo está en tercera persona (3a) cuando éste se refiere a aquella persona de quien se habla, ej.: Pedro come
			</p>
		</div>
		<div>
			<h4>La voz</h4>
			<p>
				Sirve para señalar si la acción del verbo es realizada por el sujeto o éste recibe la acción En español hay voz activa y voz pasiva. El verbo está en voz activa cuando el sujeto realiza la acción que el verbo expresa; ej.: Ernesto camina. El verbo está en voz pasiva cuando el sujeto recibe la acción expresada por el verbo; ej.: Cien años de soledad fue escrito por Gabriel García Márquez; América fue conquistada por los europeos.
			</p>
		</div>
		<div>
			<h4>Formas nominales</h4>
			<ul>
				<li>
					Infinitivo.- El infinitivo es un sustantivo verbal. Puede desempeñar en la oración todos los oficios que corresponden al sustantivo; más no por ello deja de tener cualidades y empleos propios del verbo, con la única restricción de no poder expresar por sí mismo tiempos y personas. El infinitivo como nombre: puede ejercer dos funciones o bien como sujeto o como complemento directo.
					El comer bien es importante para la salud,  Me gusta ir de compras. El infinitivo como verbo: puede ser activo o pasivo: no me gusta esperar, no me gusta ser esperado, admite pronombres enclíticos: he venido a verte.
				</li>
				<li>
					Gerundio.- El gerundio expresa coincidencia temporal o anterioridad inmediata respecto al verbo principal. En castellano el gerundio tiene las siguientes funciones: de adverbio: no me hables gritando, de adjetivo: via Juana paseando, esto es, que paseaba, durativo: modal del verbo: la fortuna va guiando nuestros pasos.
				</li>
				<li>
					Participio.- El participio es un adjetivo verbal. A causa de esta doble naturaleza puede construirse como adjetivo independiente, o entrar en construcciones total o parcialmente asimilables a las del verbo conjugado. Por su forma puede ser regular, cuando termina en -ado, -ido (abandonado, pulido); irregular, si tiene otra terminación (abierto, escrito, hecho). Numerosos verbos presentan un participio regular y otro irregular se emplea como adjetivo y el regular para formar los tiempos compuestos con el verbo haber, por ejemplo, agua bendita y el obispo ha bendecido a los fieles.
				</li>
			</ul>
			<p>
				Todas las palabras que se añaden al verbo para modificarlo, es decir, para expresar alguna cualidad o determinación de la acción verbal, reciben el nombre de adverbios. Estas partículas pueden modificar a un verbo, un adjetivo o a otro adverbio. En la oración funcionan como circunstanciales o formando parte de modificadores. Son invariables, ya que no tienen género ni número. Veamos algunos ejemplos: Modifican al adjetivo: Este jardín es muy hermoso , La casa es demasiado alta. Modifican al verbo :   Juan trabaja bien, El nuevo jefe viene hoy
			</p>
		</div>
		<div>
			<p>
				Según su significación, los adverbios pueden ser de lugar, de modo, de tiempo, de cantidad, de orden, de afirmación, de negación y de duda. Ejemplos:
				<ul>
					<li>
						De lugar: aquí, allí, cerca, lejos, dentro, fuera, encima
					</li>
					<li>
						De tiempo: hoy, ayer, mañana, antes, después, entonces, luego De modo: bien, mal, así, despacio, veloz, buenamente, fácilmente De cantidad: más, bastante, mucho, poco, tan, tanto
					</li>
					<li>
						De orden: primeramente, últimamente, sucesivamente De afirmación: sí, ciertamente, también, verdaderamente De negación: no, nunca, jamás, tampoco
					</li>
					<li>
						De duda: acaso, quizá o quizás
					</li>
				</ul>
			</p>
			<p>
				Existen numerosos adjetivos que pueden ejercer la función de adverbios, como claro, recio, alto, limpio. Es fácil determinar en cada caso si les corresponde una u otra función, dependiendo de si modifican a un sustantivo o a un verbo. Por ejemplo, claro será adjetivo en lenguaje claro, agua clara, pero será adverbio en hablar claro, escribir claro.
			</p>
		</div>
	</div>','GRAMÁTICA Y VOCABULARIO');""",
    """INSERT INTO SUBTOPIC VALUES ('El tiempo','<div>
		<h3>El tiempo</h3>
		<p>
			Los tiempos gramaticales son las formas que el verbo toma para dar a conocer el momento en que sucede lo que el verbo significa; ej.: ayer bebí; ahora duermo; mañana trabajaré. Los tiempos verbales se dividen en dos: simples o compuestos.
			<ul>
				<li>
					Tiempos simples: son los que constan de una sola forma verbal; ej.: como, cantaré, cerraría.
				</li>
				<li>
					Tiempos compuestos: son los que tienen una forma verbal auxiliar que normalmente es el haber y del participio del verbo que se conjuga; ej.: he constituido, has dicho, había realizado.
				</li>
			</ul>
		</p>
		<p>
			Hay tres tiempos que son fundamentales, y son: Presente (indica la acción o el estado actual; ej.: ahora viajo), (Pretérito da a conocer la acción o el estado en un pasado; ej.: ayer fuí) y Futuro (expresa una acción o estado que va a venir; ej.: mañana responderé).
		</p>
		<p>
			Tabla de los tiempos gramaticales
			</br>
			<img src="https://drive.google.com/uc?id=12P-VnrmHihnflGuHMqL4vP2hkCJvrhHe" alt="Tiempos gramaticales">
		</p>
	</div>','GRAMÁTICA Y VOCABULARIO');""",
    """INSERT INTO SUBTOPIC VALUES ('Adverbios','<div>
		<h3>Adverbios</h3>
		<p>
			Muchos adverbios se forman añadiendo a la forma femenina de los adjetivos la terminación - mente: fácilmente, claramente, etc. Los adverbios donde, cuando, cuanto y como equivalen a pronombres relativos; por ejemplo: el barrio donde vivimos es el barrio en que vivimos. Por esto se llaman adverbios relativos. Lo mismo que los pronombres de su clase, los adverbios relativos llevan acento cuando figuran en oraciones interrogativas o exclamativas: ¿cómo está usted?, ¿cuándo has llegado?
		</p>
		<p>
			Si tenemos dos palabras como venir y casa aisladamente, se observa que una significa una acción y la otra una realidad, pero sin relación alguna entre ellas. No obstante, si queremos conectar ambos significados en una expresión determinada usaremos una serie de elementos invariables que posee la lengua para expresar distintas relaciones. Tales elementos son los enlaces preposicionales, la preposición. De este modo, podemos crear expresiones como venir de casa, venir a casa, venir por casa, venir hacia casa.
		</p>
		<p>
			Las preposiciones no solamente unen un verbo (venir) y un sustantivo (casa) como hemos visto en los ejemplos anteriores. También pueden unir dos sustantivos casa de ladrillos, tienda de coches; o un adjetivo y un sustantivo, como en la expresión sencillo en gustos. De este modo, podemos decir que la función principal de las preposiciones es enlazar cualquier palabra con un sustantivo que le sirve de complemento.
		</p>
		<p>
			Las tradicionales preposiciones castellanas son: a, ante, cabe, con, contra, de, desde, en, entre, hacia, hasta, para, por, según, sin, sobre y tras.
		</p>
	</div>','GRAMÁTICA Y VOCABULARIO');""",
    """INSERT INTO SUBTOPIC VALUES ('Conjunciones','<div>
		<h3>Conjunciones</h3>
		<p>
			Conjunciones.- Las conjunciones son los elementos invariables de la lengua capaces de enlazar oraciones creando distintas relaciones entre ellas. También a veces se puede observar en la expresión que las conjunciones unen palabras aisladas, pero en realidad éstas se pueden considerar como la simplificación expresiva de auténticas oraciones enteras que subyacen en tales palabras. Las conjunciones pueden ser coordinantes o subordinantes, según establezcan una u otra relación entre las oraciones unidas por ellas.
		</p>
		<div>
			<h4>Coordinantes</h4>
			<p>
				Dentro de las conjunciones coordinantes encontramos cinco variantes
				<ul>
					<li>
						Adversativas o correctivas: denotan oposición o diferencia entre las oraciones enlazadas: más, pero, aunque, si no, sin embargo.
					</li>
					<li>
						Consecutivas: presentan a una de las oraciones como consecuencia de la otra: pues, pues que, supuesto que, puesto que, luego.
					</li>
					<li>
						Copulativas: denotan simple enlace sin matices especiales: y, e, ni.
					</li>
					<li>
						Distributivas: bien...bien, ya...ya
					</li>
					<li>
						Disyuntivas: expresan contradicción: o, u.
					</li>
				</ul>
			</p>
		</div>
		<div>
			<h4>Subordinantes</h4>
			<p>
				Dentro de las conjunciones coordinantes encontramos ocho variantes.
				<ul>
					<li>
						Causales: indican que una de las oraciones es causa o motivo de la otra: porque, pues, pues que, ya que, como, como que.
					</li>
					<li>
						Comparativas: así como, así también, de modo que, tal como.
					</li>
					<li>
						Concesivas: expresan en la subordinada una objeción o dificultad para que se efectúe lo que indica la principal, pero este obstáculo no impídela realización del hecho: aunque, por más que, a pesar de, que.
					</li>
					<li>
						Condicionales: la subordinada expresa la condición para que se realice lo que se dice en la principal: sí, con tal que, a condición.
					</li>
					<li>
						Copulativas: enlazan las subordinadas sustantivas. La única que hay es que.
					</li>
					<li>
						Finales: expresan en la subordinada el fin de la principal: a que, para que, a fin de que.
					</li>
					<li>
						Modales: entra en su composición un adverbio de modo: conforme, como, según, de modo que, de manera que.
					</li>
					<li>
						Temporales: entra en la composición de algunas un adverbio o expresión de tiempo: cuando, aun no, no bien, desde que, luego que, antes que, después que, mientras que.
					</li>
				</ul>
			</p>
		</div>
	</div>','GRAMÁTICA Y VOCABULARIO');""",
    """INSERT INTO SUBTOPIC VALUES ('Sujeto y predicado','<div>
		<h3>Sujeto y predicado</h3>
		<p>
			La oración: "La nave espacial se posó sobre la colina", es una proposición. Su primer miembro, "La nave espacial", indica aquello de lo que se va a decir algo. Mientras que el segundo miembro ,"se posó sobre la colina", es lo que se dice de la nave espacial. Fíjate en las siguientes proposiciones:
			<ul>
				<li>
					SUJETO: El mendigo, La amabilidad, Marcela y Francisco La botella misteriosa, Los cinco jinetes del viento.
				</li>
				<li>
					PREDICADO: vestía un pantalón raído, no cuesta dinero, se asustaron con el temblor, fue arrastrada por las olas, cabalgaron hacia el horizonte.
				</li>
			</ul>
		</p>
		<p>
			En los cinco ejemplos anteriores, se nombran personas, objetos o cualidades (Sujeto) y se dice alguna cosa de ellos: la forma de vestir, lo que significan, lo que sienten, lo que les pasa, lo que hacen (Predicado).
		</p>
		<p>
			El sujeto puede estar ubicado al inicio de la oración o en cualquier otra posición dentro de ella. Observa con atención: ¿De quién se dice algo? De "los hombres-rana" (Sujeto). ¿Qué se dice de ellos? Que "encontraron el barco sumergido en el fondo del mar muchos años después" (Predicado). Cuando el sujeto se ubica al medio de la oración, el predicado queda partido en dos segmentos: Veamos otros ejemplos: Sujeto Predicado No olvides que : Al cambiar el sujeto de posición, no cambia su condición de sujeto.
		</p>
		<div>
			<h4>Organización interna del sujeto</h4>
			<p>
				El Sujeto está formado por un elemento principal llamado núcleo, que puede ir acompañado de otras palabras o frases que lo determinan. El núcleo es indispensable, sin él no hay sujeto. Los determinantes, en cambio, no siempre están presentes: son opcionales. Ejemplos: (Det.= Determinante; N= Núcleo). El núcleo es el único elemento constante del sujeto. Un sujeto puede tener más de un núcleo. Los determinantes del núcleo no siempre están presentes. El núcleo del sujeto cumple siempre una función sustantiva (F. Sust.). La función sustantiva corresponde por lo general a la palabra sustantivo.
			</p>
		</div>
		<div>
			<h4>Organización interna del predicado</h4>
			<p>
				Al igual que el Sujeto, el Predicado tiene un elemento central y constante, llamado núcleo del predicado. En forma opcional, éste puede estar acompañado de determinantes. Veamos algunos ejemplos: El núcleo del predicado indica lo que hace, dice, siente o piensa el sujeto. Cumple siempre la función verbal, mediante la palabra verbo. Los verbos expresan acción, sentimientos, estados y existencia respecto de distintas personas y tiempos. Algunos verbos son: Cantar, sufrir, jugar, hacer, etcétera. 
			</p>
		</div>
	</div>','CONCORDANCIA Y DISCORDANCIA DE LAS PARTES DE LA ORACIÓN');""",
    """INSERT INTO SUBTOPIC VALUES ('Oraciones interrogativas','<div>
		<h3>Oraciones interrogativas</h3>
		<p>
			Para preguntar, podemos ubicar la acción al inicio de la oración, o utilizar una palabra que indica interrogación. Leamos estos ejemplos: ¿Irás al cumpleaños de Enrique?, ¿Encontraste el mensaje que te dejó tu papá? Estas oraciones interrogativas comienzan por la acción. Ahora, analicemos estas otras: ¿Cuál es tu personaje histórico favorito?, ¿Dónde está la clave?
		</p>
		<p>
			Las oraciones interrogativas utilizaron las palabras cuál y dónde. Algo que no puede faltar en este tipo de oraciones son los signos de interrogación delante y al final de ellas: ¿ ... ? Estos signos permiten identificar una pregunta. Algunas palabras que sirven para hacer preguntas son: ¿Qué...? ¿Quién...? ¿Cómo...? ¿Cuándo...? ¿Dónde...? ¿Por qué...? Las oraciones interrogativas se contestan con oraciones aseverativas, que pueden ser afirmativas o negativas.
		</p>
	</div>','CONCORDANCIA Y DISCORDANCIA DE LAS PARTES DE LA ORACIÓN');""",
    """INSERT INTO SUBTOPIC VALUES ('Oraciones exclamativas','<div>
		<h3>Oraciones exclamativas</h3>
		<p>
			Las oraciones exclamativas expresan sorpresa o admiración. Llevan siempre signo de exclamación al inicio y al término de ellas. ¡ ... ! ¿Por qué se llaman oraciones exclamativas? Por el tono de vos que utilizamos al decirlas. Tomamos aire y luego hablamos con otro ánimo. Te presentamos algunos ejemplos: ¡Qué linda está la Luna!, ¡Nos vamos de vacaciones!
		</p>
	</div>','CONCORDANCIA Y DISCORDANCIA DE LAS PARTES DE LA ORACIÓN');""",
    """INSERT INTO SUBTOPIC VALUES ('Oraciones imperativas','<div>
		<h3>Oraciones imperativas</h3>
		<p>
			Las oraciones imperativas tienen la particularidad de indicar una orden, un mandato o una prohibición, no llevan escrito el sujeto. Analicemos las siguientes oraciones imperativas: Se prohíbe fumar en este recinto, No pisar el pasto. Ambas oraciones indican que se prohíbe realizar una determinada acción. Veamos otras oraciones imperativas: Salgamos rápido, Quítate el delantal. Estas oraciones nos están indicando una orden y mandato.
		</p>
		<p>
			Algunas veces, para que la orden no sea tan directa, se utilizan palabras como querer, rogar o desear. Estos son ejemplos: Desearíamos que los pasajeros se abrocharan sus cinturones, Quisiera que nadie se fuera sin entregar el trabajo. 
		</p>
		<p>
			Según si tiene o no verbo, es posible clasificar a la oración en dos tipos:
			<ul>
				<li>
					Oración unimembre: grupo de palabras que posee un significado, es decir, que transmite información, y no tiene verbo. Tiene una sola parte, o sea, está formada por un solo miembro. Por eso se le llama unimembre Dentro de las oraciones unimembres, están todas las fórmulas de cortesía: expresiones que utilizamos a diario para saludar, despedirse, o simplemente ser correctos con lo demás. Por ejemplo: hola, buenos días, buenas noches, hasta luego, muchas gracias, por favor, etcétera.
				</li>
				<li>
					Oración bimembre: grupo de palabras con significado, transmite una información completa, y que además posee verbo. Por esto, puede dividirse en sujeto y predicado, que son las dos partes o miembros por las que está formada. Ello le da su nombre de bimembre, donde bi quiere decir dos, y membre, miembro.
				</li>
			</ul>
		</p>
	</div>','CONCORDANCIA Y DISCORDANCIA DE LAS PARTES DE LA ORACIÓN');""",
    """INSERT INTO SUBTOPIC VALUES ('Complementos en la oración','<div>
		<h3>Complementos en la oración</h3>
		<p>
			El sujeto tiene los siguientes complementos:
			<ul>
				<li>
					Calificativo: integrado por uno o varios adjetivos calificativos o determinativos. Otorga una cualidad, peculiaridad o manera de ser a la palabra que modifica. Ejemplo: Mi papá llegará pronto.
				</li>
				<li>
					Determinativo o de especificación: formado por un sustantivo que se une al sujeto por medio de una preposición. Ejemplo: Ese computador es muy lento.
				</li>
				<li>
					Explicativo: menciona datos incidentales, aclara y puede suprimirse sin que varíe el sentido de la oración. Va siempre entre comas. Ejemplo: Cristóbal Colón, osado navegante, descubrió América.
				</li>
			</ul>
		</p>
		<p>
			El verbo tiene los siguientes complementos:
			<ul>
				<li>
					Directo: recibe el nombre de complemento directo la persona o cosa que es el objeto de la acción del verbo. Solamente llevan complemento directo los verbos que denotan acción , son transitivos o activos. Las oraciones se construyen con la preposición a o sin preposición. Ejemplos: Amo a mis padres, Llevaremos los libros. Para identificar el complemento directo basta con preguntar al verbo de la oración: ¿qué?, ¿quién?, ¿a quién? Ejemplo: A quién amo, amo a mis padres. ¿Qué llevaremos?, los libros.
				</li>
				<li>
					Indirecto: indica a las personas o cosas que reciben la consecuencias, es decir, el fin, daño o provecho de la acción del verbo. Se construye con las preposiciones a o para. Puede llevar otros complementos o puede construirse solo. Ejemplos: Llevo un libro a mi amigo; Traigo flores para mi madre; Los vecinos compraron una bandera para la escuela. Para identificar el complemento indirecto se hacen las siguientes preguntas: ¿a quién?, ¿para quién?, ¿para qué? Ejemplos:¿A quién llevo mi libro?, a mi amigo. ¿Para quién traigo flores?, para mi madre.
				</li>
				<li>
					Circunstancial: indica las diversas circunstancias de tiempo, de lugar, de modo, de causa, de cantidad, de compañía, de fin, de medio, etc. Llegaré de mañana (de tiempo) ,   Llora con ganas (de modo), Puso el libro sobre la mesa (de lugar) Llegaré con mi amigo (de compañía) Respondía la fuerza (de causa), El tren salió para Chillán (de rumbo o destino) Mi amigo llegó a Temuco (de procedencia). Los complementos circunstanciales pueden, en otros casos, construirse sin preposición: Estudió todo el día (de tiempo). Lo esperó la vida entera (de tiempo). Los adverbios o locuciones adverbiales ejercen las funciones de complementos  circunstanciales: Habla lentamente ( de modo) Trabaja poco (de cantidad) Te esperaré aquí (de lugar) Llegó temprano (de tiempo).
				</li>
			</ul>
		</p>
	</div>','CONCORDANCIA Y DISCORDANCIA DE LAS PARTES DE LA ORACIÓN');""",
    """INSERT INTO SUBTOPIC VALUES ('El arte griego','<div>
		<h3>El arte griego</h3>
		<p>
			El arte griego se caracterizó por la búsqueda de la belleza y la perfección de los artistas, en especial los escultores se esforzaron por expresar la belleza ideal del cuerpo humano, que estaban en el equilibrio y la armonía.
		</p>
	</div>','AUTORES Y OBRAS IMPORTANTES DE LA LITERATURA CLÁSICA');""",
    """INSERT INTO SUBTOPIC VALUES ('La literatura griega  poesía épica','<div>
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
	</div>','AUTORES Y OBRAS IMPORTANTES DE LA LITERATURA CLÁSICA');""",
    """INSERT INTO SUBTOPIC VALUES ('Poesia lirica','<div>
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
	</div>','AUTORES Y OBRAS IMPORTANTES DE LA LITERATURA CLÁSICA');""",
    """INSERT INTO SUBTOPIC VALUES ('El teatro','<div>
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
	</div>','AUTORES Y OBRAS IMPORTANTES DE LA LITERATURA CLÁSICA');""",
    """INSERT INTO SUBTOPIC VALUES ('La tragedia','<div>
		<h3>La tragedia</h3>
		<p>
			La tragedia, tal y como hoy se la conoce, se cree que fue creada en el siglo VI a.C. por el poeta ateniense Esquilo, que introdujo el papel de un segundo actor, aparte del coro. Sus tragedias, cerca de 90, versan sobre temas tan excelsos como la divinidad y las relaciones de los seres humanos con los dioses. Únicamente siete de sus obras han llegado hasta hoy, entre ellas Prometeo encadenado, que narra el castigo de Zeus al titán Prometeo, y la Orestiada, trilogía que retrata el asesinato del héroe griego Agamenón por su mujer, el de ésta por su hijo Orestes y el posterior destino de Orestes.
		</p>
	</div>','AUTORES Y OBRAS IMPORTANTES DE LA LITERATURA CLÁSICA');""",
    """INSERT INTO SUBTOPIC VALUES ('La comedia','<div>
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
	</div>','AUTORES Y OBRAS IMPORTANTES DE LA LITERATURA CLÁSICA');""",
    """INSERT INTO SUBTOPIC VALUES ('Autores','<div>
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
	</div>','AUTORES Y OBRAS IMPORTANTES DE LA LITERATURA CLÁSICA');""",
    """INSERT INTO SUBTOPIC VALUES ('Literatura romana la influencia griega','<div>
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
						<img src="https://drive.google.com/uc?id=1s7HmJU7QtubnS6-a7hxlOwHwdowpANSf" alt="El renacimiento">
					</li>
					<li>
						LITERATURA NEOCLÁSICA 
						</br>
						El neoclasicismo fue un movimiento literario iniciado en Francia en el siglo XVII y todo el siglo XVIII, se preocupó por restaurar el gusto y normas de la antigüedad, especialmente de la cultura griega y romana y del período Renacentista, es también conocido como el “Siglo de las luces”. En esta etapa de la literatura, el hombre pone más énfasis en el uso de la razón, y convirtió a la razón en la facultad generadora de la obra de arte, que la expresaban de manera natural; Todo esto era con la finalidad de romper con lo superstición fomentada durante el barroco. Aquí el hombre hacia sus creaciones, pero en base a la razón y lo natural, tanto así que a veces solían parecer muy simples sus obras. En pocas palabras el hombre de esta época consideraba a la razón como fuente primaria de la verdad.
						</br>
						Obras y autores más representativos
						</br>
						<img src="https://drive.google.com/uc?id=1zM-OOqYBO0u_Si5niXOf2JYd3sNWKozy" alt="Neoclásica">
					</li>
					<li>
						LITERATURA ROMÁNTICA
						</br>
						El periodo conocido como Romanticismo, es la manifestación de una crisis ideológica, política, analítica y social. Es la búsqueda de la libertad, la exaltación del sentimiento y de la pasión. Este periodo de la historia tiene su inicio en la primera mitad del siglo XVII y principios del siglo XIX. En el romanticismo se busca la expresión del sentimiento y la pasión. Desecha las reglas establecidas, en la realidad política se busca la libertad, al igual que en la expresión literaria. El hombre de este momento toma profunda conciencia de sí mismo y de sus derechos, y por esto el arte romántico le va servir para expresar con absoluta libertad sus sentimientos, sus deseos, sus esperanzas, sus sueños, sus incongruencias, sus locuras, sus miedos, ya que es un arte libre que permite sacar la exaltación vital de este nuevo hombre, un hombre que quiere gritar, llorar, reírse a carcajadas, temer a la muerte, a la soledad; poner en un altar lo divino, el ser amado, el heroísmo y, en fin, la libertad.
						</br>
						Obras y Autores más representativos:
						</br>
						<img src="https://drive.google.com/uc?id=1Who1SRS8E8vj3EZ6uTch7TQTm5j16ICN" alt="Romántica">
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
						<img src="https://drive.google.com/uc?id=1eJ3BMNr9Sck_1fp6DmWZKatX5QXFyeY3" alt="Naturalista">
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
						<img src="https://drive.google.com/uc?id=19B8c7dTGJoGSD9ZHz2fIfqcRXGd-pI6U" alt="Moderna">
					</li>
					<li>
						VANGUARDISMO 
						</br>
						Este periodo abarca la primera mitad del siglo XX. El termino vanguardia se utiliza para designar a todas aquellas tendencias artísticas que aparecen en la primera mitad de este siglo, y que tienen como finalidad oponerse a lo anterior, al proponer nuevos conceptos y técnicas. El hombre de este periodo, busca romper con todo lo que se había venido dando anteriormente, es decir, busca entrar en una nueva etapa, que no se hubiera visto antes, y todo eso se puede ver o percibir en las características del arte de este periodo.
						</br>
						Obras y Autores más representativos:
						</br>
						<img src="https://drive.google.com/uc?id=1z5zBAr8lM9vJCD9pCnhw_mjbeRZpysLU" alt="Vanguardismo">
					</li>
					<li>
						LITERATURA CONTEMPORÁNEA 
						</br>
						Este periodo a partir de la segunda mitad del siglo XX se presenta en un ambiente de intranquilidad y protesta, debido a las circunstancias del momento. El hombre de nuestros tiempo vive más preocupado quizás, que el hombre de la antigüedad, porque sus miedos, ya no son a decir lo que siente, si no a que si lo dice, puede ser presa de un secuestro, o de la misma drogadicción que cada ves va en decremento, debido que el salario de los empleados se va empobreciendo, sienten la necesidad de hacerse dependientes de algún tipo de vicio, según ellos para olvidar muchos de los problemas que cada uno como persona acarrea en la vida.
						</br>
						Obras y Autores más representativos:
						</br>
						<img src="https://drive.google.com/uc?id=1R2K10Dyt51d4690QBsCz6a4RrJCscz6M" alt="contemporánea">
					</li>
					<li>
						BOOM LATINOAMERICANO
						</br>
						Este periodo se inicia con el padre y maestro del “Boom” latinoamericano, lo cual se hacer referencia a la sorpresa del mundo occidental cuando se leyeron las obras de Rulfo, Fuentes, Cortázar, Paz, Vargas Llosa, Carpentier, García Márquez. En esta parte de la historia me referiré más acerca de la forma de ver el mundo de los escritores, que fueron quienes iniciaron este movimiento, que más que literario, fue revelación a escribir acerca de los movimientos que antes se mencionan, retomando el romanticismo, naturalismo, barroco, vuelven a lo clásico, pero sobre todo adoptan una nueva conciencia profesional. En general los poetas actuales prefieren volver los ojos a su intimidad que manifestarse a favor de alguna ideología.
						</br>
						Obras y Autores más representativos:
						</br>
						<img src="https://drive.google.com/uc?id=19-56Z4NW4kdIWO0kQCN00YxpOxLAvYpN" alt="latinoamericano">
					</li>
				</ul>
			</p>
		</div>
	</div>','AUTORES Y OBRAS IMPORTANTES DE LA LITERATURA CLÁSICA');""",
    """INSERT INTO SUBTOPIC VALUES ('Definición de Energía','<div>
	<h3>Definición de Energía</h3>
	<p>
		La energía es, a nuestro entender, el principio y el fin del universo que conocemos. De la energía proviene la masa (que Lavoisier llamaba "materia") y el destino de toda masa es convertirse nuevamente en energía. La energía como tal, más la masa (energía concentrada de modo de estar ocupando un lugar en el espacio, es decir, en el resto de la energía), conforman la "materia" (el "Todo", en oposición a la "Nada"). Todo ocurre en el Universo bajo un principio: reducir la energía de un sistema. Por ello los cuerpos caen, el agua caliente se enfría, etc. Hay una especialidad de la Física (llamada "Termodinámica") que brinda interesantes explicaciones sobre esto. La energía se nos presenta en formas muy variadas: mecánica, térmica, eléctrica, luminosa, atómica, etc. Aquí solamente vamos a referirnos a la energía mecánica.
	</p>
</div>','ENERGÍA');""",
    """INSERT INTO SUBTOPIC VALUES ('Tipos de energía mecánica','<div>
	<h3>Tipos de energía mecánica</h3>
	<p>
		Existen 2 formas de energía mecánica:
		<ul>
			<li>
				La energía potencial: que depende de la posición que ocupa un cuerpo (por ejemplo, la altura a la que se encuentra). En general su fórmula es: Ep = m . g . h (donde m = masa, g = aceleración de la gravedad, y h = altura).
			</li>
			<li>
				La energía cinética: debida al movimiento que realiza en ese momento (en realidad, de la velocidad de este). En general su fórmula es : Ec = m . v2 (donde m = masa, y v = velocidad).
			</li>
		</ul>
		La Energía Mecánica Total es la suma de ambas y es generalmente constante: EMT = Ep + Ec
	</p>
</div>','ENERGÍA');""",
    """INSERT INTO SUBTOPIC VALUES ('Ramas de la física mecánica','<div>
	<h3>Ramas de la física mecánica</h3>
	<p>
		En función del objeto de su estudio, podemos dividir la Física Mecánica en tres partes o ramas:
		<ul>
			<li>
				Estática: es la parte de la Mecánica que estudia las fuerzas que actúan en un sistema sin tener en cuenta los efectos que su acción provoca.
			</li>
			<li>
				Dinámica: es la parte de la mecánica que estudia los efectos provocados por las fuerzas, fundamentalmente los cambios en la dirección y/o magnitud de las velocidades. Estos cambios se denominan "aceleraciones". Aquí introdujo Newton sus principios fundamentales: el de inercia, el de masa y el de acción y reacción.
			</li>
			<li>
				Cinemática: es la parte de la mecánica que estudia los movimientos, generalmente sin tener en cuenta ni las fuerzas que los provocan ni las masas sobre las que actúan.
			</li>
		</ul>
	</p>
</div>','MECÁNICA');""",
    """INSERT INTO SUBTOPIC VALUES ('Vectores','<div>
	<h3>Vectores</h3>
	<p>
		Por qué las fuerzas se representan por vectores: Una fuerza queda definida cuando se expresan:
		<ul>
			<li>
				Su dirección: la recta sobre la que actúa.
			</li>
			<li>
				Su sentido: la semirrecta de esa recta sobre la que actúa (sentido + ó sentido -).
			</li>
			<li>
				Su punto de aplicación: el punto en el cual se puede considerar aplicada.
			</li>
			<li>
				Su intensidad: su módulo (cantidad) en una unidad determinada: Kg fuerza, Newton, etc.
			</li>
		</ul>
	</p>
	<p>
		En Geometría, definimos: como "recta", una sucesión infinita de puntos alineados sin principio ni fin, como "semirrecta", una sucesión infinita de puntos que tiene un origen o comienzo, pero no tiene fin, como "segmento", una sucesión finita de puntos que tiene un origen y tiene un fin, y como "vector", un segmento orientado (hacia un extremo del segmento o hacia el opuesto).</br>Por tanto, un vector queda definido cuando se expresan:
		<ul>
			<li>
				Su dirección: la recta sobre la que actúa,
			</li>
			<li>
				Su sentido: su orientación hacia un extremo o hacia el opuesto.
			</li>
			<li>
				Su punto de aplicación: el punto en el cual tiene su origen.
			</li>
			<li>
				Su medida (en una unidad determinada: m, cm, etc.)
			</li>
		</ul>
	</p>
	<p>
		Si comparamos qué elementos necesita una fuerza para quedar definida, y qué elementos necesita un vector para quedar definido, vemos que son prácticamente los mismos, o, al menos, podemos hacerlos equiparables. Por esta razón, las fuerzas (elementos naturales que solamente son detectables y medibles por sus efectos estudiados por la Física) se suelen representar gráficamente mediante vectores (elementos artificiales creados y estudiados por la Geometría).
	</p>
	<p>
		En definitiva, las fuerzas no son vectores ni los vectores son fuerzas. La fuerza es una magnitud vectorial porque requiere los mismos elementos que un vector y, además, éste permite representarla gráficamente sobre un papel en la recta, en el plano o en el espacio. Las magnitudes que quedan definidas con solamente expresar su magnitud se denominan "escalares", por ejemplo la masa, el volumen, etc.
	</p>
</div>','MECÁNICA');""",
    """INSERT INTO SUBTOPIC VALUES ('Composición de fuerzas','<div>
	<h3>Composición de fuerzas</h3>
	<p>
		Varias fuerzas casi siempre pueden "componerse", es decir, reemplazarse por una única fuerza llamada "resultante" cuyos efectos sean los mismos que producían aquéllas. Existen varias posibilidades típicas que mencionaremos pero que no desarrollaremos en este  trabajo.
		<ul>
			<li>
				Fuerzas sobre una misma recta de acción (con igual dirección o "colineales"): con el mismo sentido: la fuerza resultante tiene la misma dirección y sentido que las fuerzas componentes, su punto de aplicación es cualquiera de los de su recta de acción y su medida es la suma de las medidas de las componentes. Con sentido opuesto: la fuerza resultante tiene la misma dirección que las fuerzas componentes, su sentido es el de la componente mayor, su punto de aplicación es cualquiera de los de su recta de acción y su medida es la diferencia de las medidas de las componentes.
			</li>
			<li>
				Fuerzas concurrentes (con el mismo punto de aplicación): En el caso de sólo dos fuerzas componentes, la resultante se obtiene gráficamente por aplicación de la llamada "regla del paralelogramo" o, en caso de tratarse de más de dos fuerzas concurrentes, por la construcción de un polígono con ellas. La medida de la resultante no es la suma de las medidas de las componentes sino su "composición", en la que influyen la dirección y el sentido de cada una de las componentes. Del mismo modo, la unión del punto de aplicación con el extremo final de la última fuerza nos indicará la dirección y el sentido de esa resultante. En realidad, y como ya hemos dicho, no estamos gráficamente resolviendo un sistema de fuerzas sino un sistema geométrico con los vectores que las representan. También en útil representar las fuerzas en un sistema de coordenadas cartesianas ortogonales, proyectar las fuerzas sobre ambos ejes para obtener sus valores sobre cada uno de ellos, y luego, aplicando el teorema de Pitágoras, encontrar el valor de la resultante, y, usando la trigonometría, su dirección y sentido.
			</li>
			<li>
				Fuerzas paralelas: con el mismo sentido: la resultante tiene una medida igual a la suma de las medidas de las componentes, su dirección es paralela a las de las componentes (ubicada entre ellas y más cerca de la mayor), y su sentido es el mismo que el de aquéllas. El punto de aplicación se determina mediante la llamada "relación de Stevin" que dice que "cada fuerza es directamente proporcional al segmento determinado por los puntos de aplicación de las otras fuerzas". Puede aplicarse también el método gráfico llamado "del funicular".Ver con más detalle estos métodos en cualquier texto o trabajo especializado. Con sentido opuesto: la resultante tiene una medida igual a la resta de las medidas de las componentes, su dirección es paralela a las de las componentes (ubicada no entre ellas sino por fuera, del lado de la mayor), su sentido es el de la componente mayor. El punto de aplicación también se determina mediante la "relación de Stevin".
			</li>
			<li>
				Fuerzas no colineales ni concurrentes ni paralelas: existe siempre algún procedimiento aplicable al sistema dado que generalmente procurará trasladar las fuerzas componentes hasta asimilarlas parcial o totalmente a cualquiera de los casos vistos.
			</li>
		</ul>
	</p>
</div>','MECÁNICA');""",
    """INSERT INTO SUBTOPIC VALUES ('Efectos de la aplicación de fuerzas','<div>
	<h3>Efectos de la aplicación de fuerzas</h3>
	<p>
		Las fuerzas son causas que solamente se ven a través de sus efectos. En Mecánica, una fuerza tiene como efecto la modificación del estado de movimiento del cuerpo sobre el que se la aplica. Y hemos llamado "aceleración" a esa modificación del movimiento (esto es, la variación de la velocidad y/o de la dirección de movimiento de un cuerpo). Es necesario aplicar una fuerza solamente cuando se busca modificar la magnitud o dirección de una velocidad. Si un cuerpo está quieto o moviéndose a velocidad constante sobre una trayectoria rectilínea, la resultante de las fuerzas que se ejercen sobre él es cero (resultante nula).
	</p>
	<p>
		Este principio es el que Newton elaboró y llamó "principio de inercia". Quizá sea el resultado de que el Universo intenta mantener su energía constante salvo que pueda disminuirla mediante algún fenómeno espontáneo (por ejemplo, la caída de un cuerpo, la formación de un compuesto químico más estable, etc.). "Todo cuerpo continúa en su estado de reposo o de movimiento uniforme sobre una línea recta, a no ser que se le obligue a variar ese estado mediante fuerzas que actúen sobre él." (1686 - Principios matemáticos de filosofía natural).
	</p>
	<p>
		Cuando aplicamos una fuerza sobre un cuerpo, le creamos una aceleración directamente proporcional a la intensidad de la fuerza que aplicamos e inversamente proporcional a la masa de ese cuerpo. Este principio también fue desarrollado en parte por Newton y lo conocemos como "principio de masa": a = F / m
	</p>
	<p>
		"La ley de variación del movimiento es proporcional a la fuerza motora a que se le somete y se realiza en el sentido de la recta en que la fuerza actúa." (1686 - Principios matemáticos de filosofía natural). Siempre que un cuerpo ejerce una fuerza sobre otro (acción), recibe de él otra fuerza de igual intensidad, pero de sentido contrario (reacción).
	</p>
	<p>
		Esta conclusión, fruto de la fina observación de Newton y de su espíritu científico de razonamiento, le permitió establecer este "principio de acción y reacción". "A toda acción se opone siempre una reacción igual; o sea, las acciones mutuas de dos cuerpos uno sobre el otro se dirigen siempre hacia las partes contrarias." (1686 - Principios matemáticos de filosofía natural). Estos principios son el fundamento de la parte de la Física Mecánica que conocemos como "Estática".
	</p>
</div>','MECÁNICA');""",
    """INSERT INTO SUBTOPIC VALUES ('Fuerzas de fricción','<div>
	<h3>Fuerzas de fricción</h3>
	<p>
		Como en la vida práctica ninguna superficie es perfectamente lisa, las fuerzas que se aplican sobre un cuerpo para iniciar o mantener su movimiento no tienen una eficiencia del 100%. Esto se debe a la aparición de las fuerzas llamadas "de fricción" que se oponen a esos movimientos. Pueden ser producidas por rozamiento (en sólidos que se deslizan sobre sólidos), por rodadura (en sólidos que ruedan sobre sólidos), o por viscosidad (sólidos, líquidos o gases que atraviesan otros líquidos o gases). El sentido de las fuerzas de fricción es siempre opuesto al sentido del movimiento.
	</p>
	<p>
		Existen dos situaciones que afectan el valor de las fuerzas de rozamiento: Un caso se da cuando intentamos iniciar un movimiento y otro cuando, luego de iniciado, intentamos mantenerlo.
		<ul>
			<li>
				Rozamiento estático: como tuve el privilegio de que me fuera explicado por el eminente físico de la UNLP Dr. Rafael Grinfeld allá por 1963 y jamás se me olvidaron (ni su explicación ni él), cuando un cuerpo rugoso es apoyado sobre otro cuerpo rugoso, las irregularidades de uno "calzan" en las irregularidades del otro. Es más: si ambos cuerpos son metálicos, el peso del superior provoca que las eminencias de ambos lleguen a soldarse (microsoldaduras). Al intentar iniciar un deslizamiento, se hace necesario "descalzar" un cuerpo del otro produciendo la ruptura de sus puntos más salientes y, si existieran, también la ruptura de esas microsoldaduras. Esto hace que el rozamiento estático tenga un valor inicial mayor que el que se produce cuando ya el cuerpo está en movimiento. El cociente entre la fuerza de rozamiento estático y la fuerza normal o perpendicular (compresión de un cuerpo sobre el otro) se denomina "coeficiente de rozamiento estático".
			</li>
			<li>
				Rozamiento dinámico: una vez iniciado el movimiento, disminuye un poco la fuerza de rozamiento, pues ya no existe esa adherencia inicial. El cociente entre la fuerza de rozamiento dinámico y la fuerza normal se hace menor, y se denomina "coeficiente de rozamiento dinámico".
			</li>
		</ul>
	</p>
	<p>
		Los lubricantes cumplen la función de disminuir ambas fuerzas de rozamiento, generalmente intercalando capas líquidas o pastosas que convierten el fenómeno de rozamiento en un fenómeno de viscosidad, con fuerzas de fricción significativamente menores y, por tanto, mayor eficiencia en el movimiento obtenido.
	</p>
	<p>
		¿"En equilibrio" o "en reposo"?</br>Tomémonos un par de minutos para diferenciar con mayor claridad estos conceptos equilibrio: implica aceleración = cero, lo que puede darse en un cuerpo en reposo o en otro que se mueva con velocidad uniforme sobre una trayectoria rectilínea. reposo: implica velocidad = 0, lo que solamente puede darse en un cuerpo quieto (al menos, sin desplazarse con respecto de otro que consideremos fijo). Un cuerpo puede estar en equilibrio sin estar en reposo: por ejemplo, si se está moviendo con velocidad constante sobre una trayectoria rectilínea. Un cuerpo puede estar en reposo sin estar en equilibrio: por ejemplo, un cuerpo lanzado hacia arriba que llega al punto máximo de su trayectoria y se detiene, pero que está siendo afectado por la fuerza de gravedad que lo hará iniciar su caída libre.
	</p>
</div>','MECÁNICA');""",
    """INSERT INTO SUBTOPIC VALUES ('Centro de gravedad y centro de masa','<div>
	<h3>Centro de gravedad y Centro de masa</h3>
	<p>
		Todo cuerpo tiene un volumen, es decir, ocupa un lugar en el espacio. Sin embargo, en la Física Mecánica básica jamás lo mencionamos. Los cuerpos, para nosotros, son siempre puntos que no tienen ni largo ni ancho ni alto, pero que tienen masa y tienen peso. Esto significa que los resultados teóricos que obtenemos no serán realmente los verdaderos en la práctica. Pero, para comenzar a estudiar los temas, es suficiente.
		<ul>
			<li>
				Centro de gravedad: es el punto en el que puede considerarse concentrado todo el peso de un cuerpo.
			</li>
			<li>
				Centro de masa: es el punto en el que puede considerarse concentrada toda la masa de un cuerpo.
			</li>
		</ul>
		Generalmente, la posición de ambos coincide y, en cuerpos homogéneos (de un material con peso específico y densidad uniformes en toda su extensión), también coincide con el centro geométrico del cuerpo.
	</p>
</div>','MECÁNICA');""",
    """INSERT INTO SUBTOPIC VALUES ('Movimiento','<div>
	<h3>Movimiento</h3>
	<p>
		Todos los puntos del Universo que conocemos están en movimiento, es decir, cambian su posición. Cuando estás echado en tu sillón favorito y te recriminan por estar "quieto", puedes responder que estás girando alrededor del eje terrestre a razón de un giro completo diario, con la Tierra alrededor del Sol, con el Sistema Solar dentro de la Vía Láctea, con la Vía Láctea a través de las otras galaxias, ... Entonces, ¿qué está quieto y qué está en movimiento en forma absoluta? Nada. Todo movimiento es relativo. Un punto está en movimiento cuando cambia de posición con respecto a otro que arbitrariamente consideramos fijo. Y las distintas posiciones que ocupa a medida que pasa el tiempo configurarán su trayectoria.
	</p>
	<p>
		En este capítulo de la Física que se ha dado en llamar "Cinemática" veremos los movimientos sin tener en cuenta las fuerzas que los originan, y aquí solamente veremos algunos de ellos: los movimientos uniformes y los movimientos uniformemente variados, tanto rectilíneos como circulares.
		<ul>
			<li>
				Movimientos rectilíneos: Obviamente, un movimiento es rectilíneo cuando la curvatura de su "recta de acción" es cero. Son pocos los movimientos verdaderamente rectilíneos, pero cuando la curvatura de la recta de acción no es significativa, podemos considerarlos así para facilitar el estudio.
				<ul>
					<li>
						El movimiento es rectilíneo uniforme cuando su velocidad no varía con el transcurso del tiempo. Esto significa que: su velocidad es constante, la resultante de las fuerzas ejercidas sobre él es cero y, por tanto, no hay aceleración.
					</li>
					<li>
						El movimiento es rectilíneo uniformemente acelerado cuando su velocidad aumenta regularmente con el transcurso del tiempo. Esto significa que: su aceleración es positiva y constante, es constante la intensidad de la resultante de las fuerzas ejercidas sobre el móvil y esta fuerza resultante tiene el mismo sentido que el movimiento del cuerpo.
					</li>
					<li>
						El movimiento es rectilíneo uniformemente retardado cuando su velocidad disminuye regularmente con el transcurso del tiempo. Esto significa que: su aceleración es negativa y constante, es constante la intensidad de la resultante de las fuerzas ejercidas sobre el móvil y esta fuerza resultante tiene sentido opuesto al del movimiento del cuerpo (caso del frenado).
					</li>
					<li>
						El movimiento es una caída libre cuando: es vertical, la altura inicial es mayor que la final (que es cero), la velocidad inicial es cero (se deja caer, no se empuja hacia abajo), la velocidad final es positiva, la aceleración es la de la gravedad considerada como positiva (a favor de la fuerza de atracción gravitatoria),  la fuerza actuante es la de la gravedad, es constante (aproximadamente igual a 9,8 m/s2 para movimientos cercanos a la superficie de la Tierra) y tiene el mismo sentido que el movimiento del cuerpo.
					</li>
					<li>
						El movimiento es un tiro vertical cuando: obviamente, es vertical, la altura inicial es cero y, por tanto, menor que la final, la velocidad inicial es positiva (se lanza el cuerpo hacia arriba), la velocidad final es cero, la aceleración es la de la gravedad considerada como negativa (en contra de la fuerza de atracción gravitatoria), la fuerza actuante es la de la gravedad, es constante y tiene sentido opuesto al del movimiento del cuerpo.
					</li>
				</ul>
			</li>
		</ul>
	</p>
</div>','MECÁNICA');""",
    """INSERT INTO SUBTOPIC VALUES ('Definición de Electromagnetismo','<div>
	<h3>Definición de Electromagnetismo</h3>
	<p>
		El electromagnetismo, estudia los fenómenos eléctricos y magnéticos que se unen en una sola teoría aportada por Faraday, que se resumen en cuatro ecuaciones vectoriales que relacionan campos eléctricos y magnéticos conocidas como las ecuaciones de Maxwell. Gracias a la invención de la pila de limón, se pudieron efectuar los estudios de los efectos magnéticos que se originan por el paso de corriente eléctrica a través de un conductor.
	</p>
	<p>
		El Electromagnetismo, de esta manera es la parte de la Física que estudia los campos eléctricos y los campos magnéticos, sus interacciones con la materia y, en general, la electricidad y el magnetismo y las partículas subatómicas que generan flujo de carga eléctrica. El electromagnetismo, por ende, se comprende que estudia conjuntamente los fenómenos físicos en los cuales intervienen cargas eléctricas en reposo y en movimiento, así como los relativos a los campos magnéticos y a sus efectos sobre diversas sustancias sólidas, líquidas y gaseosas.
	</p>
</div>','ELECTROMAGNETISMO');""",
    """INSERT INTO SUBTOPIC VALUES ('Campos eléctricos y magnéticos','<div>
	<h3>Campos eléctricos y magnéticos</h3>
	<p>
		Es conveniente entender el electromagnetismo en 2 términos separados: El campo eléctrico y el campo magnético. Un campo eléctrico es producido por la presencia de cargas eléctricas, las cuales crean una fuerza, relacionadas por la ecuación (Siendo Q la carga eléctrica medida en coulombs y E el campo eléctrico medido en Newtons/Coulombs). Esta fuerza eléctrica es la responsable de la electricidad estática y dirige el flujo de carga eléctrica en un área determinada (corriente eléctrica). Por otro lado, el campo magnético puede ser producido por el movimiento de cargas eléctricas, o corriente eléctrica, las cuales crean la fuerza magnética asociada con los imanes como la magnetita.
	</p>
	<p>
		El termino electromagnetismo proviene del hecho de que no podemos estudiar los campos eléctricos y magnéticos por separado. Un campo magnético variable produce un campo eléctrico (como ocurre en el fenómeno de inducción electromagnética, la cual es la base para el funcionamiento de generadores eléctricos, motores de inducción eléctrica y transformadores). Similarmente, un campo eléctrico variable genera un campo magnético.
	</p>
	<p>
		Debido a esta dependencia mutua de los campos eléctricos y magnéticos, se considera lógico considerarlos como uno solo, el campo electromagnético. Esta unificación, la cual fue completada por James Clerk Maxwell, es uno de los triunfos para los físicos del siglo 19. Estos estudios trajeron consecuencias sumamente altas, siendo una de ellas la aclaración de la naturaleza de la luz.
	</p>
	<p>
		Como se ha ido descubriendo, lo que percibimos como “luz visible” es realmente una propagación oscilatoria en el campo electromagnético, es decir, una onda electromagnética. Diferentes frecuencias de oscilación dan a lugar a las diferentes formas de radiación electromagnética, desde las ondas de radio de frecuencias bajas, la luz visible en frecuencias intermedias, hasta los rayos gamma con las frecuencias bastante altas. Las implicaciones teóricas del electromagnetismo llevaron a Albert Einstein a la publicación de la Teoría de relatividad especial, en 1905
	</p>
</div>','ELECTROMAGNETISMO');""",
    """INSERT INTO SUBTOPIC VALUES ('Desarrollo histórico de la teoría electromagnética','<div>
	<h3>Desarrollo histórico de la teoría electromagnética</h3>
	<p>
		Históricamente, el magnetismo y la electricidad habían sido tratados como fenómenos distintos y eran estudiados por ciencias diferentes. Sin embargo, los descubrimientos de Oersted y luego de Ampere, al observar que la aguja de una brújula tomaba una posición perpendicular al pasar corriente a través de un conductor próximo a ella. Así mismo los estudios de Faraday en el mismo campo, sugerían que la electricidad y el magnetismo eran manifestaciones de un mismo fenómeno.
	</p>
	<p>
		La idea anterior fue propuesta y materializada por el físico escocés James Clerk Maxwell (1831- 1879), quien luego de estudiar los fenómenos eléctricos y magnéticos concluyó que son producto de una misma interacción, denominada interacción electromagnética, lo que le llevó a formular, alrededor del año 1850, las ecuaciones antes citadas, que llevan su nombre, en las que se describe el comportamiento del campo electromagnético. Estas ecuaciones dicen esencialmente que:
		<ul>
			<li>
				Existen portadores de cargas eléctricas, y las líneas del campo eléctrico parten desde las cargas positivas y terminan en las cargas negativas.
			</li>
			<li>
				No existen portadores de carga magnética; por lo tanto, el número de líneas del campo magnético que salen desde un volumen dado debe ser igual al número de líneas que entran a dicho volumen.
			</li>
			<li>
				Un imán en movimiento, o, dicho de otra forma, un campo magnético variable, genera una corriente eléctrica llamada corriente inducida.
			</li>
			<li>
				Cargas eléctricas en movimiento generan campos magnéticos.
			</li>
		</ul>
	</p>
</div>','ELECTROMAGNETISMO');""",
    """INSERT INTO SUBTOPIC VALUES ('Definición de Acústica','<div>
	<h3>Definición de Acústica</h3>
	<p>
		El sonido es la vibración de un medio elástico, bien sea gaseoso, liquido o sólido. Cuando nos referimos al sonido audible por el oído humano, estamos hablando de la sensación detectada por nuestro oído, que producen las rápidas variaciones de presión en el aire por encima y por debajo de un valor estático. Este valor estático nos lo da la presión atmosférica (alrededor de 100.000 pascals) el cual tiene unas variaciones pequeñas y de forma muy lenta, tal y como se puede comprobar en un barómetro.
	</p>
	<p>
		¿Cómo son de pequeñas y de rápidas las variaciones de presión que causan el sonido? Cuando las rápidas variaciones de presión se centran entre 20 y 20.000 veces por segundo (igual a una frecuencia de 20 Hz a 20 kHz) el sonido es potencialmente audible, aunque las variaciones de presión puedan ser a veces tan pequeñas como la millonésima parte de un pascal.
	</p>
	<p>
		Los sonidos muy fuertes son causados por grandes variaciones de presión, por ejemplo, una variación de 1 pascal se oiría como un sonido muy fuerte, siempre y cuando la mayoría de la energía de dicho sonido estuviera contenida en las frecuencias medias (1kHz - 4 kHz) que es donde el iodo humano es más sensitivo. El sonido lo puede producir diferentes fuentes, desde una persona hablando hasta un altavoz, que es una membrana móvil que comprime el aire generado ondas sonoras.
	</p>
</div>','ACÚSTICA');""",
    """INSERT INTO SUBTOPIC VALUES ('Frecuencia y Decibelio','<div>
	<h3>Frecuencia y Decibelio</h3>
	<p>
		La frecuencia de una onda sonora se define como el número de pulsaciones (ciclos) que tiene por unidad de tiempo (segundo). La unidad correspondiente a un ciclo por segundo es el hertzio (Hz). Las frecuencias más bajas se corresponden con lo que habitualmente llamamos sonidos "graves”, son sonidos de vibraciones lentas. Las frecuencias más altas se corresponden con lo que llamamos "agudos" y son vibraciones muy rápidas. El espectro de frecuencias audible varía según cada persona, edad etc. Sin embrago normalmente se acepta como los intervalos entre 20 Hz y 20 kHz.
	</p>
	<p>
		El decibelio es una unidad logarítmica de medida utilizada en diferentes disciplinas de la ciencia. En todos los casos se usa para comparar una cantidad con otra llamada de referencia. Normalmente el valor tomado como referencia es siempre el menor valor de la cantidad. En algunos casos puede ser un valor promediado aproximado.
	</p>
	<p>
		En Acústica la mayoría de las veces el decibelio se utiliza para comparar la presión sonora, en el aire, con una presión de referencia. Este nivel de referencia tomado en Acústica es una aproximación al nivel de presión mínimo que hace que nuestro iodo sea capaz de percibirlo. El nivel de referencia varía lógicamente según el tipo de medida que estemos realizando. No es el mismo nivel de referencia para la presión acústica, que para la intensidad acústica o para la potencia acústica. A continuación, se dan los valores de referencia.
		<ul>
			<li>
				Nivel de Referencia para la Presión Sonora (en el aire) = 0.00002 = 2E-5 Pa (rms)
			</li>
			<li>
				Nivel de Referencia para la Intensidad Sonora (en el aire) = 0.000000000001 = 1E-12 w/m^2
			</li>
			<li>
				Nivel de Referencia para la Potencia Sonora (en el aire) = 0.00000000001 = 1E-12 w
			</li>
		</ul>
	</p>
	<p>
		Como su nombre indica el decibelio es la décima parte del Bel. El Bel es el logaritmo en base 10 de la relación de dos potencias o intensidades. No obstante, esta unidad resulta demasiado grande por lo que se ha normalizado el uso de la décima parte del Bel, siendo el decibel o decibelio.  La razón por la que se utiliza el decibelio es que, si no, tendríamos que estar manejando números o muy pequeños o excesivamente grandes, llenos de ceros, con lo que la posibilidad de error sería muy grande al hacer cálculos. Además, también hay que tener en cuenta que el comportamiento del iodo humano está más cerca de una función logarítmica que de una lineal, ya que no percibe la misma variación de nivel en las diferentes escalas de nivel, ni en las diferentes bandas de frecuencias.
	</p>
</div>','ACÚSTICA');""",
    """INSERT INTO SUBTOPIC VALUES ('Nivel Sonoro','<div>
	<h3>Nivel Sonoro</h3>	
	<p>
		Para medir el nivel sonoro disponemos de los Sonómetros. Estos aparatos nos permiten conocer el Nivel de Presión sonora o SPL (Sound Presure Level). Normalmente suelen ser sistemas digitales y presentan en una pantalla de cristal líquido los valores medidos. Estos siempre se dan como decibelios dB y en referencia al valor antes señalado de (2E-5 Pa). Con el sonómetro es posible además del hallar el valor rms de la presión, también ver los picos máximos y niveles mínimos de la medida. Como se verá en el capítulo de ponderaciones, los sonómetros normalmente no dan la medida en dB lineales si no que dan ya con la ponderación y son dBA/dBC etc.
	</p>
	<p>
		Una función muy utilizada a la hora de medir niveles de presión acústica y que ofrecen los sonómetros es la medición en modo Leq. Normalmente se utiliza el Leq 1´ (leq a un minuto). El sonómetro mide las diferentes presiones que se generan durante un tiempo determinado (Leq X) siendo X = 1 minuto en nuestro caso, el valor que nos da al finalizar el minuto de medida es un valor en dB que equivaldría al de una señal de valor continuo durante todo el minuto y que utilizaría la misma energía que se ha medido durante el minuto. Hay que observar que en una medida de un minuto los valores varían y si se quiere determinar un valor medio de ruido hay que hacerlo con la función Leq, de otra forma se obtendrán valores erróneos puesto que podemos tener valores de pico durante un instante y no ser representativos del nivel de ruido normal que se esta intentando determinar.
	</p>
	<p>
		En el punto anterior hemos visto que el dB es un valor lineal, quiere decir que los valores medidos son los valores tomados como validos sin que sufran ninguna alteración. Si los valores de presión acústica los medimos de esta forma, linealmente, aun siendo cierta dicha medida, tendrá poco valor en cuanto a la percepción del odio humano.
	</p>
	<p>
		El oído no se comporta igual para el mismo nivel de presión en diferentes frecuencias. Por ejemplo, tomemos un sonido lineal en toda la banda de 20 Hz a 20 kHz tenemos en todas las bandas un nivel de 30 dB, si nuestro iodo fuese lineal oiríamos los mismo o mejor con la misma intensidad auditiva las frecuencias más bajas, que las medias y que las agudas. Sin embargo, esto no es cierto el iodo humano tiene una menor sensibilidad en las frecuencias más graves, y en las más agudas frente a las medias.
	</p>
	<p>
		Lo que más oímos, por tanto, son las frecuencias medias, y las que menos las más graves seguidas de las más agudas. Como vemos es necesario encontrar una forma de ajustar los niveles de dB que hemos medido con la percepción que el oído tiene de los mismos según cada frecuencia. Esta corrección se realiza ponderando los dB medidos mediante una tabla de ponderación ya especificada y que se llama tabla "A". Los decibelios ya ponderados en "A" se representan como dBA y los no ponderados, llamados lineales, como dB. 
	</p>
	<p>
		¿Cómo se suman los niveles de sonido? Hemos visto que el decibelio es una función logarítmica y, por tanto, cuando hablamos de dB de presión sonora no es posible sumarlos sin más. Por ejemplo 30 dB + 30 dB no es igual a 60 dB si no a 33 dB como vamos a ver a continuación. Para poder sumar dos decibelios podemos emplear la siguiente ecuación: Suma dB1 + dB2 = 10 log (10^(dB1/10) + 10^(dB2/10))
	</p>
	<p>
		La suma de dos dB nunca puede ser más de 3 dB más que el mayor de los dos. Si la diferencia que hay entre los dos valores a sumar es mayor de 10 dB la suma no tiene valor practico y se toma el valor del mayor de los dos. Por ejemplo, si sumamos 20 dB + 10 dB el resultado será igual a 20 dB (aproximado). Solamente son significativos para la suma los valores que tienen una diferencia menor a 10 dB.
	</p>
	<p>
		¿A partir de que niveles el sonido es perjudicial? Por encima de los 100 dBA es muy recomendable siempre que sea posible utilizar protectores para los oídos. Si la exposición es prolongada, por ejemplo, en puestos de trabajos, se considera necesario el utilizar protectores en ambientes con niveles de 85 dBA, siempre y cuando la exposición sea prolongada. Los daños producidos en el oído por exposiciones a ruidos muy fuertes son acumulativos e irreversibles, por lo que se deben de extremar las precauciones. De la exposición prolongada a ruidos se observan trastornos nerviosos, cardiacos y mentales.
	</p>
</div>','ACÚSTICA');""",
    """INSERT INTO SUBTOPIC VALUES ('Presión, Intensidad y Potencia Acústica','<div>
	<h3>Presión, Intensidad y Potencia Acústica</h3>
	<p>
		La presión sonora como hemos visto antes es la presión que se genera en un punto determinado por una fuente sonora. El nivel de presión sonora SPL se mide en dB(A) SPL y determina el nivel de presión que realiza la onda sonora con relación a un nivel de referencia que es 2E-5 Pascal en el aire. Es el parámetro más fácil de medir, se puede medir con un sonómetro. Su valor depende del punto donde midamos, del local etc. Realmente no da mucha información sobre las características acústicas de la fuente, a no ser que se haga un análisis frecuencial de los nivel de presión, dado que el SPL siempre esta influenciado por la distancia a la fuente, el local etc.
	</p>
	<p>
		Se puede definir como la cantidad de energía sonora transmitida en una dirección determinada por unidad de área. Con buen oído se puede citar dentro de un rango de entre 0.000000000001 w por metro cuadrado, hasta 1 w. Para realizar la medida de intensidades se utiliza actualmente analizadores de doble canal con posibilidad de espectro cruzado y una sonda que consiste en dos micrófonos separados a corta distancia. Permite determinar la cantidad de energía sonora que radia una fuente dentro de un ambiente ruidoso. No es posible medirlo con un sonómetro. El nivel de intensidad sonora se mide en w/m2.
	</p>
	<p>
		La potencia acústica es la cantidad de energía radiada por una fuente determinada. El nivel de potencia Acústica es la cantidad de energía total radiada en un segundo y se mide en w. La referencia es 1pw = 1E-12 w. Para determinar la potencia acústica que radia una fuente se utiliza un sistema de medición alrededor de la fuente sonora a fin de poder determinar la energía total irradiada.
	</p>
	<p>
		La potencia acústica es un valor intrínseco de la fuente y no depende del local donde se halle. Es como una bombilla, puede tener 100 w y siempre tendrá 100 w la pongamos en nuestra habitación o la pongamos dentro de una nave enorme su potencia siempre será la misma. Con la potencia acústica ocurre lo mismo el valor no varía por estar en un local reverberante o en uno seco. Al contrario de la Presión Acústica que sí que varía según varíe las características del local donde se halle la fuente, la distancia etc.
	</p>
</div>','ACÚSTICA');""",
    """INSERT INTO SUBTOPIC VALUES ('Velocidad de propagación','<div>
	<h3>Velocidad de Propagación</h3>
	<p>
		La velocidad de propagación del sonido en el aire es de unos 334 m/s. y a 0º es de 331,6 m/s. La velocidad de propagación es proporcional a la raíz cuadrada de la temperatura absoluta y es alrededor de 12 m/s mayor a 20º. La velocidad es siempre independiente de la presión atmosférica. En el agua la velocidad de propagación es de 1500 m/s. Es posible obtener medidas de temperatura de los océanos midiendo la diferencia de velocidad sobre grandes distancias.
	</p>
	<p>
		El Tiempo de Reverberación RT, es el tiempo que tarda una señal, desde que esta deja de sonar, en atenuarse un nivel de 60 dB. Para realizar la medida se genera un ruido y se mide a partir de que este deja de sonar, entonces se determina el tiempo que tarda en atenuarse 60 dB. El Tiempo de Reverberación se mide de forma frecuencial, esto es, un local no tiene el mismo RT en 200 Hz que en 4 kHz. Ello es debido a que el RT viene determinado por el Volumen de la sala, y por los coeficientes de absorción de sus superficies, o si se prefiere por las superficies con un coeficiente de absorción determinado.
	</p>
	<p>
		Como los coeficientes de absorción de los diferentes materiales que componen cualquier local no son iguales para todas las frecuencias, las reflexiones generadas en el interior del local serán diferentes para cada frecuencia y por lo tanto el RT del local es diferente según las frecuencias. Para calcular la RT de un local sin realizar mediciones se puede utilizar la fórmula de Sabine: RT60 = 0,163 * (V/A) donde  V = Volumen de la sala en m3 y A = Superficie de Absorción en m2.
	</p>
	<p>
		Como norma cuanto mayor sea el local mayor es el RT. Si los materiales que lo componen internamente son poco absorbentes el RT también aumentara. El valor de RT es muy importante si se quiere conseguir buenos niveles de inteligibilidad dentro de los locales.
	</p>
	<p>
		El coeficiente de absorción de un material es la relación entre la energía absorbida por el material y la energía reflejada por el mismo. Dada esta formulación su valor siempre está comprendido entre 0 y 1. El máximo coeficiente de absorción está determinado por un valor de 1 donde toda la energía que incide en el material es absorbida por el mismo, y el mínimo es 0 donde toda la energía es reflejada. El coeficiente de absorción varia con la frecuencia y, por tanto, los fabricantes de materiales acústicos dan los coeficientes de absorción por lo menos en resolución de una octava.
	</p>
	<p>
		Sabiendo los materiales de una sala y sabiendo sus coeficientes de absorción podemos saber cómo sonora esa sala en cada frecuencia y podremos también saber, mediante la fórmula de Sabine, Eyring etc., el tiempo de reverberación también por frecuencias.
	</p>
</div>','ACÚSTICA');""",
    """INSERT INTO SUBTOPIC VALUES ('Eco, Reverberación y Resonancia','<div>
	<h3>Eco, Reverberación y Resonancia</h3>
	<p>
		Cuando se genera un sonido en el interior de un local las superficies que componen el mismo ocasionan una serie de diferentes efectos dependiendo de las características de dichas superficies. Esto ocurre porque las ondas sonoras inciden en las diferentes superficies y estas las reflejan de diferente forma según su coeficiente de reflexión acústica.
	</p>
	<p>
		Como es lógico, primero siempre se percibe el sonido directo, esto es, el sonido que nos llega a nuestro oído sin que aún se halla reflejado en ninguna superficie. Una vez recibido el sonido directo, llegará a nuestros oídos, con un retraso de tiempo con respecto al sonido directo, el sonido reflejado por las superficies del local. Tanto el retraso como el nivel sonoro del sonido reflejado dependen de las características físicas del local y sus superficies.
	</p>
	<p>
		Si el retraso entre el sonido directo y el reflejado es mayor de 1/10 de segundo, nuestro sistema de audición será capaz de separar las dos señales y percibirlas como tales, primero una y después la otra, esto es lo que se entiende por eco. Por ejemplo: supongamos que estamos dentro de un local de grandes dimensiones y una persona que está separada de nosotros a cierta distancia nos dice "HOLA"; primero llegara a nuestros oídos el "HOLA" del sonido directo, y en el caso de un Eco este nos llegara como mínimo 1/10 segundo después, por lo tanto oiremos "HOLA. (1/10 segundo mínimo)...HOLA", y lo interpretaremos efectivamente como dos mensajes diferentes separados por un intervalo de tiempo determinado. Sin embargo, nuestro interlocutor únicamente ha articulado un "HOLA".
	</p>
	<p>
		Cuando en la misma situación que en el caso anterior, el sonido reflejado nos llega con un tiempo inferior a 1/10 de segundo, nuestro sistema de audición no es capaz de separar ambas señales y las toma como una misma, pero con una duración superior de esta. Normalmente esto se entiende como reverberación. La reverberación de un local se mide según su tiempo de reverberación (rt) en segundos y varía según la frecuencia de análisis que se utilice. Esto es debido a que los diferentes materiales que componen las superficies del local no se comportan por igual en todo el espectro sonoro, y, por tanto, los coeficientes de absorción de cada superficie de un mismo material varía según la frecuencia. Conociendo el tiempo de reverberación de un local podemos saber cómo se comportará el mismo en diferentes aplicaciones. Cuando el tiempo de reverberación alcanza valores muy altos con respecto al sonido directo, puede ocurrir un enmascaramiento de este y se puede perder la capacidad de entender la información contenida en el mensaje que se percibe.
	</p>
	<p>
		La resonancia se ocasiona cuando un cuerpo entra en vibración por simpatía con una onda sonora que incide sobre el y coincide su frecuencia con la frecuencia de oscilación del cuerpo o esta es múltiplo entero de la frecuencia de la onda que le incide.
	</p>
</div>','ACÚSTICA');""",
    """INSERT INTO SUBTOPIC VALUES ('Efecto Doppler','<div>
	<h3>Efecto Doppler</h3>
	<p>
		El efecto Doppler se origina cuando hay un movimiento relativo entre la fuente sonora y el oyente cuando cualquiera de los dos se mueven con respecto al medio en el que las ondas se propagan. El resultado es la aparente variación de la altura del sonido. Existe una variación en la frecuencia que percibimos con la frecuencia que la fuente origina.
	</p>
	<p>
		Para entenderlo mejor supongamos que estamos paradas en el andén de una estación, a lo lejos un tren viene a gran velocidad con la sirena accionada, mientras el tren este lejos de nosotros oiremos el silbido de la sirena como una frecuencia determinada, cuando el tren pase delante nuestro y siga su camino, el sonido de la sirena cambia con respecto al estábamos oyendo y con respecto al que vamos a oír una vez que el tren nos rebasa y sigue su camino. La frecuencia que aparente se puede determinar según las siguientes fórmulas:</br>Fuente móvil = fx = (c/(c-u))fs</br>Receptor en movimiento: fx = ((c-v)/c)fs</br>Ambos en movimiento: fx = ((c-v)/(c-u))fs</br>Donde:
		<ul>
			<li>
				fx = Frecuencia aparente c = Velocidad del sonido
			</li>
			<li>
				v = Velocidad del observador u = Velocidad de la fuente
			</li>
			<li>
				fs = Frecuencia de la fuente
			</li>
		</ul>
	</p>
</div>','ACÚSTICA');""",
    """INSERT INTO SUBTOPIC VALUES ('Definción de Óptica','<div>
	<h3>Definición de Óptica</h3>
	<p>
		La óptica es la rama de la física que estudia el comportamiento de la luz y, más generalmente, de las ondas electromagnéticas. Según el modelo utilizado para la luz, se distingue entre las siguientes ramas, por orden creciente de precisión (cada rama utiliza un modelo simplificado del empleado por la siguiente): La óptica geométrica: Trata a la luz como un conjunto de rayos que cumplen el principio de Fermat. Se utiliza en el estudio de la transmisión de la luz por medios homogéneos (lentes, espejos), la reflexión y la refracción.
	</p>
	<p>
		La óptica ondulatoria: Considera a la luz como una onda plana, teniendo en cuenta su frecuencia y longitud de onda. Se utiliza para el estudio de difracción e interferencia. La óptica electromagnética: Considera a la luz como una onda electromagnética, explicando así la reflectancia y transmitancia, y los fenómenos de polarización y anisotropía. La óptica cuántica u óptica física: Estudio cuántico de la interacción entre las ondas electromagnéticas y la materia, en el que la dualidad onda-corpúsculo desempeña un papel crucial.
	</p>
</div>','ÓPTICA');""",
    """INSERT INTO SUBTOPIC VALUES ('Fenómenos Ópticos','<div>
	<h3>Fenómenos Ópticos</h3>
	<p>
		<ul>
			<li>
				Difracción: En física, la difracción es un fenómeno característico de las ondas que consiste en la dispersión y curvado aparente de las ondas cuando encuentran un obstáculo. La difracción ocurre en todo tipo de ondas, desde ondas sonoras, ondas en la superficie de un fluido y ondas electromagnéticas como la luz y las ondas de radio. También sucede cuando un grupo de ondas de tamaño finito se propaga; por ejemplo, por culpa de la difracción, un haz angosto de ondas de luz de un láser deben finalmente divergir en un rayo más amplio a una distancia suficiente del emisor.
			</li>
			<li>
				Refracción: La refracción (del latín fractum, "quebrado") es el cambio de dirección que experimenta una onda electromagnética debido al cambio de velocidad cuando pasa de un medio con un índice de refracción dado a un medio con otro índice de refracción distinto. Un ejemplo de este fenómeno se ve cuando se sumerge un lápiz en un vaso con agua: el lápiz parece quebrado. También ocurre cuando la luz pasa por una capa de aire sobre una superficie caliente, produciendo un espejismo.
			</li>
			<li>
				Reflexión: En Óptica se refiere al fenómeno por el cual un rayo de luz que incide sobre una superficie es reflejado. El ángulo con la normal a esa superficie que forman los rayos incidente y reflejado son iguales. Se produce también un fenómeno de absorción diferencial en la superficie, por el cual la energía y espectro del rayo reflejado no coinciden con la del incidente. Para una explicación más detallada véase radiación electromagnética.
			</li>
			<li>
				Arco Iris: La Teoría Elemental del arco iris fue, sin embargo, anterior a Newton. Desarrollada primero por Antonius de Demini en 1611, fue retomada y refinada luego por René Descartes. Posteriormente, la Teoría Completa del arco iris fue propuesta en forma inicial por Thomas Young y, más tarde, elaborada en detalle por Potter y Airy.
			</li>
			<li>
				Aberración longitudinal: En óptica la aberración longitudinal es la distancia a lo largo del eje óptico desde el foco de los rayos paraxiales hasta el punto en que los rayos provenientes de los bordes exteriores de las lentes o superficies reflectantes intersectan dicho eje. En la aberración de cromatismo, la distancia, medida sobre el eje óptico, entre los focos de dos colores patrón.
			</li>
		</ul>
	</p>
</div>','ÓPTICA');""",
    """INSERT INTO SUBTOPIC VALUES ('Definción de Termodinámica','<div>
	<h3>Definición de Termodinámica</h3>
	<p>
		Los sistemas físicos que encontramos en la Naturaleza consisten en un agregado de un número muy grande de átomos. La materia está en uno de los tres estados: sólido, líquido o gas: En los sólidos, las posiciones relativas (distancia y orientación) de los átomos o moléculas son fijas. En los líquidos las distancias entre las moléculas son fijas, pero su orientación relativa cambia continuamente. En los gases, las distancias entre moléculas son en general, mucho más grandes que las dimensiones de las mismas. Las fuerzas entre las moléculas son muy débiles y se manifiestan principalmente en el momento en el que chocan. Por esta razón, los gases son más fáciles de describir que los sólidos y que los líquidos.
	</p>
	<p>
		El gas contenido en un recipiente está formado por un número muy grande de moléculas, 6.02·1023 moléculas en un mol de sustancia. Cuando se intenta describir un sistema con un número tan grande de partículas resulta inútil (e imposible) describir el movimiento individual de cada componente. Por lo que mediremos magnitudes que se refieren al conjunto: volumen ocupado por una masa de gas, presión que ejerce el gas sobre las paredes del recipiente y su temperatura. Estas cantidades físicas se denominan macroscópicas, en el sentido de que no se refieren al movimiento individual de cada partícula, sino del sistema en su conjunto. 
	</p>
</div>','TERMODINÁMICA');""",
    """INSERT INTO SUBTOPIC VALUES ('Conceptos básicos','<div>
	<h3>Conceptos básicos</h3>
	<p>
		Denominamos estado de equilibrio de un sistema cuando las variables macroscópicas presión p, volumen V, y temperatura T, no cambian. El estado de equilibrio es dinámico en el sentido de que los constituyentes del sistema se mueven continuamente.</br><img src="https://drive.google.com/uc?id=1mElZe0W5nfZO-n3Fhm-nzVetAWxfAL0o" alt="Conceptos básicos"></br>El estado del sistema se representa por un punto en un diagrama p-V. Podemos llevar al sistema desde un estado inicial a otro final a través de una sucesión de estados de equilibrio.
	</p>
	<p>
		Se denomina ecuación de estado a la relación que existe entre las variables p, V, y T. La ecuación de estado más sencilla es la de un gas ideal pV=nRT, donde n representa el número de moles, y R la constante de los gases R=0.082 atm·l/(K mol).
	</p>
	<p>
		Se denomina energía interna del sistema a la suma de las energías de todas sus partículas. En un gas ideal las moléculas solamente tienen energía cinética, los choques entre las moléculas se suponen perfectamente elásticos, la energía interna solamente depende de la temperatura.
	</p>
</div>','TERMODINÁMICA');""",
    """INSERT INTO SUBTOPIC VALUES ('Trabajo mecánico hecho por o sobre el sistema','<div>
	<h3>Trabajo mecánico hecho por o sobre el sistema</h3>
	<p>
		Consideremos, por ejemplo, un gas dentro de un cilindro. Las moléculas del gas chocan con las paredes cambiando la dirección de su velocidad, o de su momento lineal. El efecto del gran número de colisiones que tienen lugar en la unidad de tiempo se puede representar por una fuerza F que actúa sobre toda la superficie de la pared.</br><img src="https://drive.google.com/uc?id=1H9gy4VH8PdwSasAXBk4Xish8rg7r6CJJ" alt="Trabajo mecánica"></br>Si una de las paredes es un pistón móvil de área A, y éste se desplaza dx, el intercambio de energía del sistema con el mundo exterior puede expresarse como el trabajo realizado por la fuerza F a lo largo del desplazamiento dx.
	</p>
	<p>
		dW=-Fdx=-pAdx=-pdV</br>Siendo dV el cambio del volumen del gas. El signo menos indica que si el sistema realiza trabajo (incrementa su volumen) su energía interna disminuye, pero si se realiza trabajo sobre el sistema (disminuye su volumen) su energía interna aumenta. El trabajo total realizado cuando el sistema pasa del estado A cuyo volumen es VA al estado B cuyo volumen es VB.</br><img src="https://drive.google.com/uc?id=18vQOLie-08s-TqiIzkcSxYcX9Aajh5sB" alt="Volumen"></br>
	</p>
</div>','TERMODINÁMICA');""",
    """INSERT INTO SUBTOPIC VALUES ('Calor','<div>
	<h3>Calor</h3>
	<p>
		El calor no es una nueva forma de energía, es el nombre dado a una transferencia de energía de tipo especial en el que intervienen gran número de partículas. Se denomina calor a la energía intercambiada entre un sistema y el medio que le rodea debido a los choques entre las moléculas del sistema y el exterior al mismo y siempre que no pueda expresarse macroscópicamente como producto de fuerza por desplazamiento. Se debe distinguir también entre los conceptos de calor y energía interna de una sustancia. El flujo de calor es una transferencia de energía que se lleva a cabo como consecuencia de las diferencias de temperatura.
	</p>
	<p>
		La energía interna es la energía que tiene una sustancia debido a su temperatura, que es esencialmente a escala microscópica la energía cinética de sus moléculas. El calor se considera positivo cuando fluye hacia el sistema, cuando incrementa su energía interna. El calor se considera negativo cuando fluye desde el sistema, por lo que disminuye su energía interna.
	</p>
	<p>
		Cuando una sustancia incrementa su temperatura de TA a TB, el calor absorbido se obtiene multiplicando la masa (o el número de moles n) por el calor específico c y por la diferencia de temperatura TB-TA. Q=nc(TB-TA)
	</p>
	<p>
		Cuando no hay intercambio de energía (en forma de calor) entre dos sistemas, decimos que están en equilibrio térmico. Las moléculas individuales pueden intercambiar energía, pero en promedio, la misma cantidad de energía fluye en ambas direcciones, no habiendo intercambio neto. Para que dos sistemas estén en equilibrio térmico deben de estar a la misma temperatura.
	</p>
	<p>
		Transformaciones: La energía interna U del sistema depende únicamente del estado del sistema, en un gas ideal depende solamente de su temperatura. Mientras que la transferencia de calor o el trabajo mecánico dependen del tipo de transformación o camino seguido para ir del estado inicial al final.
	</p>
</div>','TERMODINÁMICA');""",
    """INSERT INTO SUBTOPIC VALUES ('Suma','<div>
	<h3>Suma</h3>
	<p>
		Se utiliza para juntar, agregar, unir, etc, 2 o más cantidades contables de la misma magnitud (categoría) La suma o adición es una operación aritmética definida sobre conjuntos de números (naturales, enteros, racionales, reales y complejos) y también sobre estructuras asociadas a ellos, como espacios vectoriales con vectores cuyas componentes sean estos números o funciones que tengan su imagen en ellos.</br>En el álgebra moderna se utiliza el nombre suma y su símbolo "+" para representar la operación formal de un anillo que dota al anillo de estructura de grupo abeliano, o la operación de un módulo que dota al módulo de estructura de grupo abeliano. También se utiliza a veces en teoría de grupos para representar la operación que dota a un conjunto de estructura de grupo. En estos casos se trata de una denominación puramente simbólica, sin que necesariamente coincida esta operación con la suma habitual en números, funciones, vectores.
	</p>
	<div>
		<h4>Propiedades de la suma</h4>
		<p>
			<ul>
				<li>
					Propiedad conmutativa: si se altera el orden de los sumandos no cambia el resultado, de esta forma, a+b=b+a.
				</li>
				<li>
					Propiedad asociativa: a+(b+c) = (a+b)+c
				</li>
				<li>
					Elemento neutro: 0. Para cualquier número a, a + 0 = 0 + a = a.
				</li>
				<li>
					Elemento opuesto. Para cualquier número entero, racional, real o complejo a, existe un número −a tal que a + (−a) = (−a) + a = 0. Este número −a se denomina elemento opuesto, y es único para cada a. No existe en algunos conjuntos, como el de los números naturales.
				</li>
			</ul>
			Estas propiedades pueden no cumplirse en casos de sumas infinitas. 
		</p>
	</div>
	<div>
		<h4>Notación</h4>
		<p>
			Si todos los términos se escriben individualmente, se utiliza el símbolo "+" (leído más). Con esto, la suma de los números 1, 2 y 4 es 1 + 2 + 4 = 7. También se puede emplear el símbolo "+" cuando, a pesar de no escribirse individualmente los términos, se indican los números omitidos mediante puntos suspensivos y es sencillo reconocer los números omitidos. Por ejemplo: 1 + 2 + 3 + ... + 98 + 99 + 100 es la suma de los cien primeros números naturales. 2 + 4 + 8 + ... + 512 + 1024 es la suma de las diez primeras potencias de 2.
		</p>
		<p>
			En sumas largas e incluso sumas infinitas se emplea un nuevo símbolo, que se llama sumatorio y se representa con la letra griega Sigma mayúscula (Σ). Por ejemplo: <img src="https://drive.google.com/uc?id=1Xf06E1T_E8sjxmI4xPLESFFtbzJfLwfW" alt="suma"> es la suma de los cien primeros números naturales. <img src="https://drive.google.com/uc?id=1R7SUH5ZdUD81zgrPme5yfoUww0f9lmml" alt="suma"> es la suma de las diez primeras potencias de 2.
		</p>
	</div>
	<div>
		<h4>Suma de fracciones</h4>
		<p>
			<ul>
				<li>
					Fracciones que tienen el mismo denominador; Fracciones que tienen el distinto denominador Primer caso: la suma de dos ó más fracciones que tienen el mismo denominador es muy sencilla, sólo hay que sumar los numeradores y se deja el denominador común.
				</li>
				<li>
					La suma de dos o más fracciones con distinto denominador es un poco menos sencilla.
				</li>
			</ul>
		</p>
	</div>
</div>','OPERACIONES BÁSICAS');""",
    """INSERT INTO SUBTOPIC VALUES ('Resta','<div>
	<h3>Resta</h3>
	<p>
		Se utiliza para restar, descontar, disminuir, etc., 2 o más cantidades contables de la misma magnitud (categoría) La resta o substracción es una de las cuatro operaciones básicas de la aritmética, y se trata básicamente de la operación inversa a la suma. Por ejemplo, si a+b=c, entonces c-b=a. En la resta, el primer número se denomina minuendo y el segundo es el sustraendo. El resultado de la resta se denomina diferencia.
	</p>
	<p>
		En el conjunto de los números naturales, N, sólo se pueden restar dos números si el minuendo es mayor que el sustraendo. De lo contrario, la diferencia sería un número negativo, que por definición estaría excluido del conjunto. Esto es así para otros conjuntos con ciertas restricciones, como los números reales positivos. En matemáticas avanzadas no se habla de "restar" sino de "sumar el opuesto". En otras palabras, no se tiene a - b sino a + (-b), donde -b es el elemento opuesto de b respecto de la suma.
	</p>
	<div>
		<h4>Resta de fracciones</h4>
		<p>
			<ul>
				<li>
					Resta de fracciones que tienen el mismo denominador: Para restar dos o más fracciones que tienen el mismo denominador, sólo hay que restar los numeradores y se deja el denominador común.
				</li>
				<li>
					Resta de fracciones con distinto denominador: Se haya el mínimo común múltiplo de los dos denominadores, Se calculan los numeradores con la fórmula, se procede como en la resta de fracciones de igual denominador (dado que las fracciones tienen el mismo denominador).
				</li>
			</ul>
		</p>
	</div>
</div>','OPERACIONES BÁSICAS');""",
    """INSERT INTO SUBTOPIC VALUES ('Multiplicación','<div>
	<h3>Multiplicación</h3>
	<p>
		Se utiliza para resolver problemas donde se suman “n” veces las mismas cantidades. El producto o la multiplicación es una operación aritmética que se puede explicar como una manera de sumar números idénticos.
	</p>
	<p>
		El resultado de la multiplicación de números se llama producto. Los números que se multiplican se llaman factores o coeficientes, e individualmente como multiplicando (número a sumar) y multiplicador (veces que se suma el multiplicando). La multiplicación se suele indicar con el aspa × o el punto centrado ·. En ausencia de estos caracteres se suele emplear el asterisco *, sobre todo en computación.
	</p>
	<div>
		<h4>Definición</h4>
		<p>
			La multiplicación de dos números enteros n y m se define como: m×n = m + m + m +...+ m tal que hay n sumandos.
			</br>
			<img src="https://drive.google.com/uc?id=1u5bZJwtt5v75fH2WWgrOq_4Q0qNYjtKE" alt="multiplicacion">
		</p>
	</div>
	<div>
		<h4>Propiedades de la multiplicación</h4>
		<p>
			<ul>
				<li>
					Propiedad conmutativa: el orden en que se multiplican dos números es irrelevante, lo que se conoce como propiedad conmutativa, y se cumple en general para dos números cualesquiera x e y: x·y = y·x
				</li>
				<li>
					Propiedad asociativa: que consiste en que, para tres números cualesquiera x, y y z, se cumple: (x·y)z = x(y·z)
				</li>
				<li>
					Propiedad distributiva con la suma, porque: x(y + z) = xy + xz. Asimismo: (x + t)(y + z) = x(y + z) + t(y + z) = xy + xz + ty + tz
				</li>
				<li>
					Elemento identidad: la multiplicación tiene un elemento identidad que es el 1, cualquier número multiplicado por 1 es igual a sí mismo: 1·x = x
				</li>
			</ul>
			¿Qué ocurre con el cero? La definición inicial no ayuda mucho porque 1 es mayor que 0. De hecho, es más fácil definir el producto por cero utilizando la segunda definición: m·0 = m + m + m +...+ m donde hay cero sumandos. La suma de cero veces m es cero, así que m·0 = 0 sin importar lo que valga m, siempre que sea finito.
		</p>
	</div>
	<div>
		<h4>Producto de números negativos</h4>
		<p>
			El producto de números negativos también requiere reflexionar un poco. Primero, considérese el número -1. Para cualquier entero positivo m: (-1)m = (-1) + (-1) +...+ (-1) = -m
		</p>
		<p>
			Éste es un resultado interesante que muestra que cualquier número negativo no es más que un número positivo multiplicado por -1. Así que la multiplicación de enteros cualesquiera se puede representar por la multiplicación de enteros positivos y factores -1. Lo único que queda por definir es el producto de (-1)(-1):(-1)(-1) = -(-1) = 1
		</p>
		<p>
			De esta forma, se define la multiplicación de dos enteros. Las definiciones pueden extenderse a conjuntos cada vez mayores de números: primero el conjunto de las fracciones o números racionales, después a todos los números reales y finalmente a los números complejos y otras extensiones de los números reales. El producto vacío, es decir, multiplicar cero factores, vale 1.
		</p>
	</div>
</div>','OPERACIONES BÁSICAS');""",
    """INSERT INTO SUBTOPIC VALUES ('División','<div>
	<h3>División</h3>
	<p>
		Se utiliza para determinar “n” partes iguales de una cantidad determinada, dividir una magnitud en partes iguales. En matemáticas, específicamente en aritmética elemental, la división es una operación aritmética que es la inversa de la multiplicación y a veces puede interpretarse como una resta repetida.
	</p>
	<p>
		En otras palabras, consiste en averiguar cuántas veces un número (el divisor) está contenido en otro número (el dividendo). En la división de números enteros además del dividendo y el divisor intervienen otros números. Así al resultado entero de la división se le denomina cociente y si la división no es exacta, es decir, el divisor no está contenido un número exacto de veces en el dividendo, la operación tendrá un resto, donde: resto = dividendo - cociente × divisor
	</p>
</div>','OPERACIONES BÁSICAS');""",
    """INSERT INTO SUBTOPIC VALUES ('Orden de operaciones','<div>
	<h3>Orden de Operaciones</h3>
	<p>
		<ul>
			<li>
				Primero resolver todo lo que esté dentro de símbolos de agrupación.
			</li>
			<li>
				Evaluar las expresiones exponenciales.
			</li>
			<li>
				Hacer todas las multiplicaciones y divisiones en orden de izquierda a derecha.
			</li>
			</ul>
	Ejemplo:</br><img src="https://drive.google.com/uc?id=1PapGvPB-SBKazJaAo-9tDkWI7sx1OJzF" alt="jerarquia">
	</p>
</div>','JERARQUÍA DE OPERACIONES');""",
    """INSERT INTO SUBTOPIC VALUES ('Propiedades de los números reales','<div>
	<h3>Propiedades de los números reales</h3>
	<p>
		Conmutativa de adición: La conmutatividad implica que no importa el orden de operación, el resultado siempre es el mismo.
		</br>
		<img src="https://drive.google.com/uc?id=1m2l2ejhCKy8xOa9_XdhQiIKZWLuw6sQ1" alt="Conmutativa">
		</br>
		Por ejemplo: 4 + 2 = 2 + 4.
	</p>
	<p>
		Conmutativa de multiplicación:
		</br>
		<img src="https://drive.google.com/uc?id=1dpoMa-jdBYW7NXEk5qBkQLPfrbPsxS0A" alt="Conmutativa">
		</br>
		Por ejemplo: 4 . 2 = 2 . 4
	</p>
	<p>
		Asociativa de adición: La asociatividad implica que no importa el orden en que se agrupe, el resultado es el mismo.
		</br>
		<img src="https://drive.google.com/uc?id=19mGNlaTLNrxg8Lcf734qXosw7SwVSu83" alt="Asociativa">
		</br>
		Por ejemplo: (4 + 2) + 9 = 4 + (2 + 9)
	</p>
	<p>
		Asociativa de multiplicación:
		</br>
		<img src="https://drive.google.com/uc?id=16sAXbACGuZ3IZIxrPDx09bAiuQIBH1VJ" alt="Asociativa">
		</br>
		Por ejemplo: 4 . (2 . 9) = (4 . 2) . 9
	</p>
	<p>
		Distributiva de multiplicación sobre adición:
		</br>
		<img src="https://drive.google.com/uc?id=1WAr_vtSPgQ9Res0uicMSA6b8wU0dLawv" alt="Distributiva">
		</br>
		Por ejemplo: 4 . (2 + 9) = 4 . 2 + 4 . 9
	</p>
</div>','PROPIEDADES DE LOS NÚMEROS REALES');""",
    """INSERT INTO SUBTOPIC VALUES ('Reglas de los signos','<div>
	<h3>Reglas de los signos</h3>
	<p>
		En suma, de números con signos iguales, se suman los números y el resultado lleva el mismo signo. Si los números tienen signos diferentes, se restan y el resultado lleva el signo del mayor. Ejemplo:</br>5 + 8 = 13</br>5 + -8 = -3
	</p>
	<p>
		En resta de signos iguales el resultado lleva el signo del mayor. Si se restan signos diferentes, se suman los números y el resultado lleva el signo del mayor. Ejemplo:</br>5 - 8 = -3</br>5 - (-8) = 13
	</p>
	<p>
		En multiplicación y división de números con signos iguales el resultado es positivo. Si los números son signos opuestos, el resultado es negativo. Ejemplo:</br>5 x 8 = 40</br>5 x -8 = -40
	</p>
</div>','REGLAS DE LOS SIGNOS');""",
    """INSERT INTO SUBTOPIC VALUES ('Porcentaje','<div>
	<h3>Porcentaje</h3>
	<p>
		Un porcentaje es una forma de expresar una proporción o fracción como una fracción de denominador 100, es decir, como una cantidad de centésimas. Es decir, una expresión como "45%" ("45 por ciento") es lo mismo que la fracción 45/100. "El 45% de la población humana..." es equivalente a: "45 de cada 100 personas..."
	</p>
	<p>
		Un porcentaje puede ser un número mayor que 100. Por ejemplo, el 200% de un número es el doble de dicho número, o un incremento del 100%. Un incremento del 200% daría como resultado el triple de la cantidad inicial. De esta forma, se puede apreciar la relación que existe entre el aumento porcentual y el producto.
	</p>
	<div>
		<h4>Confusión en el uso de los porcentajes</h4>
		<p>
			Surgen muchas confusiones en el uso de los porcentajes debido a un uso inconsistente o a un mal entendimiento de la aritmética elemental.
		</p>
	</div>
	<div>
		<h4>Cambios</h4>
		<p>
			Debido a un uso inconsistente, no siempre está claro por el contexto con qué se compara un porcentaje. Cuando se habla de una subida o caída del 10% de una cantidad, la interpretación usual es que este cambio es relativo al valor inicial de la cantidad: por ejemplo, una subida del 10% sobre un producto que cuesta 100\$ es una subida de 10\$, con lo que el nuevo precio pasa a ser 110\$. Para muchos, cualquier otra interpretación es incorrecta.
		</p>
		<p>
			En el caso de los tipos de interés, sin embargo, es práctica común utilizar los porcentajes de otra manera: supongamos que el tipo de interés inicial es del 10%, y que en un momento dado sube al 20%. Esto se puede expresar como una subida del 100% si se calcula el aumento con respecto del valor inicial del tipo de interés. Sin embargo, mucha gente dice en la práctica que "los tipos de interés han subido un 10%", refiriéndose a que ha subido en un 10% sobre el 100% adicional al 10% inicial (20% en total), aunque en la expresión usual de los porcentajes debería querer decir una subida del 10% sobre el 10% inicial (es decir, un total del 11%).
		</p>
		<p>
			Para evitar esta confusión, se suele emplear la expresión "punto porcentual". Así, en el ejemplo anterior, "los tipos de interés han subido en 10 puntos porcentuales" no daría lugar a confusión, sino que todos entenderían que los tipos están actualmente en el 20%. También se emplea la expresión "punto base", que significa la centésima parte de un punto porcentual (es decir, una parte entre diez mil). Así, los tipos de interés han subido en 1000 puntos base.
		</p>
	</div>
	<div>
		<h4>Cancelaciones</h4>
		<p>
			Un error común en el uso de porcentajes es imaginar que una subida de un determinado porcentaje se cancela con una caída del mismo porcentaje. Una subida del 50% sobre 100 es 100 + 50, o 150, pero una reducción del 50% sobre 150 es 150 - 75, o 75. En general, el efecto final de un aumento seguido de una reducción proporcionalmente igual es: (1 + x)(1 - x) = 1 - x² es decir, una reducción proporcional al cuadrado del cambio porcentual.
		</p>
		<p>
			Los que tenían acciones punto como en el momento de la crisis acabaron comprendiendo que, aunque una acción haya caído un 99%, puede volver a caer otro 99%. Además, si sube por un porcentaje muy grande, seguirá perdiéndolo todo si un día la acción reduce su valor en un 100%, porque entonces no valdrá nada.
		</p>
	</div>
</div>','CÁLCULO DE PORCENTAJES');""",
    """INSERT INTO SUBTOPIC VALUES ('Regla de tres','<div>
	<h3>Regla de tres</h3>
	<p>
		La regla de tres es una relación que se establece entre tres (o más) valores conocidos y una incógnita. Normalmente se usa cuando se puede establecer una relación de linealidad (proporcionalidad) entre todos los valores involucrados (análogo para proporcionalidad inversa).
	</p>
	<p>
		Normalmente se representa de la siguiente forma:</br>A - B</br>X - C</br>Siendo A, B y C valores conocidos y X la incógnita cuyo valor queremos averiguar. Esto se lee de la siguiente manera: A es a B como X es a C. La posición de la incógnita puede variar, por supuesto.
	</p>
	<p>
		Así por ejemplo para pasar 60 grados a radianes podríamos establecer la siguiente regla de tres:</br>360º - 2 ^ x π</br>60º   - X
	</p>
</div>','REGLA DE TRES');""",
    """INSERT INTO SUBTOPIC VALUES ('Notación exponencial','<div>
	<h3>Notación Exponencial</h3>
	<p>
		La notación exponencial se usa para repetir multiplicaciones de un mismo número. Es la elevación a la enésima potencia (n) de una base (X).</br><img src="https://drive.google.com/uc?id=1Ur4zdrJWsgPrG0G3kQXYiG2Htr8wFMME" alt="Notación"></br>Ejemplos:</br><img src="https://drive.google.com/uc?id=1rBEp9HkHyV2uFTpMgCV2MIFMbKiyp9sZ" alt="ejemplo">
	</p>
</div>','POTENCIA Y RAÍZ');""",
    """INSERT INTO SUBTOPIC VALUES ('Raíz cuadrada','<div>
	<h3>Raíz cuadrada</h3>
	<p>
		En matemáticas, la raíz cuadrada de un número real no negativo x es el número real no negativo que, multiplicado consigo mismo, da x. La raíz cuadrada de x se denota por √x. Por ejemplo, √16 = 4, ya que 4 × 4 = 16, y √2 = 1,41421
	</p>
	<p>
		Las raíces cuadradas son importantes en la resolución de ecuaciones cuadráticas. La generalización de la función raíz cuadrada a los números negativos da lugar a los números imaginarios y al campo de los números complejos.
	</p>
	<p>
		El símbolo de la raíz cuadrada se empleó por primera vez en el siglo XVI. Se ha especulado con que tuvo su origen en una forma alterada de la letra r minúscula, que representaría la palabra latina "radix", que significa "raíz".
	</p>
	<div>
		<h4>Propiedades de la raíz cuadrada</h4>
		<p>
			Las siguientes propiedades de la raíz cuadrada son válidas para todos los números positivos x, y:
			</br>
			<img src="https://drive.google.com/uc?id=1UXwbS31sYp7sthSC0LZCLxSDLabbcPFe" alt="propiedad uno">
			</br>
			<img src="https://drive.google.com/uc?id=1IdlmXZ18iNfpjArkkrqVRK5cPBPk0ZL7" alt="propiedad dos">
			</br>
			<img src="https://drive.google.com/uc?id=1PM1eS22Nkj3X6vfJk4SQ_04t9Bkxmz-Y" alt="propiedad tres"> para todo número real x
			</br>
			<img src="https://drive.google.com/uc?id=1o8qnMa6k5x3Xjuq0j5WFEX9F42Z6bwBz" alt="propiedad tres">
			</br>
			La función raíz cuadrada, en general, transforma números racionales en números algebraicos; √x es racional si y sólo si x es un número racional que puede escribirse como fracción de dos cuadrados perfectos. Si el denominador es 1² = 1, entonces se trata de un número natural. Sin embargo, √2 es irracional. La función raíz cuadrada transforma la superficie de un cuadrado en la longitud de su lado.
		</p>
	</div>
</div>','POTENCIA Y RAÍZ');""",
    """INSERT INTO SUBTOPIC VALUES ('Propiedades de los números','<div>
	<h3>Propiedades de los números</h3>
	<p>
		Un número es un símbolo que representa una cantidad. Los números son ampliamente utilizados en matemáticas, pero también en muchas otras disciplinas y actividades, así como de forma más elemental en la vida diaria.
	</p>
	<p>
		El número es también una entidad abstracta con la que se describe una cantidad. Los números más conocidos son los números naturales 0, 1, 2, ..., que se usan para contar. Si añadimos los números negativos obtenemos los enteros. Cocientes de enteros generan los números racionales. Si incluimos todos los números que son expresables con decimales, pero no con fracciones de enteros, obtenemos los números reales; si a éstos les añadimos los números complejos, tendremos todos los números necesarios para resolver cualquier ecuación algebraica. Podemos ampliar aún más los números, si añadimos los infinitos y los transfinitos.
	</p>
	<p>
		Entre los reales, existen números que no son soluciones de una ecuación polinomial o algebraica. Reciben el nombre de transcendentales. El ejemplo más famoso de estos números es π (Pi), otro ejemplo fundamental e igual de importante es e, base de los logaritmos naturales. Estos dos números están relacionados entre sí por la identidad de Euler, también llamada la fórmula más importante del mundo.
	</p>
	<p>
		Existe toda una teoría de los números. Se distinguen distintos tipos de números:
		<ul>
			<li>
				Números naturales: conjunto de números que utilizamos para contar cantidades enteras  positivas
			</li>
			<li>
				Números racionales
			</li>
			<li>
				Números reales
			</li>
			<li>
				Números irracionales
			</li>
			<li>
				Números trascendentes
			</li>
			<li>
				Números complejos
			</li>
			<li>
				Números infinitos
			</li>
			<li>
				Números transfinitos
			</li>
			<li>
				Números fundamentales: π y e
			</li>
		</ul>
		Por mencionar algunos.
	</p>
	<p>
		El estudio de ciertas propiedades que cumplen los números ha producido una enorme cantidad de tipos de números, la mayoría sin un interés matemático específico. A continuación, se indican algunos:
		<ul>
			<li>
				Narcisista: Número de n dígitos que resulta ser igual a la suma de las potencias de orden n de sus dígitos. Ejemplo: 153 = 1³ + 5³ + 3³.
			</li>
			<li>
				Omirp: Número primo que al invertir sus dígitos da otro número primo. Ejemplo : 1597 y 7951 son primos.
			</li>
			<li>
				Vampiro: Número que se obtiene a partir del producto de dos números obtenidos a partir de sus dígitos. Ejemplo: 2187 = 27 x 81.
			</li>
		</ul>
	</p>
	<p>
		Una vez entendido el problema de la naturaleza y la clasificación de los números, surge otro, más práctico, pero que condiciona todo lo que se va a hacer con ellos: la manera de escribirlos. El sistema que se ha impuesto universalmente es la numeración de posición gracias al invento del cero, con una base constante.
	</p>
</div>','PROPIEDADES DE LOS NÚMEROS');"""
  ];

/*










*/

  Future loadAllData() async {
    await DBProvider.db.insertRecordsModule();
    await DBProvider.db.insertRecordsTopic();
    await DBProvider.db.insertRecordsSubtopic();
  }
}
