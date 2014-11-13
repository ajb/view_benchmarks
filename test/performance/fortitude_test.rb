require 'test_helper'
require 'rails/performance_test_help'

class FortitudeTest < ActionDispatch::PerformanceTest
  self.profile_options = { runs: 50 }

  test "homepage" do
    get '/fortitude/users_index'
  end
end
