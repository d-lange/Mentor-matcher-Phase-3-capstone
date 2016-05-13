class UsersController < ApplicationController

  def index
    # @users = return_opposite_type(current_user)
    render 'index'
  end


  def new
    @user = User.new()
  end


  def create
    @user = User.new()
    # Step 3 on LI guide post to get token
    #we need to collect OAUTH token on return from LI login


    # Step 4 on LI guide make authenticated request to retrieve basic profile as object
    # url = 'https://api.linkedin.com/v1/people/~?format=json'
    # response = HTTParty.get(url)

    #  @user.first_name = #response from JSON ||= a default placeholder
    #  @user.last_name = response.last-name
    #  @user.location =
    #  @user.industry =
    #  @user.picture_url =
    #  @user.public_profile_url =
    #  @user.current_title =
    #  @user.current_company =
    if @user.save
      redirect_to users_path
    # else
      # @errors = @user.errors.full_messages
      # render 'new'
    end
  end


  def show
   @user = User.find(params[:id])
  end


  def edit
    @user = User.find(params[:id])
  end


  def update
    @user = User.find(params[:id])
    @user.assign_attributes(user_params)

    if @user.save
      redirect_to users_path
    else
      render 'edit'
    end
  end


  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect '/users'
  end

  private
  def user_params
    params.require(:user).permit(:first_name,
                                 :last_name,
                                 :location,
                                 :industry,
                                 :picture_url,
                                 :public_profile_url,
                                 :current_title,
                                 :current_company,
                                 :type,
                                 :status,
                                 :mission_statement)
  end

end
