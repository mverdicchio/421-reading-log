class EntriesController < ApplicationController
    
    def index
        @entries = Entry.all
    end
    
    def show
        
    end
    
end
