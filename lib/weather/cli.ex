defmodule Weather.CLI do
	@moduledoc """
	Handle the command line parsing and the dispatch to
	the various functions that end up formatting the XML
	in a readable manner.
	"""
	def run(argv) do
		argv
		|> parse_args
		|> process
	end

	def parse_args(argv) do
		parse = OptionParser.parse(argv, switches: [help: :boolean], aliases: [h: :help])
		case parse do
			{[help: true], [], []} -> :help
		end
	end

	def process(:help) do
		IO.puts """
		usage: No parameters are required for this cli utility
		"""
		System.halt(0)
	end

	def process() do
		Weather.Denton.fetch()
	end
end
