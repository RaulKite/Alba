class WelcomeController < ApplicationController

  
  def index
  end

  def denied
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end

end
