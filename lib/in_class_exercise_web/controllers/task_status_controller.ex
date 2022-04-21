defmodule InClassExerciseWeb.TaskStatusController do
  use InClassExerciseWeb, :controller

  alias InClassExercise.Assignments
  alias InClassExercise.Assignments.TaskStatus

  def index(conn, _params) do
    task_statuses = Assignments.list_task_statuses()
    render(conn, "index.html", task_statuses: task_statuses)
  end

  def new(conn, _params) do
    changeset = Assignments.change_task_status(%TaskStatus{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"task_status" => task_status_params}) do
    case Assignments.create_task_status(task_status_params) do
      {:ok, task_status} ->
        conn
        |> put_flash(:info, "Task status created successfully.")
        |> redirect(to: Routes.task_status_path(conn, :show, task_status))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    task_status = Assignments.get_task_status!(id)
    render(conn, "show.html", task_status: task_status)
  end

  def edit(conn, %{"id" => id}) do
    task_status = Assignments.get_task_status!(id)
    changeset = Assignments.change_task_status(task_status)
    render(conn, "edit.html", task_status: task_status, changeset: changeset)
  end

  def update(conn, %{"id" => id, "task_status" => task_status_params}) do
    task_status = Assignments.get_task_status!(id)

    case Assignments.update_task_status(task_status, task_status_params) do
      {:ok, task_status} ->
        conn
        |> put_flash(:info, "Task status updated successfully.")
        |> redirect(to: Routes.task_status_path(conn, :show, task_status))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", task_status: task_status, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    task_status = Assignments.get_task_status!(id)
    {:ok, _task_status} = Assignments.delete_task_status(task_status)

    conn
    |> put_flash(:info, "Task status deleted successfully.")
    |> redirect(to: Routes.task_status_path(conn, :index))
  end
end
