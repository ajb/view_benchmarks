class Views::Fortitude::Base < Fortitude::Widget
  doctype :html5
  start_and_end_comments false
  format_output false

  def content
    html {
      head {
        title 'ViewBenchmarks'
        stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track' => true
        javascript_include_tag 'application', 'data-turbolinks-track' => true
        csrf_meta_tags
      }
      body {
        yield
      }
    }
  end
end
