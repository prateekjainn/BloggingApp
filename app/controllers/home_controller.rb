class HomeController < ApplicationController
  def index
    if current_user
      redirect_to articles_path
    end
  end
end
