defmodule InClassExerciseWeb.PageController do
  use InClassExerciseWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
