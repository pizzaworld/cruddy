class HorsesController < ApplicationController
  def index
    @horses = Horse.all
  end

  def new
    @horse = Horse.new
  end

  def create
    Horse.create name: params[:horse][:name]
    redirect_to :horses
  end
end
