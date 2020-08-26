class TopicsController < ApplicationController
  def index
    @sub = Sub.find(params[:sub_id])
    @topics = @sub.topics
  end

  def show
    @sub = Sub.find(params[:sub_id])
    @topic = @sub.topics.find(params[:id])
  end

  def new
    @sub = Sub.find(params[:sub_id])
    # @topic = Topic.new
    @topic = @sub.topics.new # i am going to have the id of the sub
    render partial: "form"
  end

  def create
    # get the sub, then use that sub to create a topic
    @sub = Sub.find(params[:sub_id])
    @topic = @sub.topics.new(topic_params)

    if @topic.save
      # redirect_to [@sub, @topic]
      redirect_to sub_topic_path(@sub, @topic)
    else
      render partial: "form"
    end
  end

  def edit
    @sub = Sub.find(params[:sub_id])
    @topic = @sub.topics.find(params[:id])

    render partial: "form"
  end

  def update
    @sub = Sub.find(params[:sub_id])
    @topic = @sub.topics.find(params[:id])

    if (@topic.update(topic_params))
      redirect_to sub_path(@sub)
    else
      render partial: "form"
    end
  end

  def destroy
    # reminder we have params[:sub_id] to get to the sub
    # have params[:id] to get the topic

    # another way preffered
    @sub = Sub.find(params[:sub_id])

    topic = @sub.topics.find(params[:id])

    topic.destroy

    redirect_to sub_path(@sub)
  end

  private

  def topic_params
    params.require(:topic).permit(:name, :body)
  end
end
