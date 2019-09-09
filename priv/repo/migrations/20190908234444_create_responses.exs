defmodule Capture.Repo.Migrations.CreateResponses do
  use Ecto.Migration

  def change do
    create table(:responses) do
      add :survey_id, :integer
      add :question_id, :integer
      add :user_id, :integer
      add :value, :integer

      timestamps()
    end

  end
end
