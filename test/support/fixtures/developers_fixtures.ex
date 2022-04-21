defmodule InClassExercise.DevelopersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `InClassExercise.Developers` context.
  """

  @doc """
  Generate a area.
  """
  def area_fixture(attrs \\ %{}) do
    {:ok, area} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> InClassExercise.Developers.create_area()

    area
  end

  @doc """
  Generate a developer.
  """
  def developer_fixture(attrs \\ %{}) do
    {:ok, developer} =
      attrs
      |> Enum.into(%{
        email: "some email",
        first_name: "some first_name",
        last_name: "some last_name"
      })
      |> InClassExercise.Developers.create_developer()

    developer
  end
end
