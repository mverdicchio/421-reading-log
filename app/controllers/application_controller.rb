class ApplicationController < ActionController::Base
  def index
    @entries = Entries.all
  end

  def show
    @entries = Entries.find(params[:id])
  end
end
