defmodule Hello do
  def run(name) do
    "Hello, #{name}!"
  end
end

IO.puts(Hello.run("Elixir"))

