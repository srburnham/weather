import SweetXml
defmodule Weather.Denton do
	def fetch() do
		weather_url()
		|> HTTPoison.get()
		|> handle_response
		|> get_elements
	end

	def weather_url() do
		"http://w1.weather.gov/xml/current_obs/KDTO.xml"
	end

	def handle_response({:ok, %{status_code: 200, body: body}}) do
		body
	end

	def get_elements(xml) do
		xpath(xml, ~x"//current_observation",
		observation_time: ~x"./observation_time/text()",
		weather: ~x"./weather/text()",
		temp_f: ~x"./temp_f/text()",
		temp_c: ~x"./temp_c/text()")
	end

	def test(xml) do
		Enum.map(xml, fn (x, xelem) -> xpath(xml, ~x"//current_observation", x: ~x"./#{x}/text()") end)
	end
end
