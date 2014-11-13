class Views::Fortitude::UsersIndex < Views::Fortitude::Base
  doctype :html5
  start_and_end_comments false
  format_output false
  needs :users

  def content
    p "Hi, there are #{users.length} users."

    if users.present?
      ul {
        users.each do |user|
          render 'user_li', user: user
        end
      }
    else
      p 'No users.'
    end
  end
end
