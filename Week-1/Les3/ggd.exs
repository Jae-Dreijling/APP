defmodule GCD do
    def ggd(a, 0) do
        IO.puts("GCD found: #{a}")
        a
    end

    def ggd(a, b) do
        IO.puts("Calculating GCD of #{a} and #{b}")
        ggd(b, rem(a, b))
    end

    def main do
        a = 102  # First number
        b = 60  # Second number
        IO.puts("Calculating GCD of #{a} and #{b}")
        result = ggd(a, b)
        IO.puts("GCD of #{a} and #{b} is #{result}")
    end
end

GCD.main()
