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
        @entry = Entry.create(params.require(:book_title).permit(:pages, :date))
        redirect_to new_entry_path
    end
    
end
