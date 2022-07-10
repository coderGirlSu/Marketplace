class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy place_order] # call the set_product method before runing show, edit, update and destory place_order actions
  before_action :set_form_vars, only: %i[ new edit ] # call the set_form_vars method before new, edit actions
  before_action :authenticate_user!, except: [:index, :show] # make sure the user is authenticated before running any action except index and show actions
  before_action :authorize_user, only: [:edit, :update, :destory] # only authorized user allows to execute edit,update and destory actions 
  # GET /products or /products.json
  # searching products through title 
  def index
   q = request.query_parameters["q"]
   @products = Product.where("title like ?","%#{q}%")
  end

  # GET /products/1 or /products/1.json
  def show
  end
 
   # find all current user's products
  def my_products
    q = request.query_parameters["q"]
    @products = Product.where("title like ?","%#{q}%").where(user_id: current_user.id)
  end

  # find all current user's orders
  def my_orders
    @orders = Order.where(buyer_id: current_user.id)
  end

  # GET /products/new
  # add a new product
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json

   # create a new product
  def create
    
    @product = Product.new(product_params)
    @product.user = current_user

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json

  # updated the product
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  # delete a product
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # order a product
  def place_order
    Order.create(
      product_id: @product.id,
      seller_id: @product.user_id,
      buyer_id: current_user.id,
      paid: true,
      date: Time.current
    )
    @product.update(sold: true)
    redirect_to order_success_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    def set_form_vars
      @categories = Category.all
      @conditions = Product.conditions.keys
      @colours = Product.colours.keys
    end

    # check if it is an authorized user
    def authorize_user
      if @product.user_id != current_user.id
        flash[:alert] = "You can't do that!"
        redirect_to products_path
      end
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:title, :sold, :category_id, :user_id, :description, :price, :colour, :condition, :listed_date, :picture)
    end
end
