# The Object Class

class AsanaCliGem::Asana

  attr_accessor :name, :sanskrit, :summary, :tip, :url
  @@all = []

  def initialize(name, summary, url)
    @name = name
    @summary = summary
    @url = url
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
