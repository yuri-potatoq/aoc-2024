defmodule AOC.Day01Test do
  use ExUnit.Case

  @sample_input """
  3   4
  4   3
  2   5
  1   3
  3   9
  3   3
  """

  test "first part with sample data" do
    want = 11
    given = AOC.Day01.first_part(@sample_input)

    assert given == want
  end

  test "first part with real data from file" do
    {:ok, contents} = File.read("input-day01.txt")

    want = 2176849
    given = AOC.Day01.first_part(contents)

    assert given == want
  end

  test "second part with sample data" do
    want = 31
    given = AOC.Day01.second_part(@sample_input)

    assert given == want
  end

  test "second part with real data from file" do
    {:ok, contents} = File.read("input-day01.txt")

    want = 23384288
    given = AOC.Day01.second_part(contents)

    assert given == want
  end
end
