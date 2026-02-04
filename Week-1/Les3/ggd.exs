defmodule GCD do

  def gcd(a, 0) do
    IO.puts("Reached base case: gcd = #{a}")
    a
  end

  def gcd(a, b) do
    IO.puts("gcd(#{a}, #{b}) → gcd(#{b}, #{rem(a, b)})")
    gcd(b, rem(a, b))
  end


  def run do
    a = 102
    b = 60

    IO.puts("Calculating GCD of #{a} and #{b}")

    result = gcd(a, b)

    IO.puts("GCD of #{a} and #{b} is #{result}")
  end
end

GCD.run()
