module Admin
  class UsersController < Admin::ApplicationController
    respond_to :json, :html
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :set_teams, only: [:new, :edit, :create, :update]

    # GET /users
    def index
      @users = User.all
    end

    # GET /users/1
    def show
    end

    # GET /users/new
    def new
      @user = User.new
      @url = admin_users_path
    end

    # GET /users/1/edit
    def edit
      @url = admin_user_path(@user)
    end

    # POST /users
    def create
      @user = User.new(user_params)

      if @user.save
        flash[:notice] = t('admin.users.create.success')
        respond_with :admin, @user
      else
        flash[:warning] = @user.errors.full_messages.uniq.join(', ')
        respond_with :new, :admin, :user
      end
    end

    # PATCH/PUT /users/1
    def update
      if @user.update(user_params)
        flash[:notice] = t('admin.users.update.success')
        respond_with :admin, @user
      else
        flash[:warning] = @user.errors.full_messages.uniq.join(', ')
        respond_with :edit, :admin, :user
      end
    end

    # DELETE /users/1
    def destroy
      @user.destroy
      respond_to do |format|
        format.html { redirect_to admin_users_path, notice: t('admin.users.destroy.success') }
        format.json { head :no_content }
      end
    end

    def set_teams
      @teams = Team.all
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      teams = params.permit(@teams.map(&:name)).values
      params.require(:user).permit(:email, :password, :password_confirmation, :name, :role)
                           .merge(team_ids: teams.map(&:to_i))
    end
  end
