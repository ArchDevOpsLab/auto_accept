class Patterns
  
  class << self
    attr_accessor :patterns 
  end

  def initialize

    @patterns = 
    {  
      "button" => "//*[text()='<replace>']",
      "field" => "//input[@aria-label='<replace>']",
      "box" => "//h4[text()='<replace>']"
    }
  end

  def get(type, replace)
    return @patterns[type].gsub('<replace>', replace)
  end

end