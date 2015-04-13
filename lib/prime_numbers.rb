#!/usr/bin/env ruby
require_relative "prime"

def usage
  abort "usage: ruby prime_numbers.rb <quantity of primes>"
end

def is_numeric(str)
  true if Float(str) rescue false
end 

def print_table_border_row(columns, display_space)
  (0..columns).each do |i|
    print '-' * (display_space + 1)
  end
  puts '-'
end

def display_product_table
  prime = Prime.new
  prime_qty = ARGV[0]


# check if an argument passed in
  usage unless ARGV.length == 1

# check to make sure that the value passed in is a number
  usage unless is_numeric(ARGV[0])

  if prime_qty.to_i <= 0
    puts "The value has to be greater than 0."
    usage
  end

  prime_numbers = prime.get_numbers(prime_qty)
  table_columns = prime_numbers.size
  display_space = 9

  print_table_border_row(table_columns, display_space)

  (0..table_columns).each do |row|
    (0..table_columns).each do |col|
      if row == 0
        if col == 0
          print "|#{' ' * display_space}"
        else
          num = prime_numbers[col - 1]
          spaces = (display_space - num.to_s.size)/2.0
          print "|#{' ' * spaces.ceil}#{num}#{' ' * spaces.floor}"
        end
      else
        if col == 0
          num = prime_numbers[row - 1]
        else
          num = prime_numbers[row - 1] * prime_numbers[col - 1]
        end	
        
        spaces = (display_space - num.to_s.size)/2.0
        print "|#{' ' * spaces.ceil}#{num}#{' ' * spaces.floor}"
      end
    end
    puts '|'
    print_table_border_row(table_columns, display_space)
  end
end

# puts "Prime Numbers: #{get_prime_numbers.join(', ')}"
# puts ""
display_product_table