class DegluconversorController < ApplicationController
    def transformar
      @tabla_seleccionada = params[:tabla_seleccionada]
      @nivel_seleccionado = params[:nivel_seleccionado]
      @tabla_destino = params[:tabla_destino]
      
      render 'degluconversor1'
    end

  end
  