defmodule InClassExercise.Assignments.TaskStatus do
  use Ecto.Schema
  import Ecto.Changeset

  schema "task_statuses" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(task_status, attrs) do
    task_status
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
