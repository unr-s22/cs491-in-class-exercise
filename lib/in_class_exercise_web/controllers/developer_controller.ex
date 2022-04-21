defmodule InClassExerciseWeb.DeveloperController do
  use InClassExerciseWeb, :controller
  alias InClassExercise.Repo
  alias InClassExercise.Developers
  alias InClassExercise.Developers.Developer

  def index(conn, _params) do
    developers = Developers.list_developers()
    render(conn, "index.html", developers: developers)
  end

  def new(conn, _params) do
    changeset = Developers.change_developer(%Developer{})

    render(conn, "new.html", changeset: changeset, areas: get_areas())
  end

  def create(conn, %{"developer" => developer_params}) do
    case Developers.create_developer(developer_params) do
      {:ok, developer} ->
        conn
        |> put_flash(:info, "Developer created successfully.")
        |> redirect(to: Routes.developer_path(conn, :show, developer))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    developer =
      Developers.get_developer!(id)
      |> Repo.preload([:area, assignments: [:task, :status]])

    render(conn, "show.html", developer: developer)
  end

  def edit(conn, %{"id" => id}) do
    developer = Developers.get_developer!(id) |> Repo.preload(:area)
    changeset = Developers.change_developer(developer)
    render(conn, "edit.html", developer: developer, changeset: changeset, areas: get_areas())
  end

  def update(conn, %{"id" => id, "developer" => developer_params}) do
    developer = Developers.get_developer!(id)

    case Developers.update_developer(developer, developer_params) do
      {:ok, developer} ->
        conn
        |> put_flash(:info, "Developer updated successfully.")
        |> redirect(to: Routes.developer_path(conn, :show, developer))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", developer: developer, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    developer = Developers.get_developer!(id)
    {:ok, _developer} = Developers.delete_developer(developer)

    conn
    |> put_flash(:info, "Developer deleted successfully.")
    |> redirect(to: Routes.developer_path(conn, :index))
  end

  defp get_areas do
    Developers.list_areas()
    |> Enum.map(&{"#{&1.name}", &1.id})
  end
end
