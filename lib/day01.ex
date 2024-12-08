defmodule AOC.Day01 do

  @spec second_part(binary()) :: number()
  def second_part(contents) do
    [ numbers , ocurrences ] =
      String.split(contents, "\n")
      |> Enum.filter(fn el -> String.length(el) > 1 end)
      |> Enum.map(&numbers_from_line/1)
      |> List.foldl([[], Map.new()], &map_ocurrences_counter/2)

    numbers
    |> Enum.map(&(Map.get(ocurrences, &1, 0) * &1))
    |> Enum.sum()
  end

  @spec first_part(binary()) :: number()
  def first_part(contents) do
    String.split(contents, "\n")
    |> Enum.filter(fn el -> String.length(el) > 1 end)
    |> Enum.map(&numbers_from_line/1)
    |> List.foldl([[], []], &acc_func/2)
    |> Enum.map(&order_numbers/1)
    |> Enum.reduce(&calculate_delta/2)
    |> Enum.sum()
  end

  def map_ocurrences_counter([ln, rn], [numbers, ocurrences]) do
    [ [ln | numbers],  Map.update(ocurrences, rn, 1, &(&1 + 1))]
  end

  def calculate_delta(xs1, xs2), do:
    Enum.map(Enum.zip(xs1, xs2), fn {a, b} ->
      if (x = (b - a)) >= 0, do: x, else: -x
    end)

  def order_numbers(xs), do: Enum.sort(xs, &(&1 < &2))

  def numbers_from_line(line) do
    [ln, rn] = String.split(line)
    [String.to_integer(ln), String.to_integer(rn)]
  end

  def acc_func([ln, rn], [ groupA, groupB]), do: [ [ln | groupA] , [rn | groupB] ]
end
