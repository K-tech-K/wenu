class UsersController < ApplicationController
  before_action :require_user_logged_in, except: [:new, :create]
  
  def show
    @user = current_user
    @pagy, @menus = pagy(current_user.menus.order(id: :desc))
    redirect_to signatures_user_url
  end
  
  def signatures
    @user = current_user
    @pagy, @menus = pagy(current_user.menus.where(category: "Signature").order(id: :desc))
  end
  
  def appetizers
    @user = current_user
    @pagy, @menus = pagy(current_user.menus.where(category: "Appetizer").order(id: :desc))
  end

  def mains
    @user = current_user
    @pagy, @menus = pagy(current_user.menus.where(category: "Main").order(id: :desc))
  end

  def sides
    @user = current_user
    @pagy, @menus = pagy(current_user.menus.where(category: "Side").order(id: :desc))
  end

  def bevarages
    @user = current_user
    @pagy, @menus = pagy(current_user.menus.where(category: "Bevarage").order(id: :desc))
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    
    if @user.update(user_params)
      flash[:success] = 'ユーザを更新しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの更新に失敗しました。'
      render :edit
    end
  end

  def destroy
    @user = current_user
    @user.destroy
    
    flash[:success] = "ユーザーは正常に削除されました"
    redirect_to root_url
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :shop, :password, :password_confirmation)
  end
  
end

