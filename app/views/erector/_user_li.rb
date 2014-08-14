class Views::Erector::UserLi < Erector::Widget

  needs :user

  def content
    li {
      div "Name: #{@user.name}"
      div "Email: #{@user.email}"

      @user.user_attributes.each do |k, v|
        div {
          text k
          text ': '
          text v
        }
      end
    }
  end

end
