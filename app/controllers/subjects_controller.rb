class SubjectsController < ApplicationController
  def index
    @subjects = Subject.all
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(params[:subject])
    if @subject.save
      redirect_to :subjects
    else
      render :new
    end
  end

  def show
    @subject = Subject.find(params[:id])
  end

end
