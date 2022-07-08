class MessagesController < ApplicationController
  before_action :set_message, only: %i[ show edit update destroy ]
  before_action :authenticate_user! # make sure the user is authenticated before running any action

  # GET /messages or /messages.json
  def index
      @messages = Message.where(receiver_id: current_user.id)
  end

  # GET /messages/1 or /messages/1.json
  # reply_message will be shown once open the message show page.
  def show
    @reply_message = Message.new
    @reply_message.receiver_id = @message.sender_id
    @reply_message.product_id = @message.product_id
  end

  # GET /messages/new
  def new
    @message = Message.new
    @message.product_id = request.query_parameters["product_id"]
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages or /messages.json
  def create
    @message = Message.new(message_params)
    @message.sender_id = current_user.id
    product = Product.find(@message.product_id)
    @message.receiver_id = product.user_id
    @message.date = Time.current
   

    respond_to do |format|
      if @message.save
        format.html { redirect_to message_url(@message), notice: "Message was successfully sent." }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

# place_reply only executed when it been called
  def place_reply
    @message = Message.new(message_params)
    @message.sender_id = current_user.id
    @message.date = Time.current
   

    respond_to do |format|
      if @message.save
        format.html { redirect_to url_for(:controller => 'messages', :action => 'index'), notice: "Reply was successfully sent." }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end

  end

  def sent
  end

  # PATCH/PUT /messages/1 or /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to message_url(@message), notice: "Message was successfully updated." }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1 or /messages/1.json
  def destroy
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url, notice: "Message was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # Private methods are not actions, They are used as regular methods
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_params
      # Only allow these parameters to be sent from a browser to rails
      params.require(:message).permit(:message, :product_id, :date, :sender_id, :receiver_id)
    end
end
