class HorsesController < ApplicationController
  def index
    @horses = Horse.all
  end

  def new
    @horse = Horse.new
  end

  def create
    @horse = Horse.new name: params[:horse][:name]
    if @horse.valid?
      @horse.save
      redirect_to :horses
    else
      render :new
    end
  end

  def edit
    @horse = Horse.find params[:id]
  end

  def update
    @horse = Horse.find params[:id]
    if @horse.update name: params[:horse][:name]
      redirect_to :horses
    else
      render :edit
    end
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
