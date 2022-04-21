defmodule InClassExerciseWeb.AssignmentStatusController do
  use InClassExerciseWeb, :controller

  alias InClassExercise.Assignments
  alias InClassExercise.Assignments.AssignmentStatus

  def index(conn, _params) do
    assignment_statuses = Assignments.list_assignment_statuses()
    render(conn, "index.html", assignment_statuses: assignment_statuses)
  end

  def new(conn, _params) do
    changeset = Assignments.change_assignment_status(%AssignmentStatus{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"assignment_status" => assignment_status_params}) do
    case Assignments.create_assignment_status(assignment_status_params) do
      {:ok, assignment_status} ->
        conn
        |> put_flash(:info, "Assignment status created successfully.")
        |> redirect(to: Routes.assignment_status_path(conn, :show, assignment_status))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    assignment_status = Assignments.get_assignment_status!(id)
    render(conn, "show.html", assignment_status: assignment_status)
  end

  def edit(conn, %{"id" => id}) do
    assignment_status = Assignments.get_assignment_status!(id)
    changeset = Assignments.change_assignment_status(assignment_status)
    render(conn, "edit.html", assignment_status: assignment_status, changeset: changeset)
  end

  def update(conn, %{"id" => id, "assignment_status" => assignment_status_params}) do
    assignment_status = Assignments.get_assignment_status!(id)

    case Assignments.update_assignment_status(assignment_status, assignment_status_params) do
      {:ok, assignment_status} ->
        conn
        |> put_flash(:info, "Assignment status updated successfully.")
        |> redirect(to: Routes.assignment_status_path(conn, :show, assignment_status))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", assignment_status: assignment_status, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    assignment_status = Assignments.get_assignment_status!(id)
    {:ok, _assignment_status} = Assignments.delete_assignment_status(assignment_status)

    conn
    |> put_flash(:info, "Assignment status deleted successfully.")
    |> redirect(to: Routes.assignment_status_path(conn, :index))
  end
end
