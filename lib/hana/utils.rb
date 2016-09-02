class String
  def to_snake_case
    self.gsub("::", "/").
      gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2').      #FOOBar => foo_bar
      gsub(/([a-zd])([A-Z])/, '\1_\2').           #FO86OBar => fo86_o_bar
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

  def pluralize
    gsub!(/([^aeiouy]|qu)y$/i, '1ies')
    gsub!(/(ss|z|ch|sh|x)$/i, '1es')
    gsub!(/(is)$/i, 'es')
    gsub!(/(f|fe)$/i, 'ves')
    gsub!(/(ex|ix)$/i, 'ices')
    gsub!(/(a)$/i, 'ae')
    gsub!(/(um|on)$/i, 'a')
    gsub!(/(us)$/i, 'i')
    gsub!(/(eau)$/i, 'eaux')
    gsub!(/([^saeix])$/i, '1s')
    self
  end
end

class Object
  def self.const_missing(c)
    const = c.to_s
    require c.to_s.snakize
    const.constantize
  end
end
