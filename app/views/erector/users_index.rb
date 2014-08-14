class Views::Erector::UsersIndex < Views::Layouts::Application

  def main
    p "Hi, there are #{@users.length} users."

    if @users.present?
      ul {
        @users.each do |user|
          render 'user_li', user: user
        end
      }
    else
      p 'No users.'
    end
  end

end
