defmodule InClassExercise.Assignments do
  @moduledoc """
  The Assignments context.
  """

  import Ecto.Query, warn: false
  alias InClassExercise.Repo

  alias InClassExercise.Assignments.TaskStatus

  @doc """
  Returns the list of task_statuses.

  ## Examples

      iex> list_task_statuses()
      [%TaskStatus{}, ...]

  """
  def list_task_statuses do
    Repo.all(TaskStatus)
  end

  @doc """
  Gets a single task_status.

  Raises `Ecto.NoResultsError` if the Task status does not exist.

  ## Examples

      iex> get_task_status!(123)
      %TaskStatus{}

      iex> get_task_status!(456)
      ** (Ecto.NoResultsError)

  """
  def get_task_status!(id), do: Repo.get!(TaskStatus, id)

  @doc """
  Creates a task_status.

  ## Examples

      iex> create_task_status(%{field: value})
      {:ok, %TaskStatus{}}

      iex> create_task_status(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_task_status(attrs \\ %{}) do
    %TaskStatus{}
    |> TaskStatus.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a task_status.

  ## Examples

      iex> update_task_status(task_status, %{field: new_value})
      {:ok, %TaskStatus{}}

      iex> update_task_status(task_status, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_task_status(%TaskStatus{} = task_status, attrs) do
    task_status
    |> TaskStatus.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a task_status.

  ## Examples

      iex> delete_task_status(task_status)
      {:ok, %TaskStatus{}}

      iex> delete_task_status(task_status)
      {:error, %Ecto.Changeset{}}

  """
  def delete_task_status(%TaskStatus{} = task_status) do
    Repo.delete(task_status)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking task_status changes.

  ## Examples

      iex> change_task_status(task_status)
      %Ecto.Changeset{data: %TaskStatus{}}

  """
  def change_task_status(%TaskStatus{} = task_status, attrs \\ %{}) do
    TaskStatus.changeset(task_status, attrs)
  end

  alias InClassExercise.Assignments.Task

  @doc """
  Returns the list of tasks.

  ## Examples

      iex> list_tasks()
      [%Task{}, ...]

  """
  def list_tasks do
    Repo.all(Task)
  end

  @doc """
  Gets a single task.

  Raises `Ecto.NoResultsError` if the Task does not exist.

  ## Examples

      iex> get_task!(123)
      %Task{}

      iex> get_task!(456)
      ** (Ecto.NoResultsError)

  """
  def get_task!(id), do: Repo.get!(Task, id)

  @doc """
  Creates a task.

  ## Examples

      iex> create_task(%{field: value})
      {:ok, %Task{}}

      iex> create_task(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_task(attrs \\ %{}) do
    %Task{}
    |> Task.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a task.

  ## Examples

      iex> update_task(task, %{field: new_value})
      {:ok, %Task{}}

      iex> update_task(task, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_task(%Task{} = task, attrs) do
    task
    |> Task.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a task.

  ## Examples

      iex> delete_task(task)
      {:ok, %Task{}}

      iex> delete_task(task)
      {:error, %Ecto.Changeset{}}

  """
  def delete_task(%Task{} = task) do
    Repo.delete(task)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking task changes.

  ## Examples

      iex> change_task(task)
      %Ecto.Changeset{data: %Task{}}

  """
  def change_task(%Task{} = task, attrs \\ %{}) do
    Task.changeset(task, attrs)
  end

  alias InClassExercise.Assignments.AssignmentStatus

  @doc """
  Returns the list of assignment_statuses.

  ## Examples

      iex> list_assignment_statuses()
      [%AssignmentStatus{}, ...]

  """
  def list_assignment_statuses do
    Repo.all(AssignmentStatus)
  end

  @doc """
  Gets a single assignment_status.

  Raises `Ecto.NoResultsError` if the Assignment status does not exist.

  ## Examples

      iex> get_assignment_status!(123)
      %AssignmentStatus{}

      iex> get_assignment_status!(456)
      ** (Ecto.NoResultsError)

  """
  def get_assignment_status!(id), do: Repo.get!(AssignmentStatus, id)

  @doc """
  Creates a assignment_status.

  ## Examples

      iex> create_assignment_status(%{field: value})
      {:ok, %AssignmentStatus{}}

      iex> create_assignment_status(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_assignment_status(attrs \\ %{}) do
    %AssignmentStatus{}
    |> AssignmentStatus.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a assignment_status.

  ## Examples

      iex> update_assignment_status(assignment_status, %{field: new_value})
      {:ok, %AssignmentStatus{}}

      iex> update_assignment_status(assignment_status, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_assignment_status(%AssignmentStatus{} = assignment_status, attrs) do
    assignment_status
    |> AssignmentStatus.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a assignment_status.

  ## Examples

      iex> delete_assignment_status(assignment_status)
      {:ok, %AssignmentStatus{}}

      iex> delete_assignment_status(assignment_status)
      {:error, %Ecto.Changeset{}}

  """
  def delete_assignment_status(%AssignmentStatus{} = assignment_status) do
    Repo.delete(assignment_status)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking assignment_status changes.

  ## Examples

      iex> change_assignment_status(assignment_status)
      %Ecto.Changeset{data: %AssignmentStatus{}}

  """
  def change_assignment_status(%AssignmentStatus{} = assignment_status, attrs \\ %{}) do
    AssignmentStatus.changeset(assignment_status, attrs)
  end

  alias InClassExercise.Assignments.Assignment

  @doc """
  Returns the list of assignments.

  ## Examples

      iex> list_assignments()
      [%Assignment{}, ...]

  """
  def list_assignments do
    Repo.all(Assignment)
  end

  @doc """
  Gets a single assignment.

  Raises `Ecto.NoResultsError` if the Assignment does not exist.

  ## Examples

      iex> get_assignment!(123)
      %Assignment{}

      iex> get_assignment!(456)
      ** (Ecto.NoResultsError)

  """
  def get_assignment!(id) do
    Repo.get!(Assignment, id)
    |> Repo.preload([:task, :developer, :status])
  end

  @doc """
  Creates a assignment.

  ## Examples

      iex> create_assignment(%{field: value})
      {:ok, %Assignment{}}

      iex> create_assignment(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_assignment(attrs \\ %{}) do
    %Assignment{}
    |> Assignment.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a assignment.

  ## Examples

      iex> update_assignment(assignment, %{field: new_value})
      {:ok, %Assignment{}}

      iex> update_assignment(assignment, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_assignment(%Assignment{} = assignment, attrs) do
    assignment
    |> Assignment.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a assignment.

  ## Examples

      iex> delete_assignment(assignment)
      {:ok, %Assignment{}}

      iex> delete_assignment(assignment)
      {:error, %Ecto.Changeset{}}

  """
  def delete_assignment(%Assignment{} = assignment) do
    Repo.delete(assignment)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking assignment changes.

  ## Examples

      iex> change_assignment(assignment)
      %Ecto.Changeset{data: %Assignment{}}

  """
  def change_assignment(%Assignment{} = assignment, attrs \\ %{}) do
    Assignment.changeset(assignment, attrs)
  end
end
