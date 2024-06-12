module DegluconversorHelper
    def obtener_descripcion(tabla, nivel)
      descripcion_niveles
      @descripciones[tabla.to_sym][nivel]
    end
  
    private
  
    def descripcion_niveles
      @descripciones = {
        fils: {
          1 => "Disfagia Severa. Nada de alimentación vía oral. La deglución es difícil o imposible. Existen signos de aspiración y no existe reflejo de deglución. No es posible realizar un entrenamiento de la deglución.",
          2 => "Disfagia Severa. Nada de alimentación vía oral. Presencia de aspiración, pero tiene la capacidad de rehabilitarse desde el punto de vista de la deglución de manera indirecta en un comienzo, no usando alimentos.",
          3 => "Disfagia Severa. Nada de alimentación vía oral. Aunque existen signos clínicos de aspiración, se puede entrenar directamente la deglución, pudiendo alimentarse solo con poca comida. El resto del aporte es por vía enteral.",
          4 => "Disfagia Moderada. Alimentación por vía oral y alternativa. La alimentación es enteral, pero es capaz de recibir aportes vía oral durante el tratamiento logopédico o por gusto, en pequeñas cantidades con cuidadores entrenados.",
          5 => "Disfagia Moderada. Alimentación por vía oral y alternativa. Alimentación vía oral 1 o 2 veces al día con alimentos adaptados de acuerdo al tratamiento. Vía de alimentación enteral para el agua y el resto de las comidas.",
          6 => "Disfagia Moderada. Alimentación por vía oral y alternativa. Puede alimentarse vía oral 3 veces al día con alimentos acordes a lo indicado en el tratamiento fonoaudiológico. El agua se aporta por vía enteral.",
          7 => "Disfagia Leve. Alimentación por vía oral exclusiva. Come 3 comidas por la vía oral. El agua se da con espesante y no se usa vía enteral.",
          8 => "Disfagia Leve. Alimentación por vía oral exclusiva. Puede comer normalmente 3 veces al día, salvo para alimentos específicos que dificultan la deglución.",
          9 => "Disfagia Leve. Alimentación por vía oral exclusiva. No hay restricciones de dieta y todas las comidas por vía oral son con supervisión.",
          10 => "Disfagia Leve. Alimentación por vía oral exclusiva. No hay restricciones de dieta. El paciente ingiere todo con normalidad."
        },
        fois: {
          1 => "Dependiente de vía alternativa de alimentación: Nada por vía oral, solo vía alternativa.",
          2 => "Dependiente de vía alternativa de alimentación: Dependiente de alguna vía alternativa y mínima vía oral de alimentos o líquidos.",
          3 => "Dependiente de vía alternativa de alimentación: Dependiente de vía alternativa con consistente vía oral de alimentos o líquidos.",
          4 => "Ingesta por vía oral exclusiva: Vía oral total de una única consistencia.",
          5 => "Ingesta por vía oral exclusiva:  oral total con múltiples consistencias, pero con necesidades de preparación especial o compensaciones.",
          6 => "Ingesta por vía oral exclusiva: Vía oral total con múltiples consistencias, sin necesidades de preparación especial o compensaciones, pero con restricciones alimentarias.",
          7 => "Ingesta por vía oral exclusiva: Vía oral total sin restricciones."
        },
        doss: {
          1 => "Vía oral suspendida. Nada de nutrición oral. Disfagia severa: vía oral suspendida. No tolera administración por vía oral de forma segura. " + 
              "Puede presentar uno o más de los siguiente síntomas: \n" +
              "- Retención severa del bolo en la faringe, siendo incapaz de despejarlo. \n" +
              "- Pérdida o retención severa del bolo en la etapa oral, siendo incapaz de despejarlo. \n" +
              "- Aspiración silente en dos o más consistencias, con tos voluntaria no funcional. \n" +
              "- Imposibilidad de tragar.",
          2 => "Vía oral suspendida. Nada de nutrición oral. Disfagia moderada/severa: Máxima asistencia o uso de estrategias con vía oral parcial (tolerancia de al menos una consistencia de forma segura con uso total de estrategias). " +
              "Puede presentar uno o más de los siguientes síntomas: \n" +
              "- Retención severa en la faringe, siendo incapaz de despejarlo o necesitando múltiples ayudas. \n" +
              "- Pérdida o retención severa del bolo en la etapa oral, siendo incapaz de despejarlo o necesitando múltiples ayudas.",
          3 => "Nutrición vía oral. Dieta modificada y/o independencia. Disfagia moderada: total asistencia, supervisión o estrategias, restricción de dos o más consistencias. " +
              "Puede presentar uno o más de los siguiente síntomas:\n" +
              "- Retención moderada en la faringe, despejado con ayuda.\n" +
              "- Retención moderada en la cavidad oral, despejado con ayuda.\n" +
              "- Penetración en la vía aérea a nivel de las cuerdas vocales sin tos con dos o más consistencias.\n" +
              "- Aspiración con dos consistencias con reflejo de tos débil o ausente.\n" +
              "- Aspiración con una consistencia, sin tos ni penetración.",
          4 => "Nutrición vía oral. Dieta modificada y/o independencia. Disfagia leve/moderada: supervisión intermitente, restricción de una o dos consistencias. " +
              "Puede presentar uno o más de los siguiente síntomas:\n" +
              "- Retención en la faringe, despejado con ayuda.\n" +
              "- Aspiración con una consistencia, con reflejo de tos débil o ausente.\n" +
              "- Penetración a nivel de los pliegues vocales con tos en dos consistencias.\n" +
              "- Penetración a nivel de los pliegues vocales sin tos con una consistencia.",
          5 => "Nutrición vía oral. Dieta normal. Disfagia leve: supervisión a distancia, puede necesitar de restricciones de una consistencia. " +
              "Puede presentar uno o más de los siguiente síntomas:\n" +
              "- Aspiración solamente de líquidos, pero con un fuerte reflejo de tos para despejar completamente.\n" +
              "- Penetración a la vía aérea antes de los pliegues vocales con una o más consistencias, o sobre las cuerdas vocales despejado espontáneamente.\n" +
              "- Retención en la faringe que es despejada espontáneamente.\n" +
              "- Leve disfagia oral con reducción de la masticación y/o retención oral que se despeja espontáneamente.",
          6 => "Nutrición por vía oral. Dieta normal. Con límites funcionales/independencia modificada: Dieta normal, deglución funcional. El paciente puede tener un leve retraso en la fase oral o faríngea, que no compromete significativamente la seguridad, sin restricciones dietéticas. " +
              "El paciente puede necesitar de tiempo extra para las comidas. No hay aspiraciones ni penetraciones en todas las consistencias.",
          7 => "Nutrición por vía oral. Dieta normal. Deglución funcional: No presenta disfagia."
        }
      }
    end
  end
  