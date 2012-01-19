class UsersController < ApplicationController
  before_filter :authenticate, :only => %w(edit update)

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if request.post? and @user.save
      flash[:notice] = 'Thanks for signing up!'
      redirect_to events_url
    else
      render :action => 'new'
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if request.post? and current_user.update_attributes(params)
      flash[:notice] = 'Information updated'
      redirect_to :action => 'show', :id => current_user.id
    else
      render :action => 'edit'
    end
  end

  def login
    if request.post?
      if user = User.authenticate(params[:login], params[:password])
        session[:user_id] = user.id
        redirect_to events_url
      else
        flash[:notice] = 'Invalid login/password combination'
      end
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to login_url
  end
end
