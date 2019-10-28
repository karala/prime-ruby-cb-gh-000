require 'benchmark'
require 'bigdecimal/math'

def prime?(num)
  if num < 0 or num == 0 or num == 1
    return false
  else
    (2..num-1).to_a.all? do | possible_factor |
      num % possible_factor != 0
    end
  end
end

iterations = 100_000

Benchmark.bm do |bm|
  # joining an array of strings
  bm.report do
    iterations.times do
      ["The", "current", "time", "is", Time.now].join(" ")
    end
  end

  # using string interpolation
  bm.report do
    iterations.times do
      "The current time is #{Time.now}"
    end
  end
end
