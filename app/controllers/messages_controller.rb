class MessagesController < ApplicationController

  before_action :set_message, only: [:edit, :update, :destroy]
  def index
    @messages = Message.all
  end
  def new
    if params[:back]
      @message = Message.new(message_params)
    else
      @message = Message.new
    end
  end
  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to messages_path, notice: "You have posted a new tweet!"
    else
      render :new
    end
  end
  def edit
    @message = Message.find(params[:id])
  end
  def update
    @message = Message.find(params[:id])
    if @message.update(message_params)
      redirect_to messages_path, notice: "You have edited this tweet！"
    else
      render :edit
    end
  end
  def destroy
    @message.destroy
    redirect_to messages_path, notice: "You have deleted the tweet!"
  end
  def confirm
    @message = Message.new(message_params)
    render :new if @message.invalid?
  end
  private
  def message_params
    params.require(:message).permit(:content)
  end
  def set_message
    @message = Message.find(params[:id])
  end
end
