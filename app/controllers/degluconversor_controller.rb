class DegluconversorController < ApplicationController
  helper DegluconversorHelper

  def transformar
    @niveles_fils = (1..10).to_a  # Asigna niveles del 1 al 10 para FILS
    @niveles_fois = (1..7).to_a   # Asigna niveles del 1 al 7 para FOIS
    @niveles_doss = (1..7).to_a   # Asigna niveles del 1 al 7 para DOSS
    @tabla_seleccionada = params[:tabla_seleccionada]
    @nivel_seleccionado = params[:nivel_seleccionado]
    @tabla_destino = params[:tabla_destino]
    
    
    fils = {
      1 => {
        "Nombre" => "Deglución severa nivel 1",
        "Aspiración" => true,
        "Reflejo de la deglución" => false,
        "Posible entrenamiento de la deglución" => false,
        "Alimentación por vía oral" => false,
        "Vía de alimentación" => "Alternativa"
      },
      2 => {
        "Nombre" => "Deglución severa nivel 2",
        "Aspiración" => true,
        "Posible entrenamiento de la deglución" => true,
        "Reflejo de la deglución" => false,
        "Alimentación por vía oral" => false,
        "Vía de alimentación" => "Alternativa"
      },
      3 => {
        "Nombre" => "Deglución severa nivel 3",
        "Aspiración" => true,
        "Posible entrenamiento de la deglución" => true,
        "Reflejo de la deglución" => true,
        "Alimentación por vía oral" => true,
        "Vía de alimentación" => "Alternativa y oral"
      },
      4 => {
        "Nombre" => "Disfagia moderada nivel 4",
        "Aspiración" => false,
        "Posible entrenamiento de la deglución" => true,
        "Alimentación por vía oral" => true,
        "Reflejo de la deglución" => true,
        "Vía de alimentación" => "Alternativa y oral"
      },
      5 => {
        "Nombre" => "Disfagia moderada nivel 5",
        "Posible entrenamiento de la deglución" => true,
        "Alimentación vía oral" => true,
        "Vía de alimentación" => "Alternativa y oral",
        "Cantidad de alimentacion oral al dia" => 1 || 2,
        "Vía de alimentacion enteral para el agua" => true
      },
      6 => {
        "Nombre" => "Disfagia moderada nivel 6",
        "Posible entrenamiento de la deglución" => true,
        "Alimentación vía oral" => true,
        "Vía de alimentación" => "Alternativa y oral",
        "Cantidad de alimentacion oral al dia" => 3,
        "Vía de alimentacion enteral para el agua" => true
      },
      7 => {
        "Nombre" => "Disfagia leve nivel 7",
        "Posible entrenamiento de la deglución" => true,
        "Alimentación vía oral" => true,
        "Vía de alimentación" => "Oral",
        "Cantidad de alimentacion oral al dia" => 3,
        "Vía de alimentacion enteral para el agua" => true
      },
      8 => {
        "Nombre" => "Disfagia leve nivel 8",
        "Posible entrenamiento de la deglución" => true,
        "Alimentación vía oral" => true,
        "Vía de alimentación" => "Oral",
        "Vía de alimentacion enteral para el agua" => false,
        "Agua con espesante" => true
      },
      9 => {
        "Nombre" => "Disfagia leve nivel 9",
        "Posible entrenamiento de la deglución" => true,
        "Alimentación vía oral" => true,
        "Vía de alimentación" => "Oral",
        "Vía de alimentacion enteral para el agua" => false,
        "Agua con espesante" => false,
        "Supervisión" => true
      },
      10 => {
        "Nombre" => "Disfagia leve nivel 10",
        "Posible entrenamiento de la deglución" => true,
        "Alimentación vía oral" => true,
        "Vía de alimentación" => "Oral",
        "Vía de alimentacion enteral para el agua" => false,
        "Agua con espesante" => false,
        "Supervisión" => false
      }
    }

    doss = {
      1 => {
        "Nombre" => "Disfagia severa",
        "Aspiración" => true,
        "Retención del bolo" => true,
        "Tos" => true,
        "Alimentación por vía oral" => false,
        "Cantidad de consistencias" => 0,
        "Vía de alimentación" => "Alternativa"
      },
      2 => {
        "Nombre" => "Disfagia moderada/severa",
        "Aspiración" => true,
        "Retención del bolo" => true,
        "Tos" => false,
        "Alimentación por vía oral" => false,
        "Penetración en la vía aérea" => true,
        "Supervisión/Asistencia en la alimentación" => true,
        "Cantidad de consistencias" => 1,
        "Vía de alimentación" => "Alternativa y oral"
      },
      3 => {
        "Nombre" => "Disfagia moderada",
        "Alimentación por vía oral" => true,
        "Supervisión/Asistencia en la alimentación" => true,
        "Cantidad de consistencias" => 1,
        "Vía de alimentación" => "Oral"
      },
      4 => {
        "Nombre" => "Disfagia leve a moderada",
        "Alimentación por vía oral" => true,
        "Supervisión/Asistencia en la alimentación" => "Supervisión intermitente",
        "Vía de alimentación" => "Oral"
      },
      5 => {
        "Nombre" => "Disfagia leve",
        "Alimentación por vía oral" => true,
        "Supervisión/Asistencia en la alimentación" => "Supervisión a distancia",
        "Vía de alimentación" => "Oral"
      },
      6 => {
        "Nombre" => "Disfagia dentro de límites funcionales",
        "Alimentación por vía oral" => true,
        "Penetración en la vía aérea" => false,
        "Vía de alimentación" => "Oral"
      },
      7 => {
        "Nombre" => "Disfagia dentro de límites de normalidad",
        "Alimentación por vía oral" => true,
        "Vía de alimentación" => "Oral",
        "Supervisión/Asistencia en la alimentación" => false
      }
    }

    fois = {
      1 => {
        "Nombre" => "Nivel 1",
        "Alimentación por vía oral" => false,
        "Cantidad de alimentación por vía oral" => "nada",
        "Vía de alimentación" => "Alternativa"
      },
      2 => {
        "Nombre" => "Nivel 2",
        "Alimentación por vía oral" => true,
        "Cantidad de alimentación por vía oral" => "mínima",
        "Vía de alimentación" => "Alternativa y oral"
      },
      3 => {
        "Nombre" => "Nivel 3",
        "Alimentación por vía oral" => true,
        "Cantidad de alimentación por vía oral" => "normal",
        "Vía de alimentación" => "Alternativa y oral"
      },
      4 => {
        "Nombre" => "Nivel 4",
        "Alimentación por vía oral" => true,
        "Cantidad de alimentación por vía oral" => "total",
        "Vía de alimentación" => "Oral"
      },
      5 => {
        "Nombre" => "Nivel 5",
        "Alimentación por vía oral" => true,
        "Vía de alimentación" => "Oral",
        "Múltiples consistencias" => true,
        "Necesidad de preparación especial" => true
      },
      6 => {
        "Nombre" => "Nivel 6",
        "Alimentación por vía oral" => true,
        "Vía de alimentación" => "Oral",
        "Múltiples consistencias" => true,
        "Necesidad de preparación especial" => false,
        "Restricciones alimenticias" => true
      },
      7 => {
        "Nombre" => "Nivel 7",
        "Alimentación por vía oral" => true,
        "Vía de alimentación" => "Oral",
        "Múltiples consistencias" => true,
        "Necesidad de preparación especial" => false,
        "Restricciones alimenticias" => false
      }
    }
    tablas = { "fils" => fils, "doss" => doss, "fois" => fois }

    tabla_seleccionada = params[:tabla_seleccionada]
    nivel_seleccionado = params[:nivel_seleccionado].to_i
    tabla_destino = params[:tabla_destino]

    via_de_alimentacion = tablas[tabla_seleccionada][nivel_seleccionado]["Vía de alimentación"]
    niveles_posibles = tablas[tabla_destino].select { |nivel, datos| datos["Vía de alimentación"] == via_de_alimentacion }.keys

    if niveles_posibles.one?
      nivel_equivalente = niveles_posibles.first
      @resultado = tablas[tabla_destino][nivel_equivalente]
      @nivel = niveles_posibles.map { |nivel| { nivel: nivel, nombre: tablas[tabla_destino][nivel]["Nombre"] } }
    else
      @resultado = nil
      @niveles_posibles = niveles_posibles.map { |nivel| { nivel: nivel, nombre: tablas[tabla_destino][nivel]["Nombre"] } }
    end
    render 'degluconversor1'  
  end

  def enviar
    @tabla_seleccionada = params[:tabla_seleccionada]
    @nivel_seleccionado = params[:nivel_seleccionado]
    @tabla_destino = params[:tabla_destino]
    @nivel = params[:nivel] 
    @descripcion_seleccionado = obtener_descripcion(@tabla_seleccionada, @nivel_seleccionado)
    @descripcion_destino = obtener_descripcion(@tabla_destino, @nivel)
    render 'degluconversor_tablas' 
  end

  def especificar
    @tabla_seleccionada = params[:tabla_seleccionada]
    @nivel_seleccionado = params[:nivel_seleccionado]
    @tabla_destino = params[:tabla_destino]

    # Obtén los niveles posibles desde alguna fuente de datos
    @niveles_posibles = params[:niveles_posibles]

    # Características faltantes que debes obtener de alguna fuente de datos
    @faltantes = calcular_faltantes(@tabla_destino, @nivel_seleccionado)

    if params[:commit]
      respuestas = params.permit(@faltantes).to_h
      mejor_coincidencia = nil
      coincidencias_maximas = 0
      preguntadas = {}

      @niveles_posibles.each do |nivel_hash|
        nivel = nivel_hash[:nivel]
        caracteristicas_destino = tablas[@tabla_destino][nivel]
        caracteristicas_seleccionadas = tablas[@tabla_seleccionada][@nivel_seleccionado].merge(respuestas)
        faltantes = caracteristicas_destino.keys - caracteristicas_seleccionadas.keys

        coincidencias = 0
        caracteristicas_destino.each do |caracteristica, valor|
          next if caracteristica == "Nombre"
          if caracteristicas_seleccionadas[caracteristica] == valor
            coincidencias += 1
          end
        end

        if coincidencias > coincidencias_maximas
          mejor_coincidencia = nivel
          coincidencias_maximas = coincidencias
        end
        preguntadas.merge!(respuestas)
      end

      if mejor_coincidencia
        nombre_mejor_coincidencia = tablas[@tabla_destino][mejor_coincidencia]["Nombre"]
        @resultado = { nivel: mejor_coincidencia, nombre: nombre_mejor_coincidencia }
      else
        @resultado = nil
        flash[:notice] = "Lo siento, no se encontró un nivel que coincida con las características seleccionadas."
      end
    end
    render 'degluconversor_especificar'
  end

  def calcular_faltantes(tabla_destino, nivel_seleccionado, tablas):
    caracteristicas_destino = set(tablas[tabla_destino][nivel_seleccionado].keys())
    caracteristicas_seleccionadas = set(tablas[tabla_seleccionada][nivel_seleccionado].keys())
    faltantes = caracteristicas_destino - caracteristicas_seleccionadas
    return faltantes

  end

  
    
  

  def obtener_descripcion(tabla, nivel)
    descripcion_niveles
    @descripciones[tabla.to_sym][nivel]
  end
  
  
  private
  def descripcion_niveles
    @descripciones = {
      fils: {
        "1" => "Disfagia Severa. Nada de alimentación vía oral. La deglución es difícil o imposible. Existen signos de aspiración y no existe reflejo de deglución. No es posible realizar un entrenamiento de la deglución.",
        "2" => "Disfagia Severa. Nada de alimentación vía oral. Presencia de aspiración, pero tiene la capacidad de rehabilitarse desde el punto de vista de la deglución de manera indirecta en un comienzo, no usando alimentos.",
        "3" => "Disfagia Severa. Nada de alimentación vía oral. Aunque existen signos clínicos de aspiración, se puede entrenar directamente la deglución, pudiendo alimentarse solo con poca comida. El resto del aporte es por vía enteral.",
        "4" => "Disfagia Moderada. Alimentación por vía oral y alternativa. La alimentación es enteral, pero es capaz de recibir aportes vía oral durante el tratamiento logopédico o por gusto, en pequeñas cantidades con cuidadores entrenados.",
        "5" => "Disfagia Moderada. Alimentación por vía oral y alternativa. Alimentación vía oral 1 o 2 veces al día con alimentos adaptados de acuerdo al tratamiento. Vía de alimentación enteral para el agua y el resto de las comidas.",
        "6" => "Disfagia Moderada. Alimentación por vía oral y alternativa. Puede alimentarse vía oral 3 veces al día con alimentos acordes a lo indicado en el tratamiento fonoaudiológico. El agua se aporta por vía enteral.",
        "7" => "Disfagia Leve. Alimentación por vía oral exclusiva. Come 3 comidas por la vía oral. El agua se da con espesante y no se usa vía enteral.",
        "8" => "Disfagia Leve. Alimentación por vía oral exclusiva. Puede comer normalmente 3 veces al día, salvo para alimentos específicos que dificultan la deglución.",
        "9" => "Disfagia Leve. Alimentación por vía oral exclusiva. No hay restricciones de dieta y todas las comidas por vía oral son con supervisión.",
        "10" => "Disfagia Leve. Alimentación por vía oral exclusiva. No hay restricciones de dieta. El paciente ingiere todo con normalidad."
      },
      fois: {
        "1" => "Dependiente de vía alternativa de alimentación: Nada por vía oral, solo vía alternativa.",
        "2" => "Dependiente de vía alternativa de alimentación: Dependiente de alguna vía alternativa y mínima vía oral de alimentos o líquidos.",
        "3" => "Dependiente de vía alternativa de alimentación: Dependiente de vía alternativa con consistente vía oral de alimentos o líquidos.",
        "4" => "Ingesta por vía oral exclusiva: Vía oral total de una única consistencia.",
        "5" => "Ingesta por vía oral exclusiva:  oral total con múltiples consistencias, pero con necesidades de preparación especial o compensaciones.",
        "6" => "Ingesta por vía oral exclusiva: Vía oral total con múltiples consistencias, sin necesidades de preparación especial o compensaciones, pero con restricciones alimentarias.",
        "7" => "Ingesta por vía oral exclusiva: Vía oral total sin restricciones."
      },
      doss: {
        "1" => "Vía oral suspendida. Nada de nutrición oral. Disfagia severa: vía oral suspendida. No tolera administración por vía oral de forma segura. " + 
            "Puede presentar uno o más de los siguiente síntomas: \n" +
            "- Retención severa del bolo en la faringe, siendo incapaz de despejarlo. \n" +
            "- Pérdida o retención severa del bolo en la etapa oral, siendo incapaz de despejarlo. \n" +
            "- Aspiración silente en dos o más consistencias, con tos voluntaria no funcional. \n" +
            "- Imposibilidad de tragar.",
        "2" => "Vía oral suspendida. Nada de nutrición oral. Disfagia moderada/severa: Máxima asistencia o uso de estrategias con vía oral parcial (tolerancia de al menos una consistencia de forma segura con uso total de estrategias). " +
            "Puede presentar uno o más de los siguientes síntomas: \n" +
            "- Retención severa en la faringe, siendo incapaz de despejarlo o necesitando múltiples ayudas. \n" +
            "- Pérdida o retención severa del bolo en la etapa oral, siendo incapaz de despejarlo o necesitando múltiples ayudas.",
        "3" => "Nutrición vía oral. Dieta modificada y/o independencia. Disfagia moderada: total asistencia, supervisión o estrategias, restricción de dos o más consistencias. " +
            "Puede presentar uno o más de los siguiente síntomas:\n" +
            "- Retención moderada en la faringe, despejado con ayuda.\n" +
            "- Retención moderada en la cavidad oral, despejado con ayuda.\n" +
            "- Penetración en la vía aérea a nivel de las cuerdas vocales sin tos con dos o más consistencias.\n" +
            "- Aspiración con dos consistencias con reflejo de tos débil o ausente.\n" +
            "- Aspiración con una consistencia, sin tos ni penetración.",
        "4" => "Nutrición vía oral. Dieta modificada y/o independencia. Disfagia leve/moderada: supervisión intermitente, restricción de una o dos consistencias. " +
            "Puede presentar uno o más de los siguiente síntomas:\n" +
            "- Retención en la faringe, despejado con ayuda.\n" +
            "- Aspiración con una consistencia, con reflejo de tos débil o ausente.\n" +
            "- Penetración a nivel de los pliegues vocales con tos en dos consistencias.\n" +
            "- Penetración a nivel de los pliegues vocales sin tos con una consistencia.",
        "5" => "Nutrición vía oral. Dieta normal. Disfagia leve: supervisión a distancia, puede necesitar de restricciones de una consistencia. " +
            "Puede presentar uno o más de los siguiente síntomas:\n" +
            "- Aspiración solamente de líquidos, pero con un fuerte reflejo de tos para despejar completamente.\n" +
            "- Penetración a la vía aérea antes de los pliegues vocales con una o más consistencias, o sobre las cuerdas vocales despejado espontáneamente.\n" +
            "- Retención en la faringe que es despejada espontáneamente.\n" +
            "- Leve disfagia oral con reducción de la masticación y/o retención oral que se despeja espontáneamente.",
        "6" => "Nutrición por vía oral. Dieta normal. Con límites funcionales/independencia modificada: Dieta normal, deglución funcional. El paciente puede tener un leve retraso en la fase oral o faríngea, que no compromete significativamente la seguridad, sin restricciones dietéticas. " +
            "El paciente puede necesitar de tiempo extra para las comidas. No hay aspiraciones ni penetraciones en todas las consistencias.",
        "7" => "Nutrición por vía oral. Dieta normal. Deglución funcional: No presenta disfagia."
      }
    }
  end
end


  
    