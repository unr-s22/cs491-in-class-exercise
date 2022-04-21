defmodule InClassExerciseWeb.DeveloperView do
  use InClassExerciseWeb, :view

  def full_name(developer) do
    developer.first_name <> " " <> developer.last_name
  end
end
