require 'csv'
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

    all_scales = @patient.diagnoses.flat_map { |diagnosis| diagnosis.levels.map(&:escala) }.uniq

    @diagnosis_data = @patient.diagnoses.includes(:levels).map do |diagnosis|
      level_data = all_scales.map do |scale|
        level = diagnosis.levels.find { |l| l.escala == scale }
        level ? level.severidad : nil
      end
      { date: diagnosis.date, levels: level_data }
    end

    @scales = all_scales
    @diagnoses = @patient.diagnoses.includes(:guss_scale)
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

  def export
    @patients = current_user.patients.includes(diagnoses: :guss_scale)

    respond_to do |format|
      format.csv { send_data generate_csv(@patients), filename: "patients-#{Date.today}.csv" }
    end
  end


  private

  def set_patient
    @patient = current_user.patients.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:name, :rut, :birthdate, :sex, :email)
  end
  
  def generate_csv(patients)
    headers = ["Nombre", "RUT", "Fecha de Nacimiento", "Sexo", "Email", "Fecha del Diagnóstico", "Descripción", "Historia Desde", "Pérdida de Peso", "Historia de Condición", "Historia de Cirugía", "Episodios de Atragantamiento o Tos", "Dificultad para Tragar", "Sensación de Comida Atascada", "Dolor al Tragar", "Frecuencia de Problemas para Tragar", "Evita Alimentos", "Cansancio al Comer o Beber", "Tiempo para Almorzar", "Nuevos Síntomas", "Escala", "Severidad", "Puntaje Total GUSS"]

    CSV.generate(headers: true) do |csv|
      csv << headers

      patients.each do |patient|
        patient.diagnoses.each do |diagnosis|
          diagnosis.levels.each do |level|
            guss = diagnosis.guss_scale
            guss_total = guss.present? ? guss.total_score : nil

            csv << [
              patient.name,
              patient.rut,
              patient.birthdate,
              patient.sex,
              patient.email,
              diagnosis.date,
              diagnosis.description,
              diagnosis.historia_desde,
              diagnosis.perdida_peso,
              diagnosis.historia_condicion,
              diagnosis.historia_cirugia,
              diagnosis.sintomas_episodios,
              diagnosis.sintomas_dificultad,
              diagnosis.sintomas_sensacion,
              diagnosis.sintomas_dolor,
              diagnosis.sintomas_frecuencia,
              diagnosis.sintomas_evita_alimentos,
              diagnosis.sintomas_cansancio,
              diagnosis.sintomas_tiempo,
              diagnosis.sintomas_nuevo,
              level.escala,
              level.severidad,
              guss_total
            ]
          end
        end
      end
    end
  end
end

  
 
  
  