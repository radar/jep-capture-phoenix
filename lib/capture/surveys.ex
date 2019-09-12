defmodule Capture.Surveys do
  @moduledoc """
  The Surveys context.
  """

  import Ecto.Query, warn: false
  alias Capture.Repo

  alias Capture.Surveys.Response

  def handle_response(params) do
    find_response(params)
    |> case do
      nil ->
        create_response(params)
      response ->
        update_response(response, params)
      end
    end


  @doc """
  Creates a response.

  ## Examples

      iex> create_response(%{field: value})
      {:ok, %Response{}}

      iex> create_response(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_response(attrs \\ %{}) do
    %Response{}
    |> Response.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a response.

  ## Examples

      iex> update_response(response, %{field: new_value})
      {:ok, %Response{}}

      iex> update_response(response, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_response(%Response{} = response, attrs) do
    response
    |> Response.changeset(attrs)
    |> Repo.update()
  end

  def find_response(%{
    "survey_id" => survey_id,
    "question_id" => question_id,
    "user_id" => user_id
  }) do
    Response
    |> where(
      survey_id: ^survey_id,
      question_id: ^question_id,
      user_id: ^user_id
    )
    |> Repo.one
  end

  # responses = A pre-built query
  # OR
  # responses = the `Response` struct
  def filter_responses(responses, params) do
    responses
    |> filter_responses_query(params)
    |> Repo.all
  end

  def filter_responses_query(responses, %{"survey_id" => survey_id, "question_id" => question_id, "demographic_ids" => demographic_ids} = params) do
    responses
    |> filter_responswes_query(params |> Map.take(["survey_id", "question_id"]))

  end

  def filter_responses_query(responses, %{"survey_id" => survey_id, "question_id" => question_id}) do
    responses
    |> filter_responses_query(%{"survey_id" => survey_id})
    |> where(question_id: ^question_id)
  end

  def filter_responses_query(responses, %{"survey_id" => survey_id}) do
    responses
    |> where(survey_id: ^survey_id)
  end
end
