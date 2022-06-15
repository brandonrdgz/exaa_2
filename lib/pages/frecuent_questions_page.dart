import 'package:exaa_2/models/frecuent_question_model.dart';
import 'package:exaa_2/pages/about_page.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class FrecuentQuestion extends StatefulWidget {
  FrecuentQuestion({Key? key}) : super(key: key);

  @override
  State<FrecuentQuestion> createState() => _FrecuentQuestionState();
}

class _FrecuentQuestionState extends State<FrecuentQuestion> {
  List? contentList, generalList, howToUseTheAppList, conectionList;
  List<FrecuentQuestionModel> renderList = [];
  List<FrecuentQuestionModel> questions = [
    FrecuentQuestionModel(
        question: '¿Cómo estudiar un tema?',
        answer:
            'Para estudiar un tema antes de presentar un exámen se debe de ir al módulo de "Material didáctico"',
        category: 'Contenido'),
    FrecuentQuestionModel(
        question: '¿Cuántos módulos de estudio tenemos actualmente?',
        answer:
            'Actualmente sólo tenemos Pensamiento matemático, estructura de la lengua y física, en futuras actualizaciones se agregará el material para estudiar cálculo y comprensión lectora.',
        category: 'Contenido'),
    FrecuentQuestionModel(
        question:
            '¿Para presentar un examen es necesario estudiar un tema del módulo de "Material didáctico"?',
        answer:
            'No es necesario, prepararse previo al exámen con el material didáctico proporcionado, esto es opcional.',
        category: 'Contenido'),
    FrecuentQuestionModel(
        question: '¿Puedo revisar el material cuantas veces quiera?',
        answer:
            'Sí, el material se puede revisar las veces que sean necesarias',
        category: 'Contenido'),
    FrecuentQuestionModel(
        question: '¿Mis resultados son guardados?',
        answer:
            'Sí, los resultados son guardados para poder mostrar en el apartado de “Estadísticas” un análisis en forma de gráficos los resultados obtenidos en las pruebas.',
        category: 'Contenido'),
    FrecuentQuestionModel(
        question: '¿Qué es EXAA II?',
        answer:
            'Es una aplicación que permite a los usuarios preparse para sus exámenes de ingreso a la universidad a partir de un material didáctico y exámenes de simulación.',
        category: 'Preguntas generales'),
    FrecuentQuestionModel(
        question:
            '¿Con esto se me asegura que puedo entrar al Tecnológico de Toluca?',
        answer:
            'Con esta aplicación sólo podrás prepararte para tener un mejor desempeño en la prueba EXANI II, no se te asegura que entres al Tecnológico de Toluca.',
        category: 'Preguntas generales'),
    FrecuentQuestionModel(
        question: '¿Esta es la versión final de la app?',
        answer:
            'Esta aplicación recibirá actualizaciones constantes, trayendo mejoras como material de estudio adicional, exámenes por realizar, y más cosas estarán por llegar.',
        category: 'Preguntas generales'),
    FrecuentQuestionModel(
        question: '¿Es una aplicación gratuita?',
        answer: 'Esta aplicación es completamente gratuita.',
        category: 'Preguntas generales'),
    FrecuentQuestionModel(
        question: '¿Para qué usamos tus datos?',
        answer:
            'Los datos serán usados para mejorar la experiencia de usuario en futuras actualizaciones.',
        category: 'Preguntas generales'),
    FrecuentQuestionModel(
        question:
            '¿Es necesario contar con una conexión a internet para usar la app?',
        answer:
            'Sí, es necesario contar con una conexión a internet para poder ingresar a esta.',
        category: 'Conexión'),
    FrecuentQuestionModel(
        question: '¿Alguna especificación de conexión a internet?',
        answer: 'No, ninguna.',
        category: 'Conexión'),
    FrecuentQuestionModel(
        question: 'Si le red está inestable, ¿Afecta el uso de aplicación?',
        answer: 'Si, su funcionamiento no será el correcto.',
        category: 'Conexión'),
    FrecuentQuestionModel(
        question: '¿Por qué es necesario contar con una conexión a internet?',
        answer:
            'Esta es vital para el inicio de sesión y el registro de una nueva cuenta.',
        category: 'Conexión'),
    FrecuentQuestionModel(
        question:
            '¿Debo aceptar los términos y condiciones para poder registrarme?',
        answer:
            'Efectivamente, para hacer uso de la app es necesario aceptar los términos y condiciones dados durante el registro de una nueva cuenta.',
        category: '¿Cómo usar la app?'),
    FrecuentQuestionModel(
        question: '¿Cómo puedo visualizar mi progreso?',
        answer:
            'La aplicación cuenta con una pequeña parte de estadísticas, la cual nos permite visualizar el avance resultante de cada examen resuelto.',
        category: '¿Cómo usar la app?'),
    FrecuentQuestionModel(
        question: '¿Cómo inicio un examen?',
        answer:
            'Diríjase al apartado "Aplicación de un examen", ahí observará una página introductiva, está le diré las temáticas que cubrirá tal examen, de clic en "Siguiente" e inicie su prueba.',
        category: '¿Cómo usar la app?'),
    FrecuentQuestionModel(
        question: '¿Qué hago si no puedo iniciar sesión o registrarme?',
        answer:
            'Cheque su conexión a internet, si todo es correcto entonces verifique que los datos sean correctos. Si de las 2 anteriores soluciones no le fueron útiles comunicarse al siguiente correo: app.exaall@gmail.com',
        category: '¿Cómo usar la app?'),
    FrecuentQuestionModel(
        question: 'Si tengo una duda ¿A dónde puedo recurrir?',
        answer: 'Lea el apartado de "Preguntas frecuentes"',
        category: '¿Cómo usar la app?'),
    FrecuentQuestionModel(
        question: 'Si no estoy preparado para iniciar un exámen ¿Qué hago?',
        answer: 'Lea el apartado de "Material didáctico"',
        category: '¿Cómo usar la app?')
  ];
  String title = 'Preguntas Frecuentes';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              _buildDrawerHeader(),
              _buildDrawerItem(
                  icon: Icons.question_answer_sharp,
                  text: 'Preguntas generales',
                  onTap: () {
                    renderList = questions
                        .where((element) =>
                            element.category == 'Preguntas generales')
                        .toList();
                    title = 'Preguntas generales';
                    setState(() {});
                  }),
              _buildDrawerItem(
                  icon: Icons.menu_book_rounded,
                  text: 'Contenido',
                  onTap: () {
                    renderList = questions
                        .where((element) => element.category == 'Contenido')
                        .toList();
                    title = 'Contenido';
                    setState(() {});
                  }),
              _buildDrawerItem(
                  icon: Icons.clear_all_sharp,
                  text: '¿Cómo usar la app?',
                  onTap: () {
                    renderList = questions
                        .where((element) =>
                            element.category == '¿Cómo usar la app?')
                        .toList();
                    title = '¿Cómo usar la app?';
                    setState(() {});
                  }),
              _buildDrawerItem(
                  icon: Icons.network_cell,
                  text: 'Conexión',
                  onTap: () {
                    renderList = questions
                        .where((element) => element.category == 'Conexión')
                        .toList();
                    title = 'Conexión';
                    setState(() {});
                  }),
              Divider(),
              _buildDrawerItem(
                  icon: Icons.contact_phone,
                  text: 'Acerca de',
                  onTap: () => {Navigator.pushNamed(context, AboutPage.id)}),
              ListTile(
                title: Text('Versión 1.0'),
                onTap: () {},
              ),
            ],
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Center(
                child: Text(title,
                    style: TextStyle(
                        fontSize: 26.0, color: Colors.deepPurple.shade500)),
              ),
              CarouselSlider(
                options: CarouselOptions(height: 400.0),
                items: (renderList.isEmpty)
                    ? questions.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 10.0),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                          Colors.deepPurple.shade800,
                                          Colors.deepPurple.shade300,
                                        ]),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                        color: Colors.deepPurple.shade900,
                                        child: Center(
                                          child: Text(i.question,
                                              style: TextStyle(
                                                fontSize: 26.0,
                                                color: Colors.white,
                                              ),
                                              textAlign: TextAlign.center),
                                        )),
                                    Container(
                                      padding: EdgeInsets.only(
                                          right: 18, left: 18, top: 20),
                                      child: Center(
                                        child: Text(
                                          i.answer,
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.white),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ],
                                ));
                          },
                        );
                      }).toList()
                    : renderList.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 10.0),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                          Colors.deepPurple.shade800,
                                          Colors.deepPurple.shade300,
                                        ]),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                        color: Colors.deepPurple.shade900,
                                        child: Center(
                                          child: Text(i.question,
                                              style: TextStyle(
                                                fontSize: 26.0,
                                                color: Colors.white,
                                              ),
                                              textAlign: TextAlign.center),
                                        )),
                                    Container(
                                      padding: EdgeInsets.only(
                                          right: 18, left: 18, top: 20),
                                      child: Center(
                                        child: Text(
                                          i.answer,
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.white),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ],
                                ));
                          },
                        );
                      }).toList(),
              )
            ],
          ),
        ));
  }

  Widget _buildDrawerHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/design/drawerBackground.jpg'))),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 20.0,
              left: 20.0,
              child: Text("Categorías más preguntadas",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }

  Widget _buildDrawerItem(
      {IconData? icon, String? text, GestureTapCallback? onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text!),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
