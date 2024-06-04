class DiagnosesController < ApplicationController
  before_action :set_patient

  def index
    @diagnoses = @patient.diagnoses
  end

  def new
    @diagnosis = @patient.diagnoses.build
  end

  def new_disfagia
    @diagnosis = @patient.diagnoses.build
  end

  def create_disfagia
    @diagnosis = @patient.diagnoses.build(diagnosis_params)
    if @diagnosis.save
      redirect_to patient_diagnosis_path(@patient, @diagnosis), notice: 'Diagnóstico de disfagia registrado exitosamente.'
    else
      render :new_disfagia
    end
  end

  def create
    @diagnosis = @patient.diagnoses.build(diagnosis_params)
    @diagnosis.description = build_description(diagnosis_params)
    if @diagnosis.save
      redirect_to continue_patient_diagnosis_path(@patient, @diagnosis), notice: 'Diagnóstico creado exitosamente.'
    else
      render :new
    end
  end

  def update
    @diagnosis = Diagnosis.find(params[:id])
    @diagnosis.update(diagnosis_params)
    @diagnosis.description = build_description(diagnosis_params)
    if @diagnosis.save
      redirect_to patient_diagnosis_path(@patient, @diagnosis), notice: 'Diagnóstico actualizado exitosamente.'
    else
      render :edit
    end
  end

  private

  def build_description(diagnosis_params)
    description = ""
    diagnosis_params.each do |key, value|
      next if key == "date" || key == "severity"
      question = Question.find_by(field_name: key)&.question
      description += "#{question}: #{value}\n" if question.present?
    end
    description
  end

  def diagnosis_params
    params.require(:diagnosis).permit(
      :description, :severity, :date, :historia_desde, :perdida_peso, :historia_condicion,
      :historia_cirugia, :sintomas_episodios, :sintomas_dificultad, :sintomas_sensacion,
      :sintomas_dolor, :sintomas_frecuencia, :sintomas_evita_alimentos, :sintomas_cansancio,
      :sintomas_tiempo, :sintomas_nuevo, :escala
    )
  end

  def set_patient
    @patient = current_user.patients.find(params[:patient_id])
  end
end



