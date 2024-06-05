class DiagnosesController < ApplicationController

  def new
    @diagnosis = Diagnosis.new
    @patient = Patient.find(params[:patient_id])
  end

  def create
    @patient = Patient.find(params[:diagnosis][:patient_id])
    @diagnosis = @patient.diagnoses.build(diagnosis_params)
    if @diagnosis.save
      redirect_to intermediate_view_patient_diagnosis_path(@patient.id, @diagnosis.id)
    else
      render 'new'
    end
  end

  def intermediate_view
    @patient = Patient.find(params[:patient_id])
    @diagnosis = Diagnosis.find(params[:id])
  end

  private

  def diagnosis_params
    params.require(:diagnosis).permit(:historia_desde, :perdida_peso, :historia_condicion, :historia_cirugia, :sintomas_episodios, :sintomas_dificultad, :sintomas_sensacion, :sintomas_dolor, :sintomas_frecuencia, :sintomas_evita_alimentos, :sintomas_cansancio, :sintomas_tiempo, :sintomas_nuevo)
  end
end

