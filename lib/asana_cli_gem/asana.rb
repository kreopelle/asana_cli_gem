class AsanaCliGem::Asana
  attr_accessor :name, :sanskrit, :summary, :tip, :url
  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end

end
