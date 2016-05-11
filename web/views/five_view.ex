defmodule Hello.FiveView do
  use Hello.Web, :view

  def fives_header do
  	count = Hello.Five.count

  	case count do
  		{0} ->
  			"No fives yet, be the first one!"
  		{1} ->
  			"Just one five :-("
  		_ ->
  			"We have #{count} fives!"
  	end
  end
end
