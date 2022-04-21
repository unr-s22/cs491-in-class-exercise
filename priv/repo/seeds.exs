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

for s <- ["In Progress", "Completed", "Blocked", "Deprecated"] do
  %InClassExercise.Assignments.AssignmentStatus{name: s} |> Repo.insert()
end

for s <- ["UI", "Database", "Back-end"] do
  %InClassExercise.Developers.Area{name: s} |> Repo.insert()
end

for s <- ["Add menu", "Change CSS", "Revise build system"] do
  %InClassExercise.Assignments.Task{name: s, description: "A task"} |> Repo.insert()
end
