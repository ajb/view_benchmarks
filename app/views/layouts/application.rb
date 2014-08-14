class Views::Layouts::Application < Erector::Widget

  def content
    rawtext '<!doctype html>'
    html {
      head {
        title 'ViewBenchmarks'
        stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track' => true
        javascript_include_tag 'application', 'data-turbolinks-track' => true
        csrf_meta_tags
      }
      body {
        main
      }
    }
  end

end
