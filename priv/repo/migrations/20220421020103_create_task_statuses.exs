defmodule InClassExercise.Repo.Migrations.CreateTaskStatuses do
  use Ecto.Migration

  def change do
    create table(:task_statuses) do
      add :name, :string

      timestamps()
    end
  end
end
