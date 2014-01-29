class PaymentsController < ApplicationController
  before_filter :require_admin, :except => [:new, :create, :show, :index]
  # GET /payments
  # GET /payments.json
  def index
    @payments = current_user.payments.find(:all, :order => "created_at desc")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @payments }
    end
  end

  def payments_made
    @payments = Payment.find(:all, :order => "created_at desc")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @payments }
    end
  end

  # GET /payments/1
  # GET /payments/1.json
  def show
    @payment = Payment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @payment }
    end
  end

  # GET /payments/new
  # GET /payments/new.json
  def new
    if params[:clear_all] == "clear_all"
      delete_all_from_shopping_cart
    end

    if !params[:model_id].nil? && !params[:model_name].nil?
      delete_one_item_from_shopping_cart(params[:model_id], params[:model_name])
    end


    @payment = Payment.new(:account_id => current_user.account.id, :user_id => current_user.id)

    total_payment = 0
    payment_description = ""

    @swim_team = []
    @membership_payment = []
    all_shopping_cart = get_shopping_cart
    all_shopping_cart.each do |sc|

      model = sc[1].constantize.find(sc[0])

      #------------  SwimTeam  ------------#
      if sc[1] == "SwimTeam"
        @swim_team << model
        total_payment += model.price_per_participant
        payment_description += "Swim Team: #{model.name} - $#{model.price_per_participant} \n"
      end
      #------------  END SwimTeam  ------------#

      #------------  MemberPayment  ------------#
      if sc[1] == "MemberPayment"
        @membership_payment << model
        total_payment += model.cost
        payment_description += "Membership Payment: #{model.name} - $#{model.cost} \n"
      end
      #------------  END MemberPayment  ------------#
    end


    @payment.amount = total_payment
    @payment.user_description = payment_description

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @payment }
    end
  end

  # GET /payments/1/edit
  def edit
    @payment = Payment.find(params[:id])
  end

  # POST /payments
  # POST /payments.json
  def create
    @payment = Payment.new(params[:payment])
    @payment.account_id = current_user.account.id
    @payment.user_id = current_user.id

    respond_to do |format|
      if @payment.save_with_payment

        all_shopping_cart = get_shopping_cart
        all_shopping_cart.each do |sc|

          model = sc[1].constantize.find(sc[0])

          if sc[1] == "SwimTeam"
            @mst = Userswimteam.new(:swim_team_id => sc[0], :user_id => current_user.id, :payment_id => @payment.id)
            @mst.save
          end

          if sc[1] == "MemberPayment"
            @mst = Membershippayment.new(:member_payment_id => sc[0], :user_id => current_user.id, :payment_id => @payment.id)
            @mst.save
          end
        end

        delete_all_from_shopping_cart
        format.html { redirect_to payments_path, notice: 'Thank you for your payment.' }
        format.json { render json: payments_path, status: :created, location: @payment }
      else
        format.html { render action: "new" }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /payments/1
  # PUT /payments/1.json
  def update
    @payment = Payment.find(params[:id])

    respond_to do |format|
      if @payment.update_attributes(params[:payment])
        format.html { redirect_to @payment, notice: 'Payment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1
  # DELETE /payments/1.json
  def destroy
    @payment = Payment.find(params[:id])
    @payment.destroy

    respond_to do |format|
      format.html { redirect_to payments_url }
      format.json { head :no_content }
    end
  end
end
