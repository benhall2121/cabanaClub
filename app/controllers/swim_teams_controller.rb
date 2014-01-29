class SwimTeamsController < ApplicationController
  before_filter :require_admin, :except => [:index]

  # GET /swim_teams
  # GET /swim_teams.json
  def index

    @staticpage = Staticpage.find(:first, :conditions => ["page_name = ?", "SwimTeam"]) 

    if is_admin?
      @swim_teams = SwimTeam.find(:all, :order => ["start_date asc, start_time asc"])
    else
      @swim_teams = SwimTeam.find(:all, :conditions => ["active = ? && start_date >= ?", true, Date.today], :order => ["start_date asc, start_time asc"])
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @swim_teams }
    end
  end

  # GET /swim_teams/1
  # GET /swim_teams/1.json
  def show
    @swim_team = SwimTeam.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @swim_team }
    end
  end

  # GET /swim_teams/new
  # GET /swim_teams/new.json
  def new
    @swim_team = SwimTeam.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @swim_team }
    end
  end

  # GET /swim_teams/1/edit
  def edit
    @swim_team = SwimTeam.find(params[:id])
  end

  # POST /swim_teams
  # POST /swim_teams.json
  def create
    @swim_team = SwimTeam.new(params[:swim_team])

    respond_to do |format|
      if @swim_team.save
        format.html { redirect_to swim_teams_path(), notice: 'Swim team was successfully created.' }
        format.json { render json: @swim_team, status: :created, location: @swim_team }
      else
        format.html { render action: "new" }
        format.json { render json: @swim_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /swim_teams/1
  # PUT /swim_teams/1.json
  def update
    @swim_team = SwimTeam.find(params[:id])

    respond_to do |format|
      if @swim_team.update_attributes(params[:swim_team])
        format.html { redirect_to swim_teams_path(), notice: 'Swim team was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @swim_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /swim_teams/1
  # DELETE /swim_teams/1.json
  def destroy
    @swim_team = SwimTeam.find(params[:id])
    @swim_team.destroy

    respond_to do |format|
      format.html { redirect_to swim_teams_url }
      format.json { head :no_content }
    end
  end
end
