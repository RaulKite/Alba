class UserSessionsController < ApplicationController
  before_filter :require_login, :except => [:new, :create]
  
   def new
    @user = User.new
  end
  
  def create
    respond_to do |format|
      if @user = login(params[:username],params[:password], params[:remember])
        format.html { redirect_back_or_to(:users, :notice => 'Login successful.') }
        format.xml { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { flash.now[:alert] = "Login failed."; render :action => "new" }
        format.xml { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
    
  def destroy
    logout
    redirect_to( root_path , :notice => 'Logged out!')
  end

end
