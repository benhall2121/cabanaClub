class StaticpagesController < ApplicationController
  before_filter :require_admin
  # GET /staticpages
  # GET /staticpages.json
  def index
    @staticpages = Staticpage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @staticpages }
    end
  end

  # GET /staticpages/1
  # GET /staticpages/1.json
  def show
    @staticpage = Staticpage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @staticpage }
    end
  end

  # GET /staticpages/new
  # GET /staticpages/new.json
  def new
    @staticpage = Staticpage.new
    @staticpage.page_name = params[:page_name]
    @staticpage.page_url = params[:page_url]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @staticpage }
    end
  end

  # GET /staticpages/1/edit
  def edit
    @staticpage = Staticpage.find(params[:id])
  end

  # POST /staticpages
  # POST /staticpages.json
  def create
    @staticpage = Staticpage.new(params[:staticpage])

    go_to_url = get_url(@staticpage)

    respond_to do |format|
      if @staticpage.save
        format.html { redirect_to go_to_url, notice: 'Page was successfully created.' }
        format.json { render json: @staticpage, status: :created, location: @staticpage }
      else
        format.html { render action: "new" }
        format.json { render json: @staticpage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /staticpages/1
  # PUT /staticpages/1.json
  def update
    @staticpage = Staticpage.find(params[:id])

    respond_to do |format|
      if @staticpage.update_attributes(params[:staticpage])

        go_to_url = get_url(@staticpage)
        
        format.html { redirect_to go_to_url, notice: 'Page was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @staticpage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /staticpages/1
  # DELETE /staticpages/1.json
  def destroy
    @staticpage = Staticpage.find(params[:id])
    @staticpage.destroy

    respond_to do |format|
      format.html { redirect_to staticpages_url }
      format.json { head :no_content }
    end
  end

  private

  def get_url(static_page)
    if static_page.page_url == "current_user"
      return_url = user_path(current_user)
    else
      return_url = "/#{static_page.page_url}"
    end

    return return_url
  end
end
