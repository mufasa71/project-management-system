class IntakesController < ApplicationController
  def index
    @intakes = Intake.all
  end

  def show
    @intake = Intake.find(params[:id])
  end
end
