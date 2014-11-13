task allocation_stats: :environment do

  require 'allocation_stats'
  require 'erector'

  stats = AllocationStats.trace do
    Erector.inline {
      div(class: 'foo') {
        p 'Hey!'
      }
    }.to_html
  end

  puts stats.allocations(alias_paths: true).group_by(:sourcefile, :sourceline, :class).to_text

end
