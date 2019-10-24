def fibs(number)
  a = 0
  b = 1
  c = a + b
  result = []
  if number == 1
    return a
  elsif number == 2
    return [a, b]
  else
    result.push(a)
    result.push(b)
    3.upto number do
      result.push c
      a = b
      b = c
      c = a + b
    end
    return result
  end
end

def fibs_rec(number)
  number <= 1 ? number : fibs_rec(number - 1) + fibs_rec(number - 2)
end