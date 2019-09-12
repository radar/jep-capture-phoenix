defmodule Capture.Repo.Migrations.CreateDemographicsResponsesTable do
  use Ecto.Migration

  def change do
    create table(:demographics_responses) do
      add :response_id, references(:responses)
      add :demographic_id, references(:demographics)
    end

    create unique_index(:demographics_responses, [:response_id, :demographic_id])
  end
end
