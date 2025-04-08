import 'package:flutter/material.dart';

final List<Map<String, dynamic>> shapes = [
  {
    'name': 'Lines',
    'icon': Icons.show_chart,
    'color': const Color(0xFFF76E11),
    'darkcolor': const Color(0xFFA3501D),
    'intro': {
      'definition': {
        'en': 'A line is a straight path that extends infinitely in both directions.',
        'es': 'Una línea es una trayectoria recta que se extiende infinitamente en ambas direcciones.'
      },
      'types': [
        {
          'title': {'en': 'Line', 'es': 'Línea Recta'},
          'description': {
            'en': 'It is a line that has no endpoints.',
            'es': 'Una línea que no tiene puntos finales.'
          },
          'image': {
            'en': 'assets/images/lines/line.png',
            'es': 'assets/images/lines/line_spanish.png'
          }
        },
        {
          'title': {'en': 'Ray', 'es': 'Rayo'},
          'description': {
            'en': 'A part of a line with one endpoint.',
            'es': 'Una parte de una línea con un punto final.'
          },
          'image': {
            'en': 'assets/images/lines/ray_learn.png',
            'es': 'assets/images/lines/ray_spanish.png'
          }
        },
        {
          'title': {'en': 'Line Segment', 'es': 'Segmento de Línea'},
          'description': {
            'en': 'A part of a line with two endpoints.',
            'es': 'Una parte de una línea con dos puntos finales.'
          },
          'image': {
            'en': 'assets/images/lines/segment_learn.png',
            'es': 'assets/images/lines/segment_spanish.png'
          }
        },
        {
          'title': {'en': 'Parallel Lines', 'es': 'Líneas Paralelas'},
          'description': {
            'en': 'Lines that never intersect.',
            'es': 'Líneas que nunca se intersecan.'
          },
          'image': {
            'en': 'assets/images/lines/parallel_lines.png',
            'es': 'assets/images/lines/parallel_lines_spanish.png'
          }
        },
        {
          'title': {'en': 'Perpendicular Lines', 'es': 'Líneas Perpendiculares'},
          'description': {
            'en': 'Lines that intersect at 90 degrees.',
            'es': 'Líneas que se intersecan en 90 grados.'
          },
          'image': {
            'en': 'assets/images/lines/perpendicular_lines.png',
            'es': 'assets/images/lines/perpendiculat_lines_spanish.png'
          }
        },
        {
          'title': {'en': 'Intersecting Lines', 'es': 'Líneas de Intersección'},
          'description': {
            'en': 'Lines that intersect at a point.',
            'es': 'Líneas que se intersecan en un punto.'
          },
          'image': {
            'en': 'assets/images/lines/intersecting_lines.png',
            'es': 'assets/images/lines/intersecting_lines_spanish.png'
          }
        },
      ],
      'mainImage': {
        'en': 'assets/images/lines/line_all_new.png',
        'es': 'assets/images/lines/line_all_spanish.png'
      },
    },
    'practice': {
      'questions': [
        {
          'question': 'What is a line?',
          'answers': [
            {'text': 'A curve', 'correct': false},
            {'text': 'A straight path', 'correct': true},
            {'text': 'A circle', 'correct': false},
          ],
          'questionImage': '',
        },
        {
          'question': 'What is a ray?',
          'answers': [
            {'text': 'Part of a line with two endpoints', 'correct': false},
            {'text': 'Part of a line with one endpoint', 'correct': true},
            {'text': 'A straight path', 'correct': false},
          ],
          'questionImage': '',
        },
        {
          'question': 'What is a line segment?',
          'answers': [
            {'text': 'Part of a line with one endpoint', 'correct': false},
            {'text': 'Part of a line with two endpoints', 'correct': true},
            {'text': 'A straight path', 'correct': false},
          ],
          'questionImage': '',
        },
        {
          'question': 'Which of the following statements is true?',
          'answers': [
            {'text': 'A ray has two endpoints.', 'correct': false},
            {'text': 'A line segment has one endpoint.', 'correct': false},
            {'text': 'A line has no endpoints.', 'correct': true},
          ],
          'questionImage': '',
        },
        {
          'question': 'If two lines never meet and are always the same distance apart, what is their relationship?',
          'answers': [
            {'text': 'The lines are parallel', 'correct': true},
            {'text': 'The lines are perpendicular', 'correct': false},
            {'text': 'The lines are horizontal', 'correct': false},
          ],
          'questionImage': '',
        },
        {
          'question': 'If two lines cross each other at a 90-degree angle, what type of lines are they?',
          'answers': [
            {'text': 'The lines are parallel', 'correct': false},
            {'text': 'The lines are perpendicular', 'correct': true},
            {'text': 'The lines are horizontal', 'correct': false},
          ],
          'questionImage': '',
        },
        {
          'question': 'Identify the line in this image.',
          'answers': [
            {'text': 'AB', 'correct': true},
            {'text': 'AC', 'correct': false},
            {'text': 'BC', 'correct': false},
          ],
          'questionImage': 'assets/images/lines/P7.png',
        },
        {
          'question': 'Which parts of this image represent rays?',
          'answers': [
            {'text': 'CB and CA', 'correct': true},
            {'text': 'AB and AC', 'correct': false},
            {'text': 'CB and AB', 'correct': true},
          ],
          'questionImage': 'assets/images/lines/P8.png',
        },
        {
          'question': 'Which parts of this image represent a line segment?',
          'answers': [
            {'text': 'AB', 'correct': false},
            {'text': 'DC', 'correct': true},
            {'text': 'BC', 'correct': false},
          ],
          'questionImage': 'assets/images/lines/P7.png',
        },
        {
          'question': 'Which point is the endpoint of the ray, and in which direction does it extend?',
          'answers': [
            {'text': 'Endpoint A, extends right', 'correct': false},
            {'text': 'Endpoint B, extends right', 'correct': false},
            {'text': 'Endpoint A, extends left', 'correct': true},
          ],
          'questionImage': 'assets/images/lines/P10.png',
        },
      ],
    },
    'quiz': {
      'questions': [
        {
          'question':
              'You are standing at the edge of a straight road that extends as far as you can see. What is the best geometric representation of this road?',
          'options': ['Line', 'Ray', 'Segment'],
          'correctAnswer': 'Line',
          'hint': 'A road extends infinitely on both sides.',
          'questionImage': 'assets/images/lines/quiz/lq1.webp',
        },
        {
          'question':
              'A flashlight is turned on in a dark room, emitting light in one direction. How can the path of light from the flashlight be represented?',
          'options': ['Line', 'Ray', 'Segment'],
          'correctAnswer': 'Ray',
          'hint':
              'The flashlight itself is one endpoint and the light extends infinitely in the direction it is pointed.',
          'questionImage': 'assets/images/lines/quiz/lq2.jpg',
        },
        {
          'question':
              'You are measuring the length of a wooden stick with a ruler. What geometric concept does the stick represent?',
          'options': ['Line', 'Ray', 'Segment'],
          'correctAnswer': 'Segment',
          'hint': 'The wooden stick has two endpoints.',
          'questionImage': 'assets/images/lines/quiz/lq3.jpg',
        },
        {
          'question':
              'Two railroad tracks run side by side and never meet, no matter how far they extend. How are these tracks geometrically classified?',
          'options': ['Perpendicular lines', 'Intersecting lines', 'Parallel line'],
          'correctAnswer': 'Parallel line',
          'hint': 'The railroads never meet.',
          'questionImage': 'assets/images/lines/quiz/lq4.jpg',
        },
        {
          'question':
              'A flagpole stands upright on flat ground. The pole and the ground meet at a right angle. How can this arrangement be described geometrically?',
          'options': ['Parallel lines', 'Intersecting lines', 'Perpendicular lines'],
          'correctAnswer': 'Perpendicular lines',
          'hint': 'Angle formed between pole and ground is exactly 90 degrees.',
          'questionImage': 'assets/images/lines/quiz/lq5.jpg',
        },
        {
          'question':
              'Two roads cross each other at an intersection but do not form right angles. What is the geometric relationship between these roads?',
          'options': ['Parallel lines', 'Perpendicular lines', 'Intersecting lines'],
          'correctAnswer': 'Intersecting lines',
          'hint': 'Angle between the two roads is not 90 degrees.',
          'questionImage': 'assets/images/lines/quiz/lq6.jpg',
        },
        {
          'question':
              'A basketball court has markings for the free throw lane. The sidelines of the court never touch, while the baseline and the sideline meet at a right angle. Which types of lines are the two sidelines and the sidelines and the baseline?',
          'options': [
            'Parallel and Intersecting',
            'Parallel and Perpendicular',
            'Perpendicular and Intersecting'
          ],
          'correctAnswer': 'Parallel and Perpendicular',
          'hint':
              'The sidelines never meet. The baseline and sideline meet at a 90 degree angle.',
          'questionImage': 'assets/images/lines/quiz/lq7.webp',
        },
        {
          'question':
              'A ladder leans against a wall. The wall is vertical, and the ground is horizontal. The ladder forms a triangle with the wall and the ground. Which two lines are perpendicular in this scenario?',
          'options': [
            'The ladder and the wall',
            'The ladder and the ground',
            'The wall and the ground'
          ],
          'correctAnswer': 'The wall and the ground',
          'hint': 'The wall and the ground meet at a 90 degree angle.',
          'questionImage': 'assets/images/lines/quiz/lq8.jpg',
        },
        {
          'question':
              'In a city grid system, the main street runs north-south, and cross streets run east-west. What is the relationship between the main street and any one of the cross streets?',
          'options': ['Parallel lines', 'Perpendicular lines', 'Rays'],
          'correctAnswer': 'Perpendicular lines',
          'hint': 'The main street and cross streets meet at a 90 degree angle.',
          'questionImage': 'assets/images/lines/quiz/lq9.jpg',
        },
        {
          'question':
              'You are driving on a highway with two lanes going in the same direction. These lanes run side by side without ever meeting. How can the geometric relationship between these lanes be described?',
          'options': ['Parallel lines', 'Perpendicular lines', 'Rays'],
          'correctAnswer': 'Parallel lines',
          'hint': 'The lanes never intersect.',
          'questionImage': 'assets/images/lines/quiz/lq10.jpg',
        },
      ],
    },
    'section': [
      {
        'title': 'Learn',
        'icon': Icons.book,
        'color': const Color(0xFFF76E11),
        'darkcolor': const Color(0xFFA3501D),
        'page': 'learn',
      },
      {
        'title': 'Practice',
        'icon': Icons.lightbulb_outline,
        'color': const Color(0xFFF76E11),
        'darkcolor': const Color(0xFFA3501D),
        'page': 'practice',
      },
      {
        'title': 'Quiz',
        'icon': Icons.question_answer_outlined,
        'color': const Color(0xFFF76E11),
        'darkcolor': const Color(0xFFA3501D),
        'page': 'quiz',
      },
    ],
  },
  {
    'name': 'Planes',
    'icon': Icons.view_stream,
    'color': const Color(0xFF09C4B0),
    'darkcolor': const Color(0xFF147E70),
    'intro': {
      'definition': {
        'en': 'A plane is a flat, two-dimensional surface that extends infinitely in all directions.',
        'es': 'Un plano es una superficie plana bidimensional que se extiende infinitamente en todas direcciones.'
      },
      'types': [
        {
          'title': {'en': 'Horizontal Plane', 'es': 'Plano Horizontal'},
          'description': {
            'en': 'A plane parallel to the horizon, like the surface of a table or floor.',
            'es': 'Un plano paralelo al horizonte, como la superficie de una mesa o el suelo.'
          },
          'image': {
            'en': 'assets/images/plane/Horizontal_E.png',
            'es': 'assets/images/plane/Horizontal_S.png'
          }
        },
        {
          'title': {'en': 'Vertical Plane', 'es': 'Plano Vertical'},
          'description': {
            'en': 'A plane perpendicular to the horizontal plane, such as a wall.',
            'es': 'Un plano perpendicular al plano horizontal, como una pared.'
          },
          'image': {
            'en': 'assets/images/plane/Vertical_E.png',
            'es': 'assets/images/plane/Vertical_S.png'
          }
        },
        {
          'title': {'en': 'Inclined Plane', 'es': 'Plano Inclinado'},
          'description': {
            'en': 'A plane at an angle to the horizontal, commonly known as a ramp.',
            'es': 'Un plano en ángulo con respecto al horizontal, conocido comúnmente como rampa.'
          },
          'image': {
            'en': 'assets/images/plane/Inclined_E.png',
            'es': 'assets/images/plane/Inclined_S.png'
          }
        },
      ],
      'mainImage': {
        'en': 'assets/images/plane/Plane_E.png',
        'es': 'assets/images/plane/Plane_S.png'
      },
    },
    'practice': {
      'questions': [
        {
          'question': 'What is a plane?',
          'answers': [
            {'text': 'A flat, two-dimensional surface', 'correct': true},
            {'text': 'A three-dimensional shape', 'correct': false},
            {'text': 'A curved surface', 'correct': false},
          ],
          'questionImage': '',
        },
        {
          'question': 'What is a horizontal plane?',
          'answers': [
            {'text': 'A plane parallel to the horizon', 'correct': true},
            {'text': 'A plane perpendicular to the horizon', 'correct': false},
            {'text': 'A slanted plane', 'correct': false},
          ],
          'questionImage': '',
        },
        {
          'question': 'What is a vertical plane?',
          'answers': [
            {'text': 'A plane parallel to the horizon', 'correct': false},
            {'text': 'A plane perpendicular to the horizon', 'correct': true},
            {'text': 'A slanted plane', 'correct': false},
          ],
          'questionImage': '',
        },
        {
          'question': 'Which of the following best describes an inclined plane?',
          'answers': [
            {'text': 'A plane that curves upward', 'correct': false},
            {'text': 'A flat surface at an angle to the ground', 'correct': true},
            {'text': 'A flat surface parallel to the ground', 'correct': false},
          ],
          'questionImage': '',
        },
        {
          'question': 'Which of these is an example of a horizontal plane in real life?',
          'answers': [
            {'text': 'A wall', 'correct': false},
            {'text': 'The surface of a table', 'correct': true},
            {'text': 'A ramp', 'correct': false},
          ],
          'questionImage': '',
        },
        {
          'question': 'True or False: A vertical plane is always parallel to the ground.',
          'answers': [
            {'text': 'True', 'correct': false},
            {'text': 'False', 'correct': true},
          ],
          'questionImage': '',
        },
        {
          'question': 'What are the types of planes?',
          'answers': [
            {'text': 'Horizontal, vertical, inclined', 'correct': true},
            {'text': 'Acute, obtuse, right', 'correct': false},
            {'text': 'None of the above', 'correct': false},
          ],
          'questionImage': '',
        },
        {
          'question': 'What angle does a vertical plane typically make with the ground?',
          'answers': [
            {'text': '45 degrees', 'correct': false},
            {'text': '90 degrees', 'correct': true},
            {'text': '180 degrees', 'correct': false},
          ],
          'questionImage': '',
        },
        {
          'question': 'Which of the following angles would an inclined plane make with the ground?',
          'answers': [
            {'text': '45 degrees', 'correct': true},
            {'text': '90 degrees', 'correct': false},
            {'text': '0 degrees', 'correct': false},
          ],
          'questionImage': '',
        },
        {
          'question': 'What angle does a horizontal plane typically make with the ground?',
          'answers': [
            {'text': '45 degrees', 'correct': false},
            {'text': '90 degrees', 'correct': false},
            {'text': '0 degrees', 'correct': true},
          ],
          'questionImage': '',
        },
      ],
    },
    'quiz': {
      'questions': [
        {
          'question':
              'A construction worker is building a ramp for a wheelchair. The ramp is inclined at a 12° angle with the ground. What type of plane does the ramp represent?',
          'options': ['Horizontal plane', 'Vertical plane', 'Inclined plane'],
          'correctAnswer': 'Inclined plane',
          'hint': 'This type of plane is sloped and helps objects move up or down gradually.',
          'questionImage': 'assets/images/plane/quiz/pq1.jpg',
        },
        {
          'question':
              'When an airplane takes off, it travels along a runway that is essentially a large flat surface. What type of plane is the runway considered to be?',
          'options': ['Horizontal plane', 'Vertical plane', 'Inclined plane'],
          'correctAnswer': 'Horizontal plane',
          'hint': 'This type of plane is flat and level with the ground.',
          'questionImage': 'assets/images/plane/quiz/pq2.jpg',
        },
        {
          'question':
              'A large sliding door in a building is mounted vertically and opens by sliding along the wall. What type of plane is the sliding door mounted on?',
          'options': ['Horizontal plane', 'Vertical plane', 'Inclined plane'],
          'correctAnswer': 'Vertical plane',
          'hint': 'This type of plane stands upright, like a wall.',
          'questionImage': 'assets/images/plane/quiz/pq3.jpg',
        },
        {
          'question':
              'A skier is descending a snow-covered slope. The slope forms an angle of 30° with the horizontal. What type of plane is the slope of the hill considered to be?',
          'options': ['Horizontal plane', 'Vertical plane', 'Inclined plane'],
          'correctAnswer': 'Inclined plane',
          'hint': 'Skiers typically go down this slanted type of surface.',
          'questionImage': 'assets/images/plane/quiz/pq4.jpg',
        },
        {
          'question':
              'A shelf in your house is mounted on the wall. The surface of the shelf is parallel to the ground. What type of plane is the shelf considered to be?',
          'options': ['Horizontal plane', 'Vertical plane', 'Inclined plane'],
          'correctAnswer': 'Horizontal plane',
          'hint': 'Think about a level surface where items rest without rolling.',
          'questionImage': 'assets/images/plane/quiz/pq5.jpg',
        },
        {
          'question':
              'In a science experiment, a student places a book on an inclined surface that forms a 15° angle with the floor. What type of plane does the inclined surface represent?',
          'options': ['Horizontal plane', 'Vertical plane', 'Inclined plane'],
          'correctAnswer': 'Inclined plane',
          'hint': 'An angled plane that causes items to slide or roll.',
          'questionImage': 'assets/images/plane/quiz/pq6.jpg',
        },
        {
          'question':
              'A photographer uses a vertical backdrop for a photo shoot, ensuring it is perfectly upright. What type of plane is the backdrop placed on?',
          'options': ['Horizontal plane', 'Vertical plane', 'Inclined plane'],
          'correctAnswer': 'Vertical plane',
          'hint': 'This plane goes straight up and down, like a standing wall.',
          'questionImage': 'assets/images/plane/quiz/pq7.jpg',
        },
        {
          'question':
              'A diver jumps from a diving board that extends horizontally over a pool. Which type of plane does the diving board represent?',
          'options': ['Horizontal plane', 'Vertical plane', 'Inclined plane'],
          'correctAnswer': 'Horizontal plane',
          'hint': 'A flat, level surface that’s parallel to the water below.',
          'questionImage': 'assets/images/plane/quiz/pq8.jpg',
        },
        {
          'question':
              'A car is parked on a road that is tilted to help rainwater drain. The slope of the road is at a 5° incline. What type of plane is the surface of the road considered to be?',
          'options': ['Horizontal plane', 'Vertical plane', 'Inclined plane'],
          'correctAnswer': 'Inclined plane',
          'hint': 'Even a slight slope counts as this kind of angled plane.',
          'questionImage': 'assets/images/plane/quiz/pq9.webp',
        },
        {
          'question':
              'In a factory, workers assemble parts on a conveyor belt. The conveyor belt is tilted slightly to move items. What type of plane does the surface of the conveyor belt represent?',
          'options': ['Horizontal plane', 'Vertical plane', 'Inclined plane'],
          'correctAnswer': 'Inclined plane',
          'hint': 'This type of plane helps items move from one height to another.',
          'questionImage': 'assets/images/plane/quiz/pq10.jpg',
        },
      ],
    },
    'section': [
      {
        'title': 'Learn',
        'icon': Icons.book,
        'color': const Color(0xFF09C4B0),
        'darkcolor': const Color(0xFF147E70),
        'page': 'learn',
      },
      {
        'title': 'Practice',
        'icon': Icons.lightbulb_outline,
        'color': const Color(0xFF09C4B0),
        'darkcolor': const Color(0xFF147E70),
        'page': 'practice',
      },
      {
        'title': 'Quiz',
        'icon': Icons.question_answer_outlined,
        'color': const Color(0xFF09C4B0),
        'darkcolor': const Color(0xFF147E70),
        'page': 'quiz',
      },
    ],
  },
  {
    'name': 'Angles',
    'icon': Icons.call_split,
    'color': const Color(0xFF8B5CF6),
    'darkcolor': const Color(0xFF5E3A70),
    'intro': {
      'definition': {
        'en': 'An angle is a figure formed by two rays sharing a common endpoint called the vertex.',
        'es': 'Un ángulo es una figura formada por dos rayos que comparten un punto final común llamado vértice.'
      },
      'types': [
        {
          'title': {'en': 'Acute Angle', 'es': 'Ángulo Agudo'},
          'description': {
            'en': 'An angle less than 90 degrees.',
            'es': 'Un ángulo menor de 90 grados.'
          },
          'image': {
            'en': 'assets/images/angles/Acute_E.png',
            'es': 'assets/images/angles/AcuteAngle_s.png'
          }
        },
        {
          'title': {'en': 'Right Angle', 'es': 'Ángulo Recto'},
          'description': {
            'en': 'An angle of exactly 90 degrees.',
            'es': 'Un ángulo de exactamente 90 grados.'
          },
          'image': {
            'en': 'assets/images/angles/Right_Angle_E.png',
            'es': 'assets/images/angles/RightAngle_S.png'
          }
        },
        {
          'title': {'en': 'Obtuse Angle', 'es': 'Ángulo Obtuso'},
          'description': {
            'en': 'An angle greater than 90 degrees.',
            'es': 'Un ángulo mayor de 90 grados.'
          },
          'image': {
            'en': 'assets/images/angles/ObtuseANgle_E.png',
            'es': 'assets/images/angles/ObtuseAngle_S.png'
          }
        },
        {
          'title': {'en': 'Straight Angle', 'es': 'Ángulo Rectilíneo'},
          'description': {
            'en': 'An angle of exactly 180 degrees.',
            'es': 'Un ángulo de exactamente 180 grados.'
          },
          'image': {
            'en': 'assets/images/angles/StraightAngle_E.png',
            'es': 'assets/images/angles/StraightAngle_S.png'
          }
        },
        {
          'title': {'en': 'Reflex Angle', 'es': 'Ángulo Reflejo'},
          'description': {
            'en': 'An angle greater than 180 degrees and less than 360 degrees.',
            'es': 'Un ángulo mayor de 180 grados y menor de 360 grados.'
          },
          'image': {
            'en': 'assets/images/angles/ReflexAngle_E.png',
            'es': 'assets/images/angles/ReflexAngle_S.png'
          }
        },
        {
          'title': {'en': 'Full Rotation Angle', 'es': 'Ángulo de Rotación Completa'},
          'description': {
            'en': 'An angle of exactly 360 degrees.',
            'es': 'Un ángulo de exactamente 360 grados.'
          },
          'image': {
            'en': 'assets/images/angles/FullRotationAngle_E.png',
            'es': 'assets/images/angles/FullRotationAngle_s.png'
          }
        },
      ],
      'mainImage': {
        'en': 'assets/images/angles/Angles_E.png',
        'es': 'assets/images/angles/Angles_S.png'
      },
    },
    'practice': {
      'questions': [
        {
          'question': 'What is the measure of a right angle?',
          'answers': [
            {'text': '90 degrees', 'correct': true},
            {'text': '45 degrees', 'correct': false},
            {'text': '120 degrees', 'correct': false},
          ],
          'questionImage': '',
        },
        {
          'question': 'What is the measure of an acute angle?',
          'answers': [
            {'text': 'Less than 90 degrees', 'correct': true},
            {'text': 'Exactly 90 degrees', 'correct': false},
            {'text': 'More than 90 degrees', 'correct': false},
          ],
          'questionImage': '',
        },
        {
          'question': 'What type of angle is this?',
          'answers': [
            {'text': 'Reflex Angle', 'correct': true},
            {'text': 'Acute Angle', 'correct': false},
            {'text': 'Straight Angle', 'correct': false},
          ],
          'questionImage': 'assets/images/angles/Reflex_Angle.png',
        },
        {
          'question': 'What is the measure of an obtuse angle?',
          'answers': [
            {'text': 'More than 90 degrees', 'correct': true},
            {'text': 'Exactly 90 degrees', 'correct': false},
            {'text': 'Less than 90 degrees', 'correct': false},
          ],
          'questionImage': '',
        },
        {
          'question': 'Which of the following lists correctly classifies the angles in order?',
          'answers': [
            {'text': 'Acute, Right, Reflex, Obtuse', 'correct': true},
            {'text': 'Acute, Right, Obtuse, Reflex', 'correct': false},
            {'text': 'Right, Acute, Obtuse, Reflex', 'correct': false},
          ],
          'questionImage': 'assets/images/angles/4.png',
        },
        {
          'question': 'Identify Obtuse Angle',
          'answers': [
            {'text': 'A', 'correct': false},
            {'text': 'B', 'correct': false},
            {'text': 'C', 'correct': true},
          ],
          'questionImage': 'assets/images/angles/3.png',
        },
        {
          'question': 'Identify Reflex Angle',
          'answers': [
            {'text': 'A', 'correct': false},
            {'text': 'B', 'correct': true},
            {'text': 'C', 'correct': false},
          ],
          'questionImage': 'assets/images/angles/3.png',
        },
        {
          'question': 'Which of the following could be the measure of a reflex angle?',
          'answers': [
            {'text': '90 degrees', 'correct': false},
            {'text': '45 degrees', 'correct': false},
            {'text': '220 degrees', 'correct': true},
          ],
          'questionImage': '',
        },
        {
          'question': 'What is the measure of a straight angle?',
          'answers': [
            {'text': '90 degrees', 'correct': false},
            {'text': '180 degrees', 'correct': true},
            {'text': '360 degrees', 'correct': false},
          ],
          'questionImage': '',
        },
        {
          'question': 'What is the measure of a full rotation angle?',
          'answers': [
            {'text': '90 degrees', 'correct': false},
            {'text': '45 degrees', 'correct': false},
            {'text': '360 degrees', 'correct': true},
          ],
          'questionImage': '',
        },
      ],
    },
    'quiz': {
      'questions': [
        {
          'question':
              'A ladder is leaning against a wall, forming an angle of 60° with the ground. What type of angle is formed between the ladder and ground?',
          'options': ['Acute Angle', 'Right Angle', 'Obtuse Angle'],
          'correctAnswer': 'Acute Angle',
          'hint': 'The angle is less than 90 degrees.',
          'questionImage': 'assets/images/angles/quiz/aq1.jpg',
        },
        {
          'question':
              'The hands of a clock show 10:10, forming an angle of approximately 150° between them. What type of angle is this?',
          'options': ['Right Angle', 'Obtuse Angle', 'Reflex Angle'],
          'correctAnswer': 'Obtuse Angle',
          'hint': 'Angle formed is greater than 90 degrees but less than 180 degrees.',
          'questionImage': 'assets/images/angles/quiz/aq2.png',
        },
        {
          'question':
              'A road sign shows a bend where the road turns sharply, forming a 90 degree angle. What type of angle does this represent?',
          'options': ['Right Angle', 'Straight Angle', 'Acute Angle'],
          'correctAnswer': 'Right Angle',
          'hint': 'Angle formed is exactly 90 degrees.',
          'questionImage': 'assets/images/angles/quiz/aq3.jpg',
        },
        {
          'question':
              'A seesaw is perfectly horizontal in its resting position. What angle is formed between the two sides?',
          'options': ['Straight Angle', 'Right Angle', 'Full Rotation Angle'],
          'correctAnswer': 'Straight Angle',
          'hint': 'Angle formed is exactly 180 degrees.',
          'questionImage': 'assets/images/angles/quiz/aq4.jpeg',
        },
        {
          'question':
              'A ferris wheel completes one full rotation (360°). What type of angle does this represent?',
          'options': ['Reflex Angle', 'Full Rotation Angle', 'Straight Angle'],
          'correctAnswer': 'Full Rotation Angle',
          'hint': 'Angle formed is exactly 360 degrees.',
          'questionImage': 'assets/images/angles/quiz/aq5.webp',
        },
        {
          'question':
              'A car ramp is inclined at an angle of 120° with the ground. What type of angle does this represent?',
          'options': ['Obtuse Angle', 'Acute Angle', 'Reflex Angle'],
          'correctAnswer': 'Obtuse Angle',
          'hint': 'Angle is greater than 90 degrees but less than 180 degrees.',
          'questionImage': 'assets/images/angles/quiz/aq6.jpg',
        },
        {
          'question':
              'The sails of a windmill form angles as they rotate. If two adjacent sails form an angle of exactly 90°, what type of angle is this?',
          'options': ['Acute Angle', 'Right Angle ', 'Straight Angle'],
          'correctAnswer': 'Right Angle ',
          'hint': 'Angle formed is exactly 90 degrees.',
          'questionImage': 'assets/images/angles/quiz/aq7.jpg',
        },
        {
          'question':
              'A pizza slice has a pointed tip forming an angle of approximately 30°. What type of angle is at the tip?',
          'options': ['Acute Angle', 'Right Angle', 'Obtuse Angle'],
          'correctAnswer': 'Acute Angle',
          'hint': 'Angle formed is less than 90 degrees.',
          'questionImage': 'assets/images/angles/quiz/aq8.jpg',
        },
        {
          'question':
              'The pages of an open book form an angle of about 180° when laid flat on a table. What type of angle is formed at the spine of the book?',
          'options': ['Straight Angle', 'Reflex Angle', 'Right Angle'],
          'correctAnswer': 'Straight Angle',
          'hint': 'Angle formed is exactly 180 degrees.',
          'questionImage': 'assets/images/angles/quiz/aq9.jpg',
        },
        {
          'question':
              'A slice of a circular pie has an angle of 45° at its tip. What type of angle is represented at the tip of the slice?',
          'options': ['Acute Angle', 'Obtuse Angle', 'Right Angle'],
          'correctAnswer': 'Acute Angle',
          'hint': 'Angle formed is less than 90 degrees.',
          'questionImage': 'assets/images/angles/quiz/aq10.webp',
        },
      ],
    },
    'section': [
      {
        'title': 'Learn',
        'icon': Icons.book,
        'color': const Color(0xFF8B5CF6),
        'darkcolor': const Color(0xFF5E3A70),
        'page': 'learn',
      },
      {
        'title': 'Practice',
        'icon': Icons.lightbulb_outline,
        'color': const Color(0xFF8B5CF6),
        'darkcolor': const Color(0xFF5E3A70),
        'page': 'practice',
      },
      {
        'title': 'Quiz',
        'icon': Icons.question_answer_outlined,
        'color': const Color(0xFF8B5CF6),
        'darkcolor': const Color(0xFF5E3A70),
        'page': 'quiz',
      },
    ],
  },
  {
    'name': 'Triangle',
    'icon': Icons.change_history,
    'color': const Color(0xFFFF5963),
    'darkcolor': const Color(0xFFC62828),
    'intro': {
      'definition': {
        'en': 'A triangle is a polygon with three edges and three vertices.',
        'es': 'Un triángulo es un polígono con tres lados y tres vértices.'
      },
      'types': [
        {
          'title': {'en': 'Equilateral Triangle', 'es': 'Triángulo Equilátero'},
          'description': {
            'en': 'A triangle with all three sides of equal length.',
            'es': 'Un triángulo con todos los lados de igual longitud.'
          },
          'image': {
            'en': 'assets/images/triangle/Equilateral_E.png',
            'es': 'assets/images/triangle/Equilateral_S.png'
          }
        },
        {
          'title': {'en': 'Isosceles Triangle', 'es': 'Triángulo Isósceles'},
          'description': {
            'en': 'A triangle with at least two sides of equal length.',
            'es': 'Un triángulo con al menos dos lados de igual longitud.'
          },
          'image': {
            'en': 'assets/images/triangle/Isoceles_E.png',
            'es': 'assets/images/triangle/Isoceles_S.png'
          }
        },
        {
          'title': {'en': 'Scalene Triangle', 'es': 'Triángulo Escaleno'},
          'description': {
            'en': 'A triangle with all sides of different lengths.',
            'es': 'Un triángulo con todos los lados de longitudes diferentes.'
          },
          'image': {
            'en': 'assets/images/triangle/Scalene_E.png',
            'es': 'assets/images/triangle/Scalene_S.png'
          }
        },
        {
          'title': {'en': 'Acute Triangle', 'es': 'Triángulo Acutángulo'},
          'description': {
            'en': 'A triangle in which all angles are acute (less than 90 degrees).',
            'es': 'Un triángulo en el que todos los ángulos son agudos (menores de 90 grados).'
          },
          'image': {
            'en': 'assets/images/triangle/Acute_E.png',
            'es': 'assets/images/triangle/Acute_S.png'
          }
        },
        {
          'title': {'en': 'Obtuse Triangle', 'es': 'Triángulo Obtusángulo'},
          'description': {
            'en': 'A triangle in which one angle is obtuse (greater than 90 degrees).',
            'es': 'Un triángulo en el que un ángulo es obtuso (mayor de 90 grados).'
          },
          'image': {
            'en': 'assets/images/triangle/Obtuse_E.png',
            'es': 'assets/images/triangle/Obtuse_S.png'
          }
        },
        {
          'title': {'en': 'Right Triangle', 'es': 'Triángulo Rectángulo'},
          'description': {
            'en': 'A triangle in which one angle is a right angle (90 degrees).',
            'es': 'Un triángulo en el que un ángulo es recto (90 grados).'
          },
          'image': {
            'en': 'assets/images/triangle/Right_E.png',
            'es': 'assets/images/triangle/Right_S.png'
          }
        },
      ],
      'mainImage': {
        'en': 'assets/images/triangle/Triangle_E.png',
        'es': 'assets/images/triangle/Triangle_S.png'
      },
    },
    'practice': {
      'questions': [
        {
          'question': 'What is the sum of angles in a triangle?',
          'answers': [
            {'text': '180 degrees', 'correct': true},
            {'text': '90 degrees', 'correct': false},
            {'text': '360 degrees', 'correct': false},
          ],
          'questionImage': '',
        },
        {
          'question': 'What is a triangle with all sides of equal length called?',
          'answers': [
            {'text': 'Equilateral triangle', 'correct': true},
            {'text': 'Isosceles triangle', 'correct': false},
            {'text': 'Scalene triangle', 'correct': false},
          ],
          'questionImage': '',
        },
        {
          'question': 'What defines a right-angled triangle?',
          'answers': [
            {'text': 'A triangle with one angle less than 90°', 'correct': false},
            {'text': 'A triangle with one angle equal to 90°', 'correct': true},
            {'text': 'A triangle with all sides equal', 'correct': false}, 
          ],
          'questionImage': '',
        },
        {
          'question': 'Which type of triangle has all angles less than 90°?',
          'answers': [
            {'text': 'Right triangle', 'correct': false},
            {'text': 'Obtuse triangle', 'correct': false}, 
            {'text': 'Acute triangle', 'correct': true},
          ],
          'questionImage': '',
        },
        {
          'question': 'How many equal sides does an isosceles triangle have?',
          'answers': [
            {'text': 'None', 'correct': false},
            {'text': 'Three', 'correct': false},
            {'text': 'Two', 'correct': true},
          ],
          'questionImage': '',
        },
        {
          'question': 'Which triangle has no equal sides?',
          'answers': [
            {'text': 'Scalene triangle', 'correct': true},
            {'text': 'Isosceles triangle', 'correct': false},
            {'text': 'Equilateral triangle', 'correct': false},
          ],
          'questionImage': '',
        },
        {
          'question': 'True or False: In an equilateral triangle, all angles are 60°.',
          'answers': [
            {'text': 'True', 'correct': true},
            {'text': 'False', 'correct': false},
          ],
          'questionImage': '',
        },
        {
          'question': 'Identify the type of triangle formed by sides of 3 cm, 4 cm, and 5 cm.',
          'answers': [
            {'text': 'Scalene triangle', 'correct': true},
            {'text': 'Isosceles triangle', 'correct': false},
            {'text': 'Acute triangle', 'correct': false},
          ],
          'questionImage': '',
        },
        {
          'question': 'What is a triangle with one angle greater than 90 degrees called?',
          'answers': [
            {'text': 'Acute triangle', 'correct': false},
            {'text': 'Obtuse triangle', 'correct': true},
            {'text': 'Right triangle', 'correct': false},
          ],
          'questionImage': '',
        },
        {
          'question': 'Which triangle has two equal angles and two equal sides?',
          'answers': [
            {'text': 'Isosceles triangle', 'correct': true},
            {'text': 'Right triangle', 'correct': false},
            {'text': 'Scalene triangle', 'correct': false},
          ],
          'questionImage': '',
        },
      ],
    },
    'quiz': {
      'questions': [
        {
          'question':
              'You see a road sign shaped like a triangle. It has all sides of equal length. What type of triangle is the sign?',
          'options': ['Equilateral', 'Isosceles', 'Scalene'],
          'correctAnswer': 'Equilateral',
          'hint': 'All three sides are of equal length.',
          'questionImage': 'assets/images/triangle/quiz/tq1.webp',
        },
        {
          'question':
              'The roof of a house has a triangular structure. The two sloping sides are equal in length, and the base is shorter. What type of triangle is the roof?',
          'options': ['Equilateral', 'Isosceles', 'Scalene'],
          'correctAnswer': 'Isosceles',
          'hint': 'Two sides are of equal length.',
          'questionImage': 'assets/images/triangle/quiz/tq2.webp',
        },
        {
          'question':
              'A slice of watermelon is cut into a triangular shape where all three sides are of same lengths. What type of triangle is it?',
          'options': ['Equilateral', 'Isosceles', 'Scalene'],
          'correctAnswer': 'Equilateral',
          'hint': 'All three sides are of equal length.',
          'questionImage': 'assets/images/triangle/quiz/tq3.jpg',
        },
        {
          'question':
              'A handkerchief is folded into a triangular shape where all the angles are smaller than 90 degrees. What type of triangle does it represent?',
          'options': ['Obtuse-angled', 'Right-angled', 'Acute-angled'],
          'correctAnswer': 'Acute-angled',
          'hint': 'All three angles are less than 90 degrees.',
          'questionImage': 'assets/images/triangle/quiz/tq4.jpg',
        },
        {
          'question':
              'A ladder placed against a wall forms a triangle with the ground. The angle between the ladder and the ground is 90 degrees. What type of triangle is formed?',
          'options': ['Acute-angled', 'Right-angled', 'Obtuse-angled'],
          'correctAnswer': 'Right-angled',
          'hint': 'One angle is exactly 90 degrees.',
          'questionImage': 'assets/images/triangle/quiz/q5.png',
        },
        {
          'question':
              'A wooden stand is shaped like a triangle, and one of its angles is more than 90 degrees. What kind of triangle is it?',
          'options': ['Right-angled', 'Scalene', 'Obtuse-angled'],
          'correctAnswer': 'Obtuse-angled',
          'hint': 'One angle is greater than 90 degrees.',
          'questionImage': 'assets/images/triangle/quiz/q7.png',
        },
        {
          'question':
              'You cut a piece of cardboard into a triangle with all sides of different lengths. What type of triangle is it?',
          'options': ['Equilateral', 'Scalene', 'Isosceles'],
          'correctAnswer': 'Scalene',
          'hint': 'All sides have different lengths.',
          'questionImage': 'assets/images/triangle/quiz/q7.png',
        },
        {
          'question':
              'A flag is made in a triangle shape where two angles are equal and one is different. What triangle does it represent?',
          'options': ['Isosceles', 'Scalene', 'Equilateral'],
          'correctAnswer': 'Isosceles',
          'hint': 'Two angles (and sides) are the same.',
          'questionImage': 'assets/images/triangle/quiz/q8.png',
        },
        {
          'question':
              'A bridge has triangular trusses with all angles measuring 60°. What type of triangle are the trusses shaped in?',
          'options': ['Isosceles', 'Equilateral', 'Acute-angled'],
          'correctAnswer': 'Equilateral',
          'hint': 'Each angle is 60°, and all sides are equal.',
          'questionImage': 'assets/images/triangle/quiz/q9.png',
        },
        {
          'question':
              'A pizza slice forms a triangle with two equal sides and a sharp tip. What kind of triangle is it likely to be?',
          'options': ['Scalene', 'Equilateral', 'Isosceles'],
          'correctAnswer': 'Isosceles',
          'hint': 'Two equal edges from the crust to the tip.',
          'questionImage': 'assets/images/triangle/quiz/q10.png',
        },
      ],
    },
    'section': [
      {
        'title': 'Learn',
        'icon': Icons.book,
        'color': const Color(0xFFFF5963),
        'darkcolor': const Color(0xFFC62828),
        'page': 'learn',
      },
      {
        'title': 'Practice',
        'icon': Icons.lightbulb_outline,
        'color': const Color(0xFFFF5963),
        'darkcolor': const Color(0xFFC62828),
        'page': 'practice',
      },
      {
        'title': 'Quiz',
        'icon': Icons.question_answer_outlined,
        'color': const Color(0xFFFF5963),
        'darkcolor': const Color(0xFFC62828),
        'page': 'quiz',
      },
    ],
  },
  {
    'name': 'Quadrilateral',
    'icon': Icons.crop_square,
    'color': const Color(0xFF5CB85C),
    'darkcolor': const Color(0xFF388E3C),
    'intro': {
      'definition': {
        'en': 'A quadrilateral is a polygon with four sides and four vertices.',
        'es': 'Un cuadrilátero es un polígono con cuatro lados y cuatro vértices.'
      },
      'types': [
        {
          'title': {'en': 'Square', 'es': 'Cuadrado'},
          'description': {
            'en': 'A quadrilateral with all four sides of equal length and all angles equal to 90 degrees.',
            'es': 'Un cuadrilátero con los cuatro lados de igual longitud y todos los ángulos de 90 grados.'
          },
          'image': {
            'en': 'assets/images/quadrilateral/Square_E.png',
            'es': 'assets/images/quadrilateral/Square_S.png'
          }
        },
        {
          'title': {'en': 'Rectangle', 'es': 'Rectángulo'},
          'description': {
            'en': 'A quadrilateral with opposite sides equal in length and all angles equal to 90 degrees.',
            'es': 'Un cuadrilátero con lados opuestos de igual longitud y todos los ángulos de 90 grados.'
          },
          'image': {
            'en': 'assets/images/quadrilateral/Rectangle_E.png',
            'es': 'assets/images/quadrilateral/Rectangle_S.png'
          }
        },
        {
          'title': {'en': 'Rhombus', 'es': 'Rombus'},
          'description': {
            'en': 'A quadrilateral with all four sides of equal length and opposite angles equal.',
            'es': 'Un cuadrilátero con los cuatro lados de igual longitud y ángulos opuestos iguales.'
          },
          'image': {
            'en': 'assets/images/quadrilateral/Rhombus_E.png',
            'es': 'assets/images/quadrilateral/Rhombus_S.png'
          }
        },
        {
          'title': {'en': 'Trapezoid', 'es': 'Trapecio'},
          'description': {
            'en': 'A quadrilateral with at least one pair of parallel sides.',
            'es': 'Un cuadrilátero con al menos un par de lados paralelos.'
          },
          'image': {
            'en': 'assets/images/quadrilateral/Trapezoid_E.png',
            'es': 'assets/images/quadrilateral/Trapezoid_S.png'
          }
        },
        {
          'title': {'en': 'Parallelogram', 'es': 'Paralelogramo'},
          'description': {
            'en': 'A quadrilateral with opposite sides parallel and equal in length.',
            'es': 'Un cuadrilátero con lados opuestos paralelos y de igual longitud.'
          },
          'image': {
            'en': 'assets/images/quadrilateral/Parallelogram_E.png',
            'es': 'assets/images/quadrilateral/Parallelogram_S.png'
          }
        },
        {
          'title': {'en': 'Kite', 'es': 'Cometa'},
          'description': {
            'en': 'A quadrilateral with two distinct pairs of adjacent sides that are equal in length.',
            'es': 'Un cuadrilátero con dos pares distintos de lados adyacentes de igual longitud.'
          },
          'image': {
            'en': 'assets/images/quadrilateral/Kite_E.png',
            'es': 'assets/images/quadrilateral/Kite_S.png'
          }
        },
      ],
      'mainImage': {
        'en': 'assets/images/quadrilateral/Quadrilateral_E.png',
        'es': 'assets/images/quadrilateral/Quadrilateral_S.png'
      },
    },
    'practice': {
      'questions': [
        {
          'question': 'Define a square',
          'answers': [
            {'text': 'A quadrilateral with two right angles', 'correct': false},
            {'text': 'A quadrilateral with all sides of equal length', 'correct': true},
            {'text': 'A quadrilateral with no right angles', 'correct': false},
          ],
          'questionImage': '',
        },
        {
          'question': 'Define a rectangle',
          'answers': [
            {'text': 'A quadrilateral with four right angles', 'correct': true},
            {'text': 'A quadrilateral with all sides of equal length', 'correct': false},
            {'text': 'A quadrilateral with no right angles', 'correct': false},
          ],
          'questionImage': '',
        },
        {
          'question': 'Define a parallelogram',
          'answers': [
            {'text': 'A quadrilateral with four right angles', 'correct': false},
            {'text': 'A quadrilateral with all sides of equal length', 'correct': false},
            {'text': 'A quadrilateral with opposite sides parallel', 'correct': true},
          ],
          'questionImage': '',
        },
        {
          'question': 'Define a Kite',
          'answers': [
            {'text': 'A quadrilateral with two distinct pairs of adjacent sides that are equal in length.', 'correct': true},
            {'text': 'A quadrilateral with all sides equal and opposite angles equal.', 'correct': false},
            {'text': 'A quadrilateral with only one pair of parallel sides.', 'correct': true},
          ],
          'questionImage': '',
        },
        {
          'question': 'Define a Rhombus',
          'answers': [
            {'text': 'A quadrilateral with all sides of equal length', 'correct': false},
            {'text': 'A quadrilateral with all four sides of equal length and opposite angles equal.', 'correct': true},
            {'text': 'A quadrilateral with four right angles', 'correct': false},
          ],
          'questionImage': '',
        },
        {
          'question': 'Define a Trapezoid',
          'answers': [
            {'text': 'A quadrilateral with one pair of parallel sides.', 'correct': true},
            {'text': 'A quadrilateral with two pairs of opposite sides equal and all angles 90°.', 'correct': false},
            {'text': 'A quadrilateral with four right angles', 'correct': false},
          ],
          'questionImage': '',
        },
        {
          'question': 'Which of the following quadrilaterals has only one pair of parallel sides?',
          'answers': [
            {'text': 'Rectangle', 'correct': false},
            {'text': 'Trapezoid', 'correct': true},
            {'text': 'Kite', 'correct': false},
          ],
          'questionImage': '',
        },
        {
          'question': 'What is a kite’s defining property?',
          'answers': [
            {'text': 'Two pairs of adjacent sides are equal', 'correct': true},
            {'text': 'All sides are equal', 'correct': false},
            {'text': 'It has no right angles', 'correct': false},
          ],
          'questionImage': '',
        },
        {
          'question': 'True or False: A rhombus is a parallelogram with all sides equal.',
          'answers': [
            {'text': 'True', 'correct': true},
            {'text': 'False', 'correct': false},
          ],
          'questionImage': '',
        },
        {
          'question': 'How many sides does a quadrilateral have?',
          'answers': [
            {'text': '3', 'correct': false},
            {'text': '5', 'correct': false},
            {'text': '4', 'correct': true},
          ],
          'questionImage': '',
        },
      ],
    },
    'quiz': {
      'questions': [
        {
          'question':
              'Which of these is commonly used for a standard window pane, where all four sides are equal and every angle forms a perfect right angle?',
          'options': ['Square', 'Rhombus', 'Trapezoid'],
          'correctAnswer': 'Square',
          'hint': 'All sides are of equal length and all angles are 90 degrees.',
          'questionImage': 'assets/images/quadrilateral/quiz/qq1.jpg',
        },
        {
          'question':
              'You are designing a table, and you want it to have opposite sides parallel and unequal in length, but with no right angles. What shape would best describe the tabletop?',
          'options': ['Parallelogram', 'Rectangle', 'Trapezoid'],
          'correctAnswer': 'Trapezoid',
          'hint': 'Two sides are parallel and opposite sides are of equal length.',
          'questionImage': 'assets/images/quadrilateral/quiz/qq2.jpg',
        },
        {
          'question':
              'The wings of a traditional kite often form a shape where two pairs of adjacent sides are equal. What shape does the kite resemble?',
          'options': ['Parallelogram', 'Kite', 'Trapezoid'],
          'correctAnswer': 'Kite',
          'hint': 'Length of two adjacent sides is the same.',
          'questionImage': 'assets/images/quadrilateral/quiz/qq3.jpg',
        },
        {
          'question':
              'Which quadrilateral would be most appropriate for the screen of a modern TV or smartphone, where opposite sides are equal and each angle forms a right angle?',
          'options': ['Parallelogram', 'Rectangle', 'Trapezoid'],
          'correctAnswer': 'Rectangle',
          'hint': 'Opposite sides are of equal lengths and all angles are 90 degrees.',
          'questionImage': 'assets/images/quadrilateral/quiz/qq4.webp',
        },
        {
          'question':
              'In designing a fancy picture frame, you want all four sides to be of equal length and each angle to be a right angle. What shape best describes this frame?',
          'options': ['Square', 'Rectangle', 'Kite'],
          'correctAnswer': 'Square',
          'hint': 'All sides are of equal length and all angles are 90 degrees.',
          'questionImage': 'assets/images/quadrilateral/quiz/qq5.jpg',
        },
        {
          'question':
              'A book cover has a simple and practical design where opposite sides are parallel and equal, and all angles are right angles. What quadrilateral shape describes the book cover?',
          'options': ['Kite', 'Rectangle', 'Rhombus'],
          'correctAnswer': 'Rectangle',
          'hint': 'Design with opposite sides parallel and equal, and all angles are right angles.',
          'questionImage': 'assets/images/quadrilateral/quiz/qq6.jpg',
        },
        {
          'question':
              'A diamond-shaped wall clock has all sides of equal length, but the angles are not 90 degrees. What shape does it represent?',
          'options': ['Rectangle', 'Rhombus', 'Square'],
          'correctAnswer': 'Rhombus',
          'hint': 'All sides are equal, but no right angles.',
          'questionImage': 'assets/images/quadrilateral/quiz/qq7.png',
        },
        {
          'question':
              'A trapeze artist’s safety net is stretched in a shape where only one pair of sides is parallel. What quadrilateral does this represent?',
          'options': ['Kite', 'Trapezoid', 'Rhombus'],
          'correctAnswer': 'Trapezoid',
          'hint': 'Only one pair of opposite sides are parallel.',
          'questionImage': 'assets/images/quadrilateral/quiz/qq8.png',
        },
        {
          'question':
              'A drawing board is designed with two pairs of equal-length adjacent sides, but the opposite sides are not equal or parallel. What shape is it?',
          'options': ['Kite', 'Parallelogram', 'Rectangle'],
          'correctAnswer': 'Kite',
          'hint': 'Two adjacent sides are of equal length.',
          'questionImage': 'assets/images/quadrilateral/quiz/qq9.png',
        },
        {
          'question':
              'You are tiling a floor with a pattern made of slanted quadrilaterals where opposite sides are equal and parallel, but angles are not 90 degrees. What shape are the tiles?',
          'options': ['Rhombus', 'Rectangle', 'Kite'],
          'correctAnswer': 'Rhombus',
          'hint': 'Opposite sides are equal and angles are slanted.',
          'questionImage': 'assets/images/quadrilateral/quiz/qq10.png',
        },
      ],
    },
    'section': [
      {
        'title': 'Learn',
        'icon': Icons.book,
        'color': const Color(0xFF5CB85C),
        'darkcolor': const Color(0xFF388E3C),
        'page': 'learn',
      },
      {
        'title': 'Practice',
        'icon': Icons.lightbulb_outline,
        'color': const Color(0xFF5CB85C),
        'darkcolor': const Color(0xFF388E3C),
        'page': 'practice',
      },
      {
        'title': 'Quiz',
        'icon': Icons.question_answer_outlined,
        'color': const Color(0xFF5CB85C),
        'darkcolor': const Color(0xFF388E3C),
        'page': 'quiz',
      },
    ],
  },
  {
    'name': 'Circle',
    'icon': Icons.circle,
    'color': const Color(0xFFFFB400),
    'darkcolor': const Color(0xFFB28704),
    'intro': {
      'definition': {
        'en': 'A circle is a closed shape where all points on the boundary are equidistant from the center.',
        'es': 'Un círculo es una forma cerrada donde todos los puntos del límite están a la misma distancia del centro.'
      },
      'types': [
        {
          'title': {'en': 'Radius', 'es': 'Radio'},
          'description': {
            'en': 'The distance from the center of the circle to any point on the circle.',
            'es': 'La distancia desde el centro del círculo a cualquier punto del círculo.'
          },
          'image': {
            'en': 'assets/images/circle/Raduis_E.png',
            'es': 'assets/images/circle/Raduis_S.png'
          }
        },
        {
          'title': {'en': 'Diameter', 'es': 'Diámetro'},
          'description': {
            'en': 'A line segment that passes through the center and has endpoints on the circle (twice the radius).',
            'es': 'Un segmento de línea que pasa por el centro y tiene puntos finales en el círculo (el doble del radio).'
          },
          'image': {
            'en': 'assets/images/circle/Diameter_E.png',
            'es': 'assets/images/circle/Diameter_S.png'
          }
        },
        {
          'title': {'en': 'Circumference', 'es': 'Circunferencia'},
          'description': {
            'en': 'The total distance around the circle.',
            'es': 'La distancia total alrededor del círculo.'
          },
          'image': {
            'en': 'assets/images/circle/Circumference_E.png',
            'es': 'assets/images/circle/Circumference_S.png'
          }
        },
        {
          'title': {'en': 'Chord', 'es': 'Acorde'},
          'description': {
            'en': 'A part of the circumference between two points on the circle.',
            'es': 'Una parte de la circunferencia entre dos puntos del círculo.'
          },
          'image': {
            'en': 'assets/images/circle/Chord_E.png',
            'es': 'assets/images/circle/Chord_S.png'
          }
        },
        {
          'title': {'en': 'Arc', 'es': 'Arco'},
          'description': {
            'en': 'A line segment connecting two points on the circle.',
            'es': 'Un segmento de línea que conecta dos puntos en el círculo.'
          },
          'image': {
            'en': 'assets/images/circle/Arc_E.png',
            'es': 'assets/images/circle/Arc_S.png'
          }
        },
        {
          'title': {'en': 'Tangent', 'es': 'Tangente'},
          'description': {
            'en': 'A straight line that touches the circle at one point without crossing it.',
            'es': 'Una línea recta que toca el círculo en un punto sin cruzarlo.'
          },
          'image': {
            'en': 'assets/images/circle/Tangent_E.png',
            'es': 'assets/images/circle/Tangent_S.png'
          }
        },
      ],
      'mainImage': {
        'en': 'assets/images/circle/circle_e.png',
        'es': 'assets/images/circle/circle_s.png'
      },
    },
    'practice': {
      'questions': [
        {
          'question': 'What is a circle?',
          'answers': [
            {'text': 'A closed shape with straight sides', 'correct': false},
            {'text': 'A closed shape where all points on the boundary are the same distance from the center', 'correct': true},
            {'text': 'A shape with four right angles', 'correct': false},
          ],
          'questionImage': '',
        },
        {
          'question': 'Define the radius of a circle',
          'answers': [
            {'text': 'A line that touches the circle at only one point', 'correct': false},
            {'text': 'The distance from the center of the circle to any point on the circle', 'correct': true},
            {'text': 'A part of the circle between two points on the boundary', 'correct': false},
          ],
          'questionImage': '',
        },
        {
          'question': 'What is the diameter of a circle?',
          'answers': [
            {'text': 'A line segment connecting the center to a point on the boundary', 'correct': false},
            {'text': 'A line segment passing through the center with endpoints on the circle', 'correct': true},
            {'text': 'The outer boundary of the circle', 'correct': false},
          ],
          'questionImage': '',
        },
        {
          'question': 'What is the circumference of a circle?',
          'answers': [
            {'text': 'The distance from the center to a point on the circle', 'correct': false},
            {'text': 'The total distance around the circle', 'correct': true},
            {'text': 'A line segment that connects any two points on the circle and passes through the center', 'correct': false},
          ],
          'questionImage': '',
        },
        {
          'question': 'Which part of the circle connects two points on the boundary?',
          'answers': [
            {'text': 'Tangent', 'correct': false},
            {'text': 'Chord', 'correct': true},
            {'text': 'Radius', 'correct': false},
          ],
          'questionImage': '',
        },
        {
          'question': 'What is an arc in a circle?',
          'answers': [
            {'text': 'A portion of the circumference between two points', 'correct': true},
            {'text': 'A line that touches the circle at one point only', 'correct': false},
            {'text': 'A segment passing through the center of the circle from one side to another', 'correct': false},
          ],
          'questionImage': '',
        },
        {
          'question': 'What is a tangent?',
          'answers': [
            {'text': 'A straight line that touches the circle at exactly one point and does not cross it', 'correct': true},
            {'text': 'A curved line that lies entirely inside the circle boundary', 'correct': false},
            {'text': 'A line that connects two points inside the circle', 'correct': false},
          ],
          'questionImage': '',
        },
        {
          'question': 'True or False: A diameter is twice the radius of a circle.',
          'answers': [
            {'text': 'True', 'correct': true},
            {'text': 'False', 'correct': false},
          ],
          'questionImage': '',
        },
        {
          'question': 'Which part of the circle refers to the straight distance around its boundary?',
          'answers': [
            {'text': 'Chord', 'correct': false},
            {'text': 'Arc', 'correct': false},
            {'text': 'Circumference', 'correct': true},
          ],
          'questionImage': '',
        },
        {
          'question': 'How many endpoints does a diameter have?',
          'answers': [
            {'text': '1', 'correct': false},
            {'text': '2', 'correct': true},
            {'text': '3', 'correct': false},
          ],
          'questionImage': '',
        },
      ],
    },
    'quiz': {
      'questions': [
        {
          'question':
              'You are designing a round wall clock. Which part of circle do the long hand of clock represents?',
          'options': ['Radius', 'Arc', 'Chord'],
          'correctAnswer': 'Radius',
          'hint': 'It goes from the center to the edge of the circle.',
          'questionImage': 'assets/images/circle/q1.png',
        },
        {
          'question':
              'A pizza is cut exactly in half from edge to edge through the center. What is the name of the line that makes this cut?',
          'options': ['Chord', 'Radius', 'Diameter'],
          'correctAnswer': 'Diameter',
          'hint': 'It’s the longest line that passes through the center.',
          'questionImage': 'assets/images/circle/q2.png',
        },
        {
          'question':
              'You tie a rope around a circular garden to fence it. What measurement are you calculating?',
          'options': ['Diameter', 'Circumference', 'Radius'],
          'correctAnswer': 'Circumference',
          'hint': 'It’s the total distance around the circle.',
          'questionImage': 'assets/images/circle/q3.png',
        },
        {
          'question':
              'You mark two points on a bicycle wheel and stretch a line straight between them — it doesn’t go through the center. What part of the circle is this?',
          'options': ['Chord', 'Radius', 'Diameter'],
          'correctAnswer': 'Chord',
          'hint': 'A straight line between two points that doesn’t pass through the center.',
          'questionImage': 'assets/images/circle/q4.png',
        },
        {
          'question':
              'You see a curved rainbow. What is this curved part called?',
          'options': ['Arc', 'Tangent', 'Radius'],
          'correctAnswer': 'Arc',
          'hint': 'It’s a portion of the circle’s curved boundary.',
          'questionImage': 'assets/images/circle/q5.png',
        },
        {
          'question':
              'A car tire touches the road at only one point while moving. What do we call the line that just touches the circle at one point?',
          'options': ['Chord', 'Diameter', 'Tangent'],
          'correctAnswer': 'Tangent',
          'hint': 'It touches the circle at one point and never goes inside.',
          'questionImage': 'assets/images/circle/q6.png',
        },
        {
          'question':
              'A dartboard has lines from the center to the edges dividing it into sections. What are those lines called?',
          'options': ['Radius', 'Chord', 'Tangent'],
          'correctAnswer': 'Radius',
          'hint': 'Each line starts from the center and ends on the boundary.',
          'questionImage': 'assets/images/circle/q7.png',
        },
        {
          'question':
              'You place a stick through the center of a round lollipop from one side to the other. What is the stick representing?',
          'options': ['Radius', 'Diameter', 'Chord'],
          'correctAnswer': 'Diameter',
          'hint': 'It passes through the center, connecting two opposite points.',
          'questionImage': 'assets/images/circle/q8.png',
        },
        {
          'question':
              'In a circular racetrack, a runner completes one full round. What distance did they cover?',
          'options': ['Diameter', 'Radius', 'Circumference'],
          'correctAnswer': 'Circumference',
          'hint': 'It’s the total path along the outer edge of the circle.',
          'questionImage': 'assets/images/circle/q9.png',
        },
        {
          'question':
              'You draw a triangle inside a circle such that each vertex touches the circle. What is the circle called in this case?',
          'options': ['Circumcircle', 'Arc', 'Tangent'],
          'correctAnswer': 'Circumcircle',
          'hint': 'It’s a circle that passes through all the triangle’s corners.',
          'questionImage': 'assets/images/circle/q10.png',
        },
      ],
    },
    'section': [
      {
        'title': 'Learn',
        'icon': Icons.book,
        'color': const Color(0xFFFFB400),
        'darkcolor': const Color(0xFFB28704),
        'page': 'learn',
      },
      {
        'title': 'Practice',
        'icon': Icons.lightbulb_outline,
        'color': const Color(0xFFFFB400),
        'darkcolor': const Color(0xFFB28704),
        'page': 'practice',
      },
      {
        'title': 'Quiz',
        'icon': Icons.question_answer_outlined,
        'color': const Color(0xFFFFB400),
        'darkcolor': const Color(0xFFB28704),
        'page': 'quiz',
      },
    ],
  },
];
