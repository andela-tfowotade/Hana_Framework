class String
  def to_snake_case
    self.gsub("::", "/").
      gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2').          #FooBar => foo_bar
      gsub(/([A-Z][a-z]+)([A-Z][a-z])/, '\1_\2').     #FooBar => foo_bar
      gsub(/([A-Z][a-z]+\d+)([A-Z][a-z]+)/, '\1_\2').    #FO86OBar => fo86_o_bar
      tr("-", "_").
      downcase
  end

  def to_camel_case
    return self if self !~ /_/ && self =~/[A-Z]+.*/
    split('_').map{ |str| str.capitalize }.join       #hi_there => HiThere
  end

  def constantize
    Object.const_get(self)
  end
end
