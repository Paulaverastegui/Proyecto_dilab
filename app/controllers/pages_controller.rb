class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  # app/controllers/pages_controller.rb
  def diagnostico
    @patients = Patient.all
  end

  def menu
  end
  def index
  end
end
