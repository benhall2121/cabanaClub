class SwimLessonsController < ApplicationController
  before_filter :require_admin, :except => [:index]

  # GET /swim_lessons
  # GET /swim_lessons.json
  def index

    @staticpage = Staticpage.find(:first, :conditions => ["page_name = ?", "SwimLesson"]) 

    if is_admin?
      @swim_lessons = SwimLesson.find(:all, :order => ["start_date asc, start_time asc"])
    else
      @swim_lessons = SwimLesson.find(:all, :conditions => ["active = ? && start_date >= ?", true, Date.today], :order => ["start_date asc, start_time asc"])
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @swim_lessons }
    end
  end

  # GET /swim_lessons/1
  # GET /swim_lessons/1.json
  def show
    @swim_lesson = SwimLesson.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @swim_lesson }
    end
  end

  # GET /swim_lessons/new
  # GET /swim_lessons/new.json
  def new
    @swim_lesson = SwimLesson.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @swim_lesson }
    end
  end

  # GET /swim_lessons/1/edit
  def edit
    @swim_lesson = SwimLesson.find(params[:id])
  end

  # POST /swim_lessons
  # POST /swim_lessons.json
  def create
    @swim_lesson = SwimLesson.new(params[:swim_lesson])

    respond_to do |format|
      if @swim_lesson.save
        format.html { redirect_to swim_lessons_path(), notice: 'Swim lesson was successfully created.' }
        format.json { render json: @swim_lesson, status: :created, location: @swim_lesson }
      else
        format.html { render action: "new" }
        format.json { render json: @swim_lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /swim_lessons/1
  # PUT /swim_lessons/1.json
  def update
    @swim_lesson = SwimLesson.find(params[:id])

    respond_to do |format|
      if @swim_lesson.update_attributes(params[:swim_lesson])
        format.html { redirect_to swim_lessons_path(), notice: 'Swim lesson was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @swim_lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /swim_lessons/1
  # DELETE /swim_lessons/1.json
  def destroy
    @swim_lesson = SwimLesson.find(params[:id])
    @swim_lesson.destroy

    respond_to do |format|
      format.html { redirect_to swim_lessons_url }
      format.json { head :no_content }
    end
  end
end
