require 'test_helper'
require 'rails/performance_test_help'

class ErbTest < ActionDispatch::PerformanceTest
  self.profile_options = { runs: 50 }

  test "homepage" do
    get '/erb/users_index'
  end
end
