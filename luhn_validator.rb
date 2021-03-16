# frozen_string_literal: true

module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i)
    test_number = nums_a.pop
    nums_a_double = nums_a.reverse.map.with_index do |m, i|
      if i.even?
        v_temp = m * 2
        v_temp > 9 ? v_temp - 9 : v_temp
      else
        m
      end
    end
    som_nums = nums_a_double.reduce { |n1, n2| n1 + n2 }

    test_number.zero? ? (som_nums % 10).zero? : (10 - som_nums % 10) == test_number

    # TODO: use the integers in nums_a to validate its last check digit
  end
end
