defmodule InClassExercise.Repo do
  use Ecto.Repo,
    otp_app: :in_class_exercise,
    adapter: Ecto.Adapters.Postgres
end
