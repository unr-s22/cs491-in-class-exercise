defmodule InClassExercise.Assignments.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :description, :string
    field :name, :string
    belongs_to :status, InClassExercise.Assignments.TaskStatus
    has_many :assignments, InClassExercise.Assignments.Assignment
    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:name, :description, :status_id])
    |> validate_required([:name, :description, :status_id])
  end
end
