defmodule InClassExercise.Repo.Migrations.CreateAssignments do
  use Ecto.Migration

  def change do
    create table(:assignments) do
      add :name, :string
      add :due_date, :naive_datetime
      add :developer_id, references(:developers, on_delete: :nothing)
      add :task_id, references(:tasks, on_delete: :nothing)
      add :status_id, references(:assignment_statuses, on_delete: :nothing)

      timestamps()
    end

    create index(:assignments, [:developer_id])
    create index(:assignments, [:task_id])
    create index(:assignments, [:status_id])
  end
end
