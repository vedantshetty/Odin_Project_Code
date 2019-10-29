class Calculator
  def add(*numbers)
    numbers.reduce{|number,sum| number+sum}
  end

  def subtract(*numbers)
    numbers.reduce {|difference,number| difference -number}
  end
end
