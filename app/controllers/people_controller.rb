class PeopleController < ApplicationController

  def index
    @people = Person.all
  end

  def new
    @person = Person.new
  end

  def create
    Person.create first: params[:person][:first], last: params[:person][:last]
    redirect_to :people
  end

  def edit
    @person = Person.find params[:id]
  end

  def update
    @person = Person.find params[:id]
    @person.update first: params[:person][:first]
    @person.update last: params[:person][:last]
    redirect_to :people
  end

  def destroy
    @person = Person.find params[:id]
    @person.destroy
    redirect_to :people
  end

  def show
    @person = Person.find params[:id]
  end
end
