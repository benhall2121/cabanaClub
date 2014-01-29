class UsersController < ApplicationController
  before_filter :require_admin, :only => [:index, :admin]
  before_filter :require_login, :only => [:add_item_to_shopping_cart, :remove_item_from_shopping_cart, :remove_all_items_from_shopping_cart]

  def home
  end

  def about
  end

  def admin
  end

  # GET /users
  # GET /users.json
  def index
    @users = User.find(:all, :conditions => ["active = ?", true])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @staticpage = Staticpage.find(:first, :conditions => ["page_name = ?", "UserPayment"]) 
    
    if is_admin?
      @user = User.find(params[:id])
    else
      @user = User.find(current_user)
    end

    @payments_need_to_make = nil

    if @user == current_user

      users_payments = current_user.membershippayments.all(:select => :member_payment_id).collect(&:member_payment_id)

      @payments_need_to_make = MemberPayment.find(:all, :conditions => ["id not in (?)", users_payments])
    end


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
    @accounts = Account.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    if is_admin?
      @user = User.find(params[:id])
    else
      @user = User.find(current_user)
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save_also_to_stripe
        cookies[:auth_token] = @user.auth_token
        format.html { redirect_to @user, notice: 'Thanks for Signing up.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    if is_admin?
      @user = User.find(params[:id])
    else
      @user = User.find(current_user)
      @user.admin = @user.admin
    end

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'Your account has been updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    if is_admin?
      @user = User.find(params[:id])
    else
      @user = User.find(current_user)
    end

    @user.active=false

    @user.save

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def add_item_to_shopping_cart
    add_to_shopping_cart(params[:model_id], params[:model_name])

    render :nothing => true
  end

  def remove_item_from_shopping_cart
    delete_one_item_from_shopping_cart(params[:model_id], params[:model_name])

    render :nothing => true
  end

  def remove_all_items_from_shopping_cart
    delete_all_from_shopping_cart

    render :nothing => true
  end
end
