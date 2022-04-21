defmodule InClassExerciseWeb.AssignmentStatusControllerTest do
  use InClassExerciseWeb.ConnCase

  import InClassExercise.AssignmentsFixtures

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  describe "index" do
    test "lists all assignment_statuses", %{conn: conn} do
      conn = get(conn, Routes.assignment_status_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Assignment statuses"
    end
  end

  describe "new assignment_status" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.assignment_status_path(conn, :new))
      assert html_response(conn, 200) =~ "New Assignment status"
    end
  end

  describe "create assignment_status" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.assignment_status_path(conn, :create), assignment_status: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.assignment_status_path(conn, :show, id)

      conn = get(conn, Routes.assignment_status_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Assignment status"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.assignment_status_path(conn, :create), assignment_status: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Assignment status"
    end
  end

  describe "edit assignment_status" do
    setup [:create_assignment_status]

    test "renders form for editing chosen assignment_status", %{conn: conn, assignment_status: assignment_status} do
      conn = get(conn, Routes.assignment_status_path(conn, :edit, assignment_status))
      assert html_response(conn, 200) =~ "Edit Assignment status"
    end
  end

  describe "update assignment_status" do
    setup [:create_assignment_status]

    test "redirects when data is valid", %{conn: conn, assignment_status: assignment_status} do
      conn = put(conn, Routes.assignment_status_path(conn, :update, assignment_status), assignment_status: @update_attrs)
      assert redirected_to(conn) == Routes.assignment_status_path(conn, :show, assignment_status)

      conn = get(conn, Routes.assignment_status_path(conn, :show, assignment_status))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, assignment_status: assignment_status} do
      conn = put(conn, Routes.assignment_status_path(conn, :update, assignment_status), assignment_status: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Assignment status"
    end
  end

  describe "delete assignment_status" do
    setup [:create_assignment_status]

    test "deletes chosen assignment_status", %{conn: conn, assignment_status: assignment_status} do
      conn = delete(conn, Routes.assignment_status_path(conn, :delete, assignment_status))
      assert redirected_to(conn) == Routes.assignment_status_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.assignment_status_path(conn, :show, assignment_status))
      end
    end
  end

  defp create_assignment_status(_) do
    assignment_status = assignment_status_fixture()
    %{assignment_status: assignment_status}
  end
end
