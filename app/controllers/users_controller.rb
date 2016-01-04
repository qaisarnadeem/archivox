class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_login ,:except=>[:login,:authorize]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

def login
end

def authorize
  user=User.find_by_email params[:email]
  if user && user.encrypted_password==Digest::SHA1.hexdigest(params[:password])
      session[:current_user]=user 
      redirect_to params[:redirect_url] || '/' and return
  end
  flash[:error]="We could not authorize user with provided email and password"
  redirect_to login_users_path and return
end

def logout
  session[:current_user]=nil
  redirect_to login_users_path
end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to '/', notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        flash[:errors]=@user.errors.messages
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    user_password=@user.encrypted_password;
    respond_to do |format|
      if @user.update(user_params)
        logout_user if user_password != @user.encrypted_password
        format.html { redirect_to '/', notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end


end
