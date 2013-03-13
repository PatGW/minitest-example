class Bike

  include DataMapper::Resource

  property :id,         Serial    # An auto-increment integer key
  property :broken,     Boolean
  # property :borrower, 
  # property :broken,


  def initialize
    @broken = false
  end

  def broken?
    @broken    
  end

  def break!
    self.broken = true
  end

  def fix!
    @broken = false
    self
  end

end