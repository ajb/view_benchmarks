class Views::Fortitude::UserLi < Fortitude::Widget
  doctype :html5
  start_and_end_comments false
  format_output false
  needs :user

  def content
    li {
      div "Name: #{user.name}"
      div "Email: #{user.email}"

      user.user_attributes.each do |k, v|
        div {
          text k
          text ': '
          text v
        }
      end
    }
  end
end
