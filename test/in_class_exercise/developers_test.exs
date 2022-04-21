defmodule InClassExercise.DevelopersTest do
  use InClassExercise.DataCase

  alias InClassExercise.Developers

  describe "areas" do
    alias InClassExercise.Developers.Area

    import InClassExercise.DevelopersFixtures

    @invalid_attrs %{name: nil}

    test "list_areas/0 returns all areas" do
      area = area_fixture()
      assert Developers.list_areas() == [area]
    end

    test "get_area!/1 returns the area with given id" do
      area = area_fixture()
      assert Developers.get_area!(area.id) == area
    end

    test "create_area/1 with valid data creates a area" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Area{} = area} = Developers.create_area(valid_attrs)
      assert area.name == "some name"
    end

    test "create_area/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Developers.create_area(@invalid_attrs)
    end

    test "update_area/2 with valid data updates the area" do
      area = area_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Area{} = area} = Developers.update_area(area, update_attrs)
      assert area.name == "some updated name"
    end

    test "update_area/2 with invalid data returns error changeset" do
      area = area_fixture()
      assert {:error, %Ecto.Changeset{}} = Developers.update_area(area, @invalid_attrs)
      assert area == Developers.get_area!(area.id)
    end

    test "delete_area/1 deletes the area" do
      area = area_fixture()
      assert {:ok, %Area{}} = Developers.delete_area(area)
      assert_raise Ecto.NoResultsError, fn -> Developers.get_area!(area.id) end
    end

    test "change_area/1 returns a area changeset" do
      area = area_fixture()
      assert %Ecto.Changeset{} = Developers.change_area(area)
    end
  end

  describe "developers" do
    alias InClassExercise.Developers.Developer

    import InClassExercise.DevelopersFixtures

    @invalid_attrs %{email: nil, first_name: nil, last_name: nil}

    test "list_developers/0 returns all developers" do
      developer = developer_fixture()
      assert Developers.list_developers() == [developer]
    end

    test "get_developer!/1 returns the developer with given id" do
      developer = developer_fixture()
      assert Developers.get_developer!(developer.id) == developer
    end

    test "create_developer/1 with valid data creates a developer" do
      valid_attrs = %{email: "some email", first_name: "some first_name", last_name: "some last_name"}

      assert {:ok, %Developer{} = developer} = Developers.create_developer(valid_attrs)
      assert developer.email == "some email"
      assert developer.first_name == "some first_name"
      assert developer.last_name == "some last_name"
    end

    test "create_developer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Developers.create_developer(@invalid_attrs)
    end

    test "update_developer/2 with valid data updates the developer" do
      developer = developer_fixture()
      update_attrs = %{email: "some updated email", first_name: "some updated first_name", last_name: "some updated last_name"}

      assert {:ok, %Developer{} = developer} = Developers.update_developer(developer, update_attrs)
      assert developer.email == "some updated email"
      assert developer.first_name == "some updated first_name"
      assert developer.last_name == "some updated last_name"
    end

    test "update_developer/2 with invalid data returns error changeset" do
      developer = developer_fixture()
      assert {:error, %Ecto.Changeset{}} = Developers.update_developer(developer, @invalid_attrs)
      assert developer == Developers.get_developer!(developer.id)
    end

    test "delete_developer/1 deletes the developer" do
      developer = developer_fixture()
      assert {:ok, %Developer{}} = Developers.delete_developer(developer)
      assert_raise Ecto.NoResultsError, fn -> Developers.get_developer!(developer.id) end
    end

    test "change_developer/1 returns a developer changeset" do
      developer = developer_fixture()
      assert %Ecto.Changeset{} = Developers.change_developer(developer)
    end
  end
end
