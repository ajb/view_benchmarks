class User < ActiveRecord::Base

  serialize :user_attributes, Hash

end
