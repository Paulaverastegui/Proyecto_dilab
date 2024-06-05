class DiagnosesController < ApplicationController

  def new
    @diagnosis = Diagnosis.new
    @patient = Patient.find(params[:patient_id])
  end

  def create
    @patient = Patient.find(params[:diagnosis][:patient_id])
    @diagnosis = @patient.diagnoses.build(diagnosis_params)
    if @diagnosis.save
      redirect_to new_patient_diagnosis_level_path(patient_id: @patient.id, diagnosis_id: @diagnosis.id)

    else
      render 'new'
    end
  end

  private

  def diagnosis_params
    params.require(:diagnosis).permit(:historia_desde, :perdida_peso, :historia_condicion, :historia_cirugia, :sintomas_episodios, :sintomas_dificultad, :sintomas_sensacion, :sintomas_dolor, :sintomas_frecuencia, :sintomas_evita_alimentos, :sintomas_cansancio, :sintomas_tiempo, :sintomas_nuevo)
  end
end

