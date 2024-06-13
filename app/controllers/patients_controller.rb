class PatientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  def index
    @patients = current_user.patients
  end

  def new
    @patient = current_user.patients.build
  end

  def show
    @patient = current_user.patients.find(params[:id])
    @has_diagnosis_with_levels = @patient.diagnoses.any? { |d| d.levels.present? }
    @diagnosis_data = @patient.diagnoses.includes(:levels).map do |diagnosis|
      {
        date: diagnosis.date,
        levels: diagnosis.levels.map { |level| { escala: level.escala, severidad: level.severidad } }
      }
    end
  end

  def create
    @patient = current_user.patients.build(patient_params)
    if @patient.save
      if request.referrer.include?("diagnostico")
        redirect_to diagnostico_path, notice: 'Paciente creado exitosamente.'
      else
        redirect_to patients_path, notice: 'Paciente creado exitosamente.'
      end
    else
      render :new
    end
  end
  
  def edit
  end

  def update
    if @patient.update(patient_params)
      redirect_to patients_path, notice: 'Paciente actualizado exitosamente.'
    else
      render :edit
    end
  end

  def destroy
    @patient.destroy
    redirect_to patients_path, notice: 'Paciente eliminado exitosamente.'
  end

  private

  def set_patient
    @patient = current_user.patients.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:name, :rut, :birthdate, :sex, :email)
  end
end

  
 
  