$roman_mapping = {
  1000 => "M",
  900 => "CM",
  500 => "D",
  400 => "CD",
  100 => "C",
  90 => "XC",
  50 => "L",
  40 => "XL",
  10 => "X",
  9 => "IX",
  5 => "V",
  4 => "IV",
  1 => "I"
}

$roman_mapping_keys = $roman_mapping.keys.sort {|a,b| b <=> a}


def integer_to_roman(n)
  return $roman_mapping[n] if $roman_mapping[n] != nil

  return 0 if n==0

  $roman_mapping_keys.each do |key|
    return $roman_mapping[key]+integer_to_roman(n-key)if key<n
  end
end

def roman_to_integer(n)
  return $roman_mapping.key(n) if $roman_mapping.key(n) != nil
  if $roman_mapping.key(n[0..1]) != nil
    return $roman_mapping.key(n[0..1]) + roman_to_integer(n[2..])
  else
    return $roman_mapping.key(n[0]) + roman_to_integer(n[1..])
  end
end