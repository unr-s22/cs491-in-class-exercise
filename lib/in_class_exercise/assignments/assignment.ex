defmodule InClassExercise.Assignments.Assignment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "assignments" do
    field :due_date, :naive_datetime
    field :name, :string
    belongs_to :developer, InClassExercise.Developers.Developer
    belongs_to :task, InClassExercise.Assignments.Task
    belongs_to :status, InClassExercise.Assignments.AssignmentStatus

    timestamps()
  end

  @doc false
  def changeset(assignment, attrs) do
    assignment
    |> cast(attrs, [:name, :due_date, :developer_id, :task_id, :status_id])
    |> validate_required([:name, :due_date, :developer_id])
  end
end
