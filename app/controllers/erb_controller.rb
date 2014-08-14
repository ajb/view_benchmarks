class ErbController < ApplicationController

  def users_index
    @users = User.all
  end

end
