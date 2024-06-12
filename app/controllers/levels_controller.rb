class LevelsController < ApplicationController
    before_action :set_patient_and_diagnosis, only: [:new, :create]
  
    def new
      @level = Level.new
    end
  
    def create
      @level = @diagnosis.levels.build(level_params)
      if @level.save
        redirect_to menu_path, notice: "Diagnóstico y nivel de disfagia guardados exitosamente."
      else
        render 'new'
      end
    end
  
    private
  
    def set_patient_and_diagnosis
      @diagnosis = Diagnosis.find(params[:diagnosis_id])
      @patient = @diagnosis.patient
    end
  
    def level_params
      params.require(:level).permit(:escala, :severidad, :diagnosis_id)
    end
  end
  
