class MeetingNotesController < ApplicationController
  before_filter :require_admin, :except => [:index, :show]
  # GET /meeting_notes
  # GET /meeting_notes.json
  def index
    @meeting_notes = MeetingNote.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @meeting_notes }
    end
  end

  # GET /meeting_notes/1
  # GET /meeting_notes/1.json
  def show
    @meeting_note = MeetingNote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @meeting_note }
    end
  end

  # GET /meeting_notes/new
  # GET /meeting_notes/new.json
  def new
    @meeting_note = MeetingNote.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @meeting_note }
    end
  end

  # GET /meeting_notes/1/edit
  def edit
    @meeting_note = MeetingNote.find(params[:id])
  end

  # POST /meeting_notes
  # POST /meeting_notes.json
  def create
    puts "

    $$$$ CREATE MEETING"
    @meeting_note = MeetingNote.new(params[:meeting_note])

    respond_to do |format|
      if @meeting_note.save
        format.html { redirect_to @meeting_note, notice: 'Meeting note was successfully created.' }
        format.json { render json: @meeting_note, status: :created, location: @meeting_note }
      else
        format.html { render action: "new" }
        format.json { render json: @meeting_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /meeting_notes/1
  # PUT /meeting_notes/1.json
  def update
    @meeting_note = MeetingNote.find(params[:id])

    respond_to do |format|
      if @meeting_note.update_attributes(params[:meeting_note])
        format.html { redirect_to @meeting_note, notice: 'Meeting note was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @meeting_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meeting_notes/1
  # DELETE /meeting_notes/1.json
  def destroy
    @meeting_note = MeetingNote.find(params[:id])
    @meeting_note.destroy

    respond_to do |format|
      format.html { redirect_to meeting_notes_url }
      format.json { head :no_content }
    end
  end

  def newMN
    @meeting_note = MeetingNote.new
    @meeting_note.meeting_id = params[:meeting_id]
    @meeting_note.description = params[:description]

    @meeting_note.save
    
    respond_to do |f|
      f.js
    end
  end

end
