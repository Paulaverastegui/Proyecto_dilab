class GussScalesController < ApplicationController
  before_action :set_diagnosis, only: [:new, :create, :edit, :update, :show]
  before_action :set_guss_scale, only: [:edit, :update, :show]

  def new
    @guss_scale = @diagnosis.build_guss_scale
  end

  def create
    @guss_scale = @diagnosis.build_guss_scale(guss_scale_params)
    if @guss_scale.save
      if @guss_scale.preliminary_score < 5
        redirect_to intermediate_view_patient_diagnosis_guss_scale_path(@diagnosis.patient_id, @diagnosis.id, @guss_scale.id), alert: 'Preliminary check failed. Additional tests required.'
      else
        redirect_to edit_patient_diagnosis_guss_scale_path(@diagnosis.patient.id, @diagnosis.id, @guss_scale.id, phase: 'semi_solids'), notice: 'Preliminary check passed. Continue with semi-solids phase.'
      end
    else
      render :new
    end
  end

  def edit
    case params[:phase]
    when 'semi_solids'
      render :edit_semi_solids
    when 'liquids'
      if @guss_scale.semi_solids_score < 5
        redirect_to intermediate_view_diagnosis_guss_scale_path(@diagnosis, @guss_scale), alert: 'Semi-solids check failed. Additional tests required.'
      else
        render :edit_liquids
      end
    when 'solids'
      if @guss_scale.liquids_score < 5
        redirect_to intermediate_view_diagnosis_guss_scale_path(@diagnosis, @guss_scale), alert: 'Liquids check failed. Additional tests required.'
      else
        render :edit_solids
      end
    else
      render :edit_preliminary
    end
  end

  def update
    if @guss_scale.update(guss_scale_params)
      case params[:phase]
      when 'semi_solids'
        if @guss_scale.semi_solids_score < 5
          redirect_to intermediate_view_patient_diagnosis_guss_scale_path(@diagnosis.patient_id, @diagnosis.id, @guss_scale.id), alert: 'Semi-solids check failed. Additional tests required.'
        else
          redirect_to edit_patient_diagnosis_guss_scale_path(@diagnosis.patient.id, @diagnosis.id, @guss_scale.id, phase: 'liquids'), notice: 'Semi-solids check passed. Continue with liquids phase.'
        end
      when 'liquids'
        if @guss_scale.liquids_score < 5
          redirect_to intermediate_view_patient_diagnosis_guss_scale_path(@diagnosis.patient_id, @diagnosis.id, @guss_scale.id), alert:'Liquids check failed. Additional tests required.'
        else
          redirect_to edit_patient_diagnosis_guss_scale_path(@diagnosis.patient.id, @diagnosis.id, @guss_scale.id, phase: 'solids'), notice: 'Liquids check passed. Continue with solids phase.'
        end
      when 'solids'
        if @guss_scale.solids_score < 5
          redirect_to intermediate_view_patient_diagnosis_guss_scale_path(@diagnosis.patient_id, @diagnosis.id, @guss_scale.id), alert:'Solids check failed. Additional tests required.'
        else
          redirect_to guss_scale_path(@guss_scale), notice: 'GUSS scale completed successfully.'
        end
      else
        redirect_to edit_patient_diagnosis_guss_scale_path(@diagnosis.patient.id, @diagnosis.id, @guss_scale.id, phase: 'semi_solids'), notice: 'Preliminary check passed. Continue with semi-solids phase.'
      end
    else
      render :edit
    end
  end
  def intermediate_view
    # Código para la vista intermedia
  end

  private

  def set_diagnosis
    @diagnosis = Diagnosis.find_by(params[:diagnosis_id])
  end

  def set_guss_scale
    @guss_scale = @diagnosis.guss_scale
  end

  def guss_scale_params
    params.require(:guss_scale).permit(:vigilance, :cough, :saliva_swallow, :sialorrhea, :voice_changes,
                                       :semi_solids_swallow, :semi_solids_cough, :semi_solids_sialorrhea, :semi_solids_voice_changes,
                                       :liquids_swallow, :liquids_cough, :liquids_sialorrhea, :liquids_voice_changes,
                                       :solids_swallow, :solids_cough, :solids_sialorrhea, :solids_voice_changes)
  end
end
