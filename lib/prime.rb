#!/usr/bin/env ruby

class Prime

  def get_numbers(prime_qty)

    raise ArgumentError, 'Argument is missing', caller unless is_numeric(prime_qty)
    raise ArgumentError, 'Value has to be non-negative', caller unless prime_qty.to_i >= 0
    
#     Benchmarking
#     start_time = Time.now.to_f * 1000
    primes = []
    start_num = 2
    search_num = start_num
  	
    while primes.size < prime_qty.to_i do
      if search_num == start_num
        primes << search_num
        search_num += 1
      else 
        is_prime = true
        for i in primes
          if search_num % i == 0
            is_prime = false
            break
          end 
        end
      
        primes << search_num if is_prime
        search_num += 1
      end
    end
#     end_time = Time.now.to_f * 1000
#     puts "time to completion : #{end_time - start_time} ms"
  
    return primes
  end

  private

  def is_numeric(str)
    true if Float(str) rescue false
  end

end

