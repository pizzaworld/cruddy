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

  def edit
    @horse = Horse.find params[:id]
  end

  def update
    @horse = Horse.find params[:id]
    @horse.update name: params[:horse][:name]
    redirect_to :horses
  end

  def destroy
    @horse = Horse.find params[:id]
    @horse.destroy
    redirect_to :horses
  end

  def show
    @horse = Horse.find params[:id]
  end
end
