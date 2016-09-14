class Object
  def self.const_missing(c)
    const = c.to_s
    require c.to_s.to_snake_case
    Object.const_get(const)
  end
end
