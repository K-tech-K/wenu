class MenusController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def index
    @menus = current_user.menus
  end

  def show
    @user = current_user
    @menu = current_user.menus.find(params[:id])
  end

  def new
    @user = current_user
    @menu = current_user.menus.new
  end

  def create
    @menu = current_user.menus.build(menu_params)

    if @menu.save
      flash[:success] = 'Menu が正常に投稿されました'
      redirect_to @menu
    else
      flash.now[:danger] = 'Menu が投稿されませんでした'
      render :new
    end
  end

  def edit
    @user = current_user
    @menu = current_user.menus.find(params[:id])
  end

  def update
    @menu = current_user.menus.find(params[:id])

    if @menu.update(menu_params)
      flash[:success] = 'Menu は正常に更新されました'
      redirect_to @menu
    else
      flash.now[:danger] = 'Menu は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @menu.destroy
    flash[:success] = 'メニューを削除しました。'
    redirect_to root_url
  end
  
  private
  
  def menu_params
    params.require(:menu).permit(:content, :category, :price)
  end
  
  def correct_user
    @menu = current_user.menus.find_by(id: params[:id])
    unless @menu
      redirect_to root_url
    end
  end
  
end
