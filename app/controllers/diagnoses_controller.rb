# app/controllers/diagnoses_controller.rb
class DiagnosesController < ApplicationController
    before_action :set_patient
  
    def index
      @diagnoses = @patient.diagnoses
    end
  
    def new
      @diagnosis = @patient.diagnoses.build
    end
  
    def create
      @diagnosis = @patient.diagnoses.build(diagnosis_params)
      if @diagnosis.save
        redirect_to patient_diagnoses_path(@patient), notice: 'Diagnóstico creado exitosamente.'
      else
        render :new
      end
    end
  
    def show
      @diagnosis = @patient.diagnoses.find(params[:id])
    end
  
    private
  
    def set_patient
      @patient = current_user.patients.find(params[:patient_id])
    end
  
    def diagnosis_params
      params.require(:diagnosis).permit(:description, :severity, :date)
    end
  end
  