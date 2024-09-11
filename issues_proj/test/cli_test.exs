defmodule CliTest do
  use ExUnit.Case
  doctest IssuesProj

  import Issues.CLI, only: [parse_args: 1]

  test ":help returned by option type -h or --help options" do
    assert parse_args(["-h", "anything"]) == :help
    assert parse_args(["--help", "anything"]) == :help
  end

  test "three values returned if three given" do
    assert parse_args(["user", "project", "15"]) == {"user", "project", 15}
  end

  test "count is defaulted if two values given" do
    assert parse_args(["user", "project"]) == {"user", "project", 4}
  end

  test "help is returned when no argument is passed" do
    assert(parse_args([]) == :help)
  end
end
