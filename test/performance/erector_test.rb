require 'test_helper'
require 'rails/performance_test_help'

class ErectorTest < ActionDispatch::PerformanceTest
  self.profile_options = { runs: 50 }

  test "homepage" do
    get '/erector/users_index'
  end
end
