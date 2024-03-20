require './models/axe'
class AxeGroup

  attr_accessor :group, :key, :url, :version
  def initialize(array)
    @group = array
    @key = array[0].key
    @url = array[0].url
    @version = array[0].version
  end

  def self.all
    Axe.all.to_a.group_by(&:key).map do |_key, group|
      AxeGroup.new(group)
    end
  end

  def self.find(key)
    axe = Axe.where(key: key).to_a
    throw ActiveRecord::RecordNotFound if axe.empty?
    AxeGroup.new(axe)
  end

  def conformity(level)
    levels = level == 'AA' ? %w[A AA] : %w[A]
    positive = group.count { |axe| axe.result == Axe::POSITIVE && levels.include?(axe.level) }
    negative = group.count { |axe| axe.result == Axe::NEGATIVE && levels.include?(axe.level) }

    return 0 if negative + positive == 0
    (positive.to_f / (positive + negative) * 100).to_i
  end
end