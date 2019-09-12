defmodule Capture.Repo.Migrations.CreateDemographics do
  use Ecto.Migration

  def change do
    create table(:demographics) do
      add :name, :string
      add :value, :string
    end
  end
end
