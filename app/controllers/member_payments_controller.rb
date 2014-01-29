class MemberPaymentsController < ApplicationController
  # GET /member_payments
  # GET /member_payments.json
  def index
    @member_payments = MemberPayment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @member_payments }
    end
  end

  # GET /member_payments/1
  # GET /member_payments/1.json
  def show
    @member_payment = MemberPayment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @member_payment }
    end
  end

  # GET /member_payments/new
  # GET /member_payments/new.json
  def new
    @member_payment = MemberPayment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @member_payment }
    end
  end

  # GET /member_payments/1/edit
  def edit
    @member_payment = MemberPayment.find(params[:id])
  end

  # POST /member_payments
  # POST /member_payments.json
  def create
    @member_payment = MemberPayment.new(params[:member_payment])

    respond_to do |format|
      if @member_payment.save
        format.html { redirect_to member_payments_path, notice: 'Member payment was successfully created.' }
        format.json { render json: @member_payment, status: :created, location: @member_payment }
      else
        format.html { render action: "new" }
        format.json { render json: @member_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /member_payments/1
  # PUT /member_payments/1.json
  def update
    @member_payment = MemberPayment.find(params[:id])

    respond_to do |format|
      if @member_payment.update_attributes(params[:member_payment])
        format.html { redirect_to @member_payment, notice: 'Member payment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @member_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /member_payments/1
  # DELETE /member_payments/1.json
  def destroy
    @member_payment = MemberPayment.find(params[:id])
    @member_payment.destroy

    respond_to do |format|
      format.html { redirect_to member_payments_url }
      format.json { head :no_content }
    end
  end
end
