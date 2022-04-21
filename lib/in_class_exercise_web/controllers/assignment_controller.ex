defmodule InClassExerciseWeb.AssignmentController do
  use InClassExerciseWeb, :controller
  alias InClassExercise.Developers
  alias InClassExercise.Developers.Developer
  alias InClassExercise.Assignments
  alias InClassExercise.Assignments.{Assignment, Task, AssignmentStatus}

  defp get_developers do
    Developers.list_developers()
    |> Enum.map(&{"#{&1.last_name}", &1.id})
  end

  defp get_statuses do
    Assignments.list_assignment_statuses()
    |> Enum.map(&{"#{&1.name}", &1.id})
  end

  defp get_assigns do
    [
      tasks: get_tasks(),
      developers: get_developers(),
      statuses: get_statuses()
    ]
  end

  defp get_tasks do
    Assignments.list_tasks()
    |> Enum.map(&{"#{&1.name}", &1.id})
  end

  def index(conn, _params) do
    assignments = Assignments.list_assignments()
    render(conn, "index.html", assignments: assignments)
  end

  def new(conn, _params) do
    changeset = Assignments.change_assignment(%Assignment{})

    render(conn, "new.html", [changeset: changeset] ++ get_assigns())
  end

  def create(conn, %{"assignment" => assignment_params}) do
    case Assignments.create_assignment(assignment_params) do
      {:ok, assignment} ->
        conn
        |> put_flash(:info, "Assignment created successfully.")
        |> redirect(to: Routes.assignment_path(conn, :show, assignment))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    assignment = Assignments.get_assignment!(id)
    render(conn, "show.html", assignment: assignment)
  end

  def edit(conn, %{"id" => id}) do
    assignment = Assignments.get_assignment!(id)
    changeset = Assignments.change_assignment(assignment)
    assigns = [assignment: assignment, changeset: changeset] ++ get_assigns()
    # render(conn, "edit.html", assignment: assignment, changeset: changeset, get_assigns())
    render(conn, "edit.html", assigns)
  end

  def update(conn, %{"id" => id, "assignment" => assignment_params}) do
    assignment = Assignments.get_assignment!(id)

    case Assignments.update_assignment(assignment, assignment_params) do
      {:ok, assignment} ->
        conn
        |> put_flash(:info, "Assignment updated successfully.")
        |> redirect(to: Routes.assignment_path(conn, :show, assignment))

      {:error, %Ecto.Changeset{} = changeset} ->
        assigns = [assignment: assignment, changeset: changeset] ++ get_assigns()
        render(conn, "edit.html", assigns)
    end
  end

  def delete(conn, %{"id" => id}) do
    assignment = Assignments.get_assignment!(id)
    {:ok, _assignment} = Assignments.delete_assignment(assignment)

    conn
    |> put_flash(:info, "Assignment deleted successfully.")
    |> redirect(to: Routes.assignment_path(conn, :index))
  end
end
