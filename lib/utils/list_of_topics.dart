import 'package:exaa_2/models/teaching_material/topic_model.dart';

class ListOfTopics {
  static List<TopicModel> topicsMath = [
    TopicModel(
        name_topic: 'Álgebra',
        description_topic: ' ',
        name_module: 'Pensamiento Matemático'),
    TopicModel(
        name_topic: 'Geometría',
        description_topic: ' ',
        name_module: 'Pensamiento Matemático'),
    TopicModel(
        name_topic: 'Ecuaciones lineales',
        description_topic: ' ',
        name_module: 'Pensamiento Matemático')
  ];

  static List<TopicModel> topicsCalculus = [
    TopicModel(
        name_topic: 'Límite funcional',
        description_topic: ' ',
        name_module: 'Cálculo'),
    TopicModel(
        name_topic: 'Límites', description_topic: ' ', name_module: 'Cálculo'),
    TopicModel(
        name_topic: 'Funciones trigonométricas',
        description_topic: ' ',
        name_module: 'Cálculo'),
    TopicModel(
        name_topic: 'Derivación',
        description_topic: ' ',
        name_module: 'Cálculo'),
  ];
  static List<TopicModel> topicsPhysics = [
    TopicModel(
        name_topic: 'Desplazamiento',
        description_topic: ' ',
        name_module: 'Física'),
    TopicModel(
        name_topic: 'Rotación', description_topic: ' ', name_module: 'Física'),
    TopicModel(
        name_topic: 'Primera ley de Newton',
        description_topic: ' ',
        name_module: 'Física'),
    TopicModel(
        name_topic: 'Momento ', description_topic: ' ', name_module: 'Física'),
  ];
  static List<TopicModel> topicsGramaticalStructure = [
    TopicModel(
        name_topic: 'Categorías gramaticales',
        description_topic: ' ',
        name_module: 'Estructura de la lengua'),
    TopicModel(
        name_topic: 'Reglas ortográficas',
        description_topic: ' ',
        name_module: 'Estructura de la lengua'),
    TopicModel(
        name_topic: 'Relaciones semánticas',
        description_topic: ' ',
        name_module: 'Estructura de la lengua'),
    TopicModel(
        name_topic: 'Lógica textual',
        description_topic: ' ',
        name_module: 'Estructura de la lengua'),
  ];
  static List<TopicModel> topicsLecture = [
    TopicModel(
        name_topic: 'Observación',
        description_topic: ' ',
        name_module: 'Comprensión lectora'),
    TopicModel(
        name_topic: 'Monitorización',
        description_topic: ' ',
        name_module: 'Comprensión lectora'),
    TopicModel(
        name_topic: 'Inferencia',
        description_topic: ' ',
        name_module: 'Comprensión lectora'),
    TopicModel(
        name_topic: 'Paráfrasis',
        description_topic: ' ',
        name_module: 'Comprensión lectora'),
    TopicModel(
        name_topic: 'Análisis',
        description_topic: ' ',
        name_module: 'Comprensión lectora'),
  ];
}
