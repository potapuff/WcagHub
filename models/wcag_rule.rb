class WcagRule < ActiveRecord::Base

  def self.[](key)
    @@hash ||= WcagRule.all.to_a.index_by(&:key)
    @@hash[key]
  end


end