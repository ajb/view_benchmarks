task benchmark: :environment do

  require 'erb'
  require 'benchmark'
  require 'erector'

  users = User.all

  class ErectorWidget < Erector::Widget
    needs :users

    def content
      p "Hi, there are #{@users.length} users."

      if @users.present?
        ul {
          @users.each do |user|
            li {
              div "Name: #{user.name}"
              div "Email: #{user.email}"

              user.user_attributes.each do |k, v|
                div "#{k}: #{v}"
              end
            }
          end
        }
      else
        p 'No users.'
      end
    end
  end

  class FortitudeWidget < Fortitude::Widget
    doctype :html5
    start_and_end_comments false
    format_output false
    needs :users

    def content
      p "Hi, there are #{users.length} users."

      if users.present?
        ul {
          users.each do |user|
            li {
              div "Name: #{user.name}"
              div "Email: #{user.email}"

              user.user_attributes.each do |k, v|
                div "#{k}: #{v}"
              end
            }
          end
        }
      else
        p 'No users.'
      end
    end
  end

  erb_template = <<-ERB_TEMPLATE
  <p>Hi, there are <%= users.length %> users.</p>

  <% if users.present? %>
    <ul>
      <% users.each do |user| %>
        <li>
          <div>Name: <%= user.name %></div>
          <div>Email: <%= user.email %></div>

          <% user.user_attributes.each do |k, v| %>
            <div><%= k %>: <%= v %>
          <% end %>
        </li>
      <% end %>
    </ul>
  <% else %>
    <p>No users.</p>
  <% end %>
  ERB_TEMPLATE

  Benchmark.bmbm(10) do |b|
    b.report(:erb) do
      @output = ''

      bind = binding

      context = OpenStruct.new users: users

      (1..1000).each { ERB.new(erb_template, 0, '', '@output').result bind }
    end

    b.report(:erector) do
      (1..1000).each { ErectorWidget.new(users: users).to_html }
    end

    b.report(:fortitude) do
      (1..1000).each { FortitudeWidget.new(users: users).to_html }
    end
  end

end
