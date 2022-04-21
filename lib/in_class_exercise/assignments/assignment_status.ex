defmodule InClassExercise.Assignments.AssignmentStatus do
  use Ecto.Schema
  import Ecto.Changeset

  schema "assignment_statuses" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(assignment_status, attrs) do
    assignment_status
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
