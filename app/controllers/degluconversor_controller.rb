class DegluconversorController < ApplicationController
    def transformar
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

  end

 
  