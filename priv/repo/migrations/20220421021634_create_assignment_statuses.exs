defmodule InClassExercise.Repo.Migrations.CreateAssignmentStatuses do
  use Ecto.Migration

  def change do
    create table(:assignment_statuses) do
      add :name, :string

      timestamps()
    end
  end
end
