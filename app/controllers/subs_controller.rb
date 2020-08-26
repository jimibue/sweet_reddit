class SubsController < ApplicationController
  before_action :set_sub, only: [:show, :edit, :update, :destroy]

  def index
    @subs = Sub.all
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def new
    @sub = Sub.new
    render partial: "form"
  end

  def create
    # inspect params here
    # binding.pry
    @sub = Sub.new(sub_params)

    if @sub.save
      redirect_to subs_path
    else
      render :new
    end
  end

  def edit
    #   @sub = Sub.find(params[:id])
    render partial: "form"
  end

  def update
    #   @sub = Sub.find(params[:id])
    if @sub.update(sub_params)
      redirect_to subs_path
    else
      render :edit
    end
  end

  def destroy
    #   @sub = Sub.find(params[:id])
    @sub.destroy
    redirect_to subs_path
  end

  def huh
  end

  private

  def sub_params
    params.require(:sub).permit(:name)
  end

  def set_sub
    @sub = Sub.find(params[:id])
  end
end
