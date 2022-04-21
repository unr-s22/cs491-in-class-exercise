defmodule InClassExercise.AssignmentsTest do
  use InClassExercise.DataCase

  alias InClassExercise.Assignments

  describe "task_statuses" do
    alias InClassExercise.Assignments.TaskStatus

    import InClassExercise.AssignmentsFixtures

    @invalid_attrs %{name: nil}

    test "list_task_statuses/0 returns all task_statuses" do
      task_status = task_status_fixture()
      assert Assignments.list_task_statuses() == [task_status]
    end

    test "get_task_status!/1 returns the task_status with given id" do
      task_status = task_status_fixture()
      assert Assignments.get_task_status!(task_status.id) == task_status
    end

    test "create_task_status/1 with valid data creates a task_status" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %TaskStatus{} = task_status} = Assignments.create_task_status(valid_attrs)
      assert task_status.name == "some name"
    end

    test "create_task_status/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Assignments.create_task_status(@invalid_attrs)
    end

    test "update_task_status/2 with valid data updates the task_status" do
      task_status = task_status_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %TaskStatus{} = task_status} = Assignments.update_task_status(task_status, update_attrs)
      assert task_status.name == "some updated name"
    end

    test "update_task_status/2 with invalid data returns error changeset" do
      task_status = task_status_fixture()
      assert {:error, %Ecto.Changeset{}} = Assignments.update_task_status(task_status, @invalid_attrs)
      assert task_status == Assignments.get_task_status!(task_status.id)
    end

    test "delete_task_status/1 deletes the task_status" do
      task_status = task_status_fixture()
      assert {:ok, %TaskStatus{}} = Assignments.delete_task_status(task_status)
      assert_raise Ecto.NoResultsError, fn -> Assignments.get_task_status!(task_status.id) end
    end

    test "change_task_status/1 returns a task_status changeset" do
      task_status = task_status_fixture()
      assert %Ecto.Changeset{} = Assignments.change_task_status(task_status)
    end
  end

  describe "tasks" do
    alias InClassExercise.Assignments.Task

    import InClassExercise.AssignmentsFixtures

    @invalid_attrs %{description: nil, name: nil}

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert Assignments.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert Assignments.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      valid_attrs = %{description: "some description", name: "some name"}

      assert {:ok, %Task{} = task} = Assignments.create_task(valid_attrs)
      assert task.description == "some description"
      assert task.name == "some name"
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Assignments.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      update_attrs = %{description: "some updated description", name: "some updated name"}

      assert {:ok, %Task{} = task} = Assignments.update_task(task, update_attrs)
      assert task.description == "some updated description"
      assert task.name == "some updated name"
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = Assignments.update_task(task, @invalid_attrs)
      assert task == Assignments.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = Assignments.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> Assignments.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = Assignments.change_task(task)
    end
  end

  describe "assignment_statuses" do
    alias InClassExercise.Assignments.AssignmentStatus

    import InClassExercise.AssignmentsFixtures

    @invalid_attrs %{name: nil}

    test "list_assignment_statuses/0 returns all assignment_statuses" do
      assignment_status = assignment_status_fixture()
      assert Assignments.list_assignment_statuses() == [assignment_status]
    end

    test "get_assignment_status!/1 returns the assignment_status with given id" do
      assignment_status = assignment_status_fixture()
      assert Assignments.get_assignment_status!(assignment_status.id) == assignment_status
    end

    test "create_assignment_status/1 with valid data creates a assignment_status" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %AssignmentStatus{} = assignment_status} = Assignments.create_assignment_status(valid_attrs)
      assert assignment_status.name == "some name"
    end

    test "create_assignment_status/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Assignments.create_assignment_status(@invalid_attrs)
    end

    test "update_assignment_status/2 with valid data updates the assignment_status" do
      assignment_status = assignment_status_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %AssignmentStatus{} = assignment_status} = Assignments.update_assignment_status(assignment_status, update_attrs)
      assert assignment_status.name == "some updated name"
    end

    test "update_assignment_status/2 with invalid data returns error changeset" do
      assignment_status = assignment_status_fixture()
      assert {:error, %Ecto.Changeset{}} = Assignments.update_assignment_status(assignment_status, @invalid_attrs)
      assert assignment_status == Assignments.get_assignment_status!(assignment_status.id)
    end

    test "delete_assignment_status/1 deletes the assignment_status" do
      assignment_status = assignment_status_fixture()
      assert {:ok, %AssignmentStatus{}} = Assignments.delete_assignment_status(assignment_status)
      assert_raise Ecto.NoResultsError, fn -> Assignments.get_assignment_status!(assignment_status.id) end
    end

    test "change_assignment_status/1 returns a assignment_status changeset" do
      assignment_status = assignment_status_fixture()
      assert %Ecto.Changeset{} = Assignments.change_assignment_status(assignment_status)
    end
  end

  describe "assignments" do
    alias InClassExercise.Assignments.Assignment

    import InClassExercise.AssignmentsFixtures

    @invalid_attrs %{due_date: nil, name: nil}

    test "list_assignments/0 returns all assignments" do
      assignment = assignment_fixture()
      assert Assignments.list_assignments() == [assignment]
    end

    test "get_assignment!/1 returns the assignment with given id" do
      assignment = assignment_fixture()
      assert Assignments.get_assignment!(assignment.id) == assignment
    end

    test "create_assignment/1 with valid data creates a assignment" do
      valid_attrs = %{due_date: ~N[2022-04-20 02:22:00], name: "some name"}

      assert {:ok, %Assignment{} = assignment} = Assignments.create_assignment(valid_attrs)
      assert assignment.due_date == ~N[2022-04-20 02:22:00]
      assert assignment.name == "some name"
    end

    test "create_assignment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Assignments.create_assignment(@invalid_attrs)
    end

    test "update_assignment/2 with valid data updates the assignment" do
      assignment = assignment_fixture()
      update_attrs = %{due_date: ~N[2022-04-21 02:22:00], name: "some updated name"}

      assert {:ok, %Assignment{} = assignment} = Assignments.update_assignment(assignment, update_attrs)
      assert assignment.due_date == ~N[2022-04-21 02:22:00]
      assert assignment.name == "some updated name"
    end

    test "update_assignment/2 with invalid data returns error changeset" do
      assignment = assignment_fixture()
      assert {:error, %Ecto.Changeset{}} = Assignments.update_assignment(assignment, @invalid_attrs)
      assert assignment == Assignments.get_assignment!(assignment.id)
    end

    test "delete_assignment/1 deletes the assignment" do
      assignment = assignment_fixture()
      assert {:ok, %Assignment{}} = Assignments.delete_assignment(assignment)
      assert_raise Ecto.NoResultsError, fn -> Assignments.get_assignment!(assignment.id) end
    end

    test "change_assignment/1 returns a assignment changeset" do
      assignment = assignment_fixture()
      assert %Ecto.Changeset{} = Assignments.change_assignment(assignment)
    end
  end
end
