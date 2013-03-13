class Bike

  include DataMapper::Resource

  property :id,         Serial    # An auto-increment integer key
  # property :borrower, 
  # property :broken,


  def initialize
    @broken = false
  end

  def broken?
    @broken    
  end

  def break!
    @broken = true
    self   
  end

  def fix!
    @broken = false
    self
  end

end