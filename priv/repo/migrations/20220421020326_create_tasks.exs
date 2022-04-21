defmodule InClassExercise.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :name, :string
      add :description, :string
      add :status_id, references(:task_statuses, on_delete: :nothing)

      timestamps()
    end

    create index(:tasks, [:status_id])
  end
end
