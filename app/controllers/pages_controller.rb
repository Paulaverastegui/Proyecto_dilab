class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def menu
  end
  def index
  end
end
