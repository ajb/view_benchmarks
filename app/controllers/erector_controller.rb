class ErectorController < ApplicationController

  layout false
  
  def users_index
    @users = User.all
  end

end
