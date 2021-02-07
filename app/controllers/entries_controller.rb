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
        format.html { redirect_to @entry, notice: "Reading Entry Created!" }
      else
        format.html { render action: 'new' }
      end
    end
    end
  
    def edit
      @entry = Entry.find(params[:id])
    end

    def update
      @entry = Entry.find(params[:id])

    if @entry.update(entry_params)
      redirect_to @entry
    else
      render :edit
    end
    end
  
    def destroy
      @entry = Entry.find(params[:id])
      @entry.destroy

      redirect_to root_path
    end
  
    private
    def entry_params
      params.require(:entry).permit(:book_title, :pages)
    end
end
