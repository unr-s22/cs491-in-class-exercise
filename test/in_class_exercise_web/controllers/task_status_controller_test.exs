defmodule InClassExerciseWeb.TaskStatusControllerTest do
  use InClassExerciseWeb.ConnCase

  import InClassExercise.AssignmentsFixtures

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  describe "index" do
    test "lists all task_statuses", %{conn: conn} do
      conn = get(conn, Routes.task_status_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Task statuses"
    end
  end

  describe "new task_status" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.task_status_path(conn, :new))
      assert html_response(conn, 200) =~ "New Task status"
    end
  end

  describe "create task_status" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.task_status_path(conn, :create), task_status: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.task_status_path(conn, :show, id)

      conn = get(conn, Routes.task_status_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Task status"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.task_status_path(conn, :create), task_status: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Task status"
    end
  end

  describe "edit task_status" do
    setup [:create_task_status]

    test "renders form for editing chosen task_status", %{conn: conn, task_status: task_status} do
      conn = get(conn, Routes.task_status_path(conn, :edit, task_status))
      assert html_response(conn, 200) =~ "Edit Task status"
    end
  end

  describe "update task_status" do
    setup [:create_task_status]

    test "redirects when data is valid", %{conn: conn, task_status: task_status} do
      conn = put(conn, Routes.task_status_path(conn, :update, task_status), task_status: @update_attrs)
      assert redirected_to(conn) == Routes.task_status_path(conn, :show, task_status)

      conn = get(conn, Routes.task_status_path(conn, :show, task_status))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, task_status: task_status} do
      conn = put(conn, Routes.task_status_path(conn, :update, task_status), task_status: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Task status"
    end
  end

  describe "delete task_status" do
    setup [:create_task_status]

    test "deletes chosen task_status", %{conn: conn, task_status: task_status} do
      conn = delete(conn, Routes.task_status_path(conn, :delete, task_status))
      assert redirected_to(conn) == Routes.task_status_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.task_status_path(conn, :show, task_status))
      end
    end
  end

  defp create_task_status(_) do
    task_status = task_status_fixture()
    %{task_status: task_status}
  end
end
