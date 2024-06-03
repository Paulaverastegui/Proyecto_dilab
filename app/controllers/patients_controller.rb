class PatientsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_patient, only: [:show, :edit, :update, :destroy]
  
    def index
      @patients = current_user.patients
    end
  
    def new
      @patient = current_user.patients.build
    end
  
    def create
      @patient = current_user.patients.build(patient_params)
      if @patient.save
        redirect_to patients_path, notice: 'Paciente creado exitosamente.'
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
  
 
  