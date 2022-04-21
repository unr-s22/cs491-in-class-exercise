# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     InClassExercise.Repo.insert!(%InClassExercise.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias InClassExercise.Repo

for s <- ["In Progress", "Completed"] do
  %InClassExercise.Assignments.TaskStatus{name: s} |> Repo.insert()
end

for s <- ["UI", "Database", "Back-end"] do
  %InClassExercise.Developers.Area{name: s} |> Repo.insert()
end

for d <- ~w(Tom Sandy Elmer) do
  %InClassExercise.Developers.Developer{last_name: "Smith", first_name: d, area_id: 1}
end
