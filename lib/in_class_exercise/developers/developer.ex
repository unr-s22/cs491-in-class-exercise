defmodule InClassExercise.Developers.Developer do
  use Ecto.Schema
  import Ecto.Changeset
  alias InClassExercise.Developers.Area

  schema "developers" do
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    belongs_to :area, Area
    has_many :assignments, InClassExercise.Assignments.Assignment
    timestamps()
  end

  @doc false
  def changeset(developer, attrs) do
    developer
    |> cast(attrs, [:last_name, :first_name, :email, :area_id])
    |> validate_required([:last_name, :first_name, :email, :area_id])
  end
end
