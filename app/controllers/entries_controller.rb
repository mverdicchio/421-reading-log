class EntriesController < ApplicationController
    
    def index
        @entries = Entry.all
    end
    
    def show
        @entry = Entry.find(params[:id])
    end
    
    def new 
        @entry = Entry.new
    end 
    
    def create
    @entry = Entry.new(entry_params)

    respond_to do |format|
      if @entry.save
        format.html { redirect_to @entry, notice: "Entry was successfully created." }
        format.json { render :show, status: :created, location: @entry }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
    end
    
    def update
    respond_to do |format|
      if @entry.update(student_params)
        format.html { redirect_to @entry, notice: "Entry was successfully updated." }
        format.json { render :show, status: :ok, location: @entry }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
    end
    
    def entry_params
      params.require(:entry).permit(:Title, :Author, :Pages, :dateinputed)
    end
        
end
