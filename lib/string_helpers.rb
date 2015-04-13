module StringHelpers

  def is_numeric(str)
    true if Float(str) rescue false
  end 

end