class TopicsController < ApplicationController
  def index
    @sub = Sub.find(params[:sub_id])
    @topics = @sub.topics
  end

  def show
    @sub = Sub.find(params[:sub_id])
    @topic = Topic.find(params[:id])
  end

  def new
    @sub = Sub.find(params[:sub_id])
    # @topic = Topic.new
    @topic = @sub.topics.new # i am going to have the id of the sub
    render partial: "form"
  end

  def edit
  end
end
