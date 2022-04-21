defmodule InClassExercise.AssignmentsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `InClassExercise.Assignments` context.
  """

  @doc """
  Generate a task_status.
  """
  def task_status_fixture(attrs \\ %{}) do
    {:ok, task_status} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> InClassExercise.Assignments.create_task_status()

    task_status
  end

  @doc """
  Generate a task.
  """
  def task_fixture(attrs \\ %{}) do
    {:ok, task} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name"
      })
      |> InClassExercise.Assignments.create_task()

    task
  end

  @doc """
  Generate a assignment_status.
  """
  def assignment_status_fixture(attrs \\ %{}) do
    {:ok, assignment_status} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> InClassExercise.Assignments.create_assignment_status()

    assignment_status
  end

  @doc """
  Generate a assignment.
  """
  def assignment_fixture(attrs \\ %{}) do
    {:ok, assignment} =
      attrs
      |> Enum.into(%{
        due_date: ~N[2022-04-20 02:22:00],
        name: "some name"
      })
      |> InClassExercise.Assignments.create_assignment()

    assignment
  end
end
