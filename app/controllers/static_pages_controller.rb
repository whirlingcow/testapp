class StaticPagesController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def home
    @users = User.paginate(page: params[:page])
    @articles = Article.paginate(page: params[:page])
  end

  def help
  end

  def about
  end

  def contact
  end

  def redaktionen
    @users = User.paginate(page: params[:page])
  end

end
