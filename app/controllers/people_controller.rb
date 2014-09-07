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

end
