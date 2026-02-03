defmodule Algorithms do
  # 1️⃣ Zoeken in een ongeordende lijst (lineair zoeken)
  def linear_search([], _target), do: false
  def linear_search([h | t], target) do
    if h == target do
      true
    else
      linear_search(t, target)
    end
  end

  # --------------------------------------------------

  # 2️⃣ Tel paren waarbij het eerste getal kleiner is dan het tweede
  def count_pairs(list), do: count_pairs(list, 0)

  defp count_pairs([], acc), do: acc
  defp count_pairs([h | t], acc) do
    count =
      Enum.count(t, fn x -> h < x end)

    count_pairs(t, acc + count)
  end

  # --------------------------------------------------

  # 3️⃣ Faculteit
  def factorial(0), do: 1
  def factorial(n) when n > 0 do
    n * factorial(n - 1)
  end

  # --------------------------------------------------

  # 4️⃣ Aantal routes in een binaire boom
  defmodule Tree do
    defstruct value: nil, left: nil, right: nil
  end

  def count_routes(nil), do: 0
  def count_routes(%Tree{left: nil, right: nil}), do: 1
  def count_routes(%Tree{left: l, right: r}) do
    count_routes(l) + count_routes(r)
  end

  # --------------------------------------------------

  # 5️⃣ Binaire zoekfunctie (gesorteerde lijst)
  def binary_search(list, target) do
    do_binary_search(list, target, 0, length(list) - 1)
  end

  defp do_binary_search(_list, _target, low, high) when low > high, do: false

  defp do_binary_search(list, target, low, high) do
    mid = div(low + high, 2)
    value = Enum.at(list, mid)

    cond do
      value == target -> true
      value < target  -> do_binary_search(list, target, mid + 1, high)
      value > target  -> do_binary_search(list, target, low, mid - 1)
    end
  end

  # --------------------------------------------------

  # 6️⃣ Som van een lijst
  def list_sum([]), do: 0
  def list_sum([h | t]), do: h + list_sum(t)

  # --------------------------------------------------

  # 7️⃣ Matrixvermenigvuldiging
  def matrix_multiply(a, b) do
    b_t = transpose(b)

    for row <- a do
      for col <- b_t do
        dot(row, col)
      end
    end
  end

  defp dot(xs, ys) do
    Enum.zip(xs, ys)
    |> Enum.map(fn {x, y} -> x * y end)
    |> Enum.sum()
  end

  defp transpose(matrix) do
    matrix
    |> List.zip()
    |> Enum.map(&Tuple.to_list/1)
  end
end
