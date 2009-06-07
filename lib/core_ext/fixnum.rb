class Fixnum

  alias :__clef__plus__ :+
  alias :__clef__asterisk__ :*

  def +(rhs)
    if rhs.is_a?(Clef::Sequence)
      rhs + self
    else
      __clef__plus__(rhs)
    end
  end

  def *(rhs)
    if rhs.is_a?(Clef::Sequence)
      rhs * self
    else
      __clef__asterisk__(rhs)
    end
  end

end
