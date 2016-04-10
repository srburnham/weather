defmodule CliTest do
	use ExUnit.Case
	doctest Weather

	import Weather.CLI, only: [parse_args: 1]
	test ":help returned by option parsing with -h and --help options" do
		assert parse_args(["-h"]) == :help
		assert parse_args(["--help"]) == :help
	end
end
