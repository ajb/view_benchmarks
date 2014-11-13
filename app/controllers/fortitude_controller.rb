class FortitudeController < ApplicationController

  def users_index
    @users = User.all
  end

end
