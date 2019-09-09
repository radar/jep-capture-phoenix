defmodule CaptureWeb.ResponseControllerTest do
  use CaptureWeb.ConnCase

  alias Capture.Surveys.Response

  alias Capture.Repo

  @create_attrs %{
    question_id: 42,
    survey_id: 42,
    user_id: 42,
    value: 1,
  }

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "POST /api/responses, with no existing response" do
    test "creates a new response", %{conn: conn} do
      conn = post(conn, "/api/responses", @create_attrs)
      assert %{"data" => %{"id" => id}} = json_response(conn, 201)
    end
  end

  describe "POST /api/responses, with an existing response" do
    setup do
      {:ok, response} = %Response{
        survey_id: 42,
        question_id: 42,
        user_id: 42,
        value: 5,
      } |> Repo.insert
      {:ok, response: response}
    end

    test "creates a new response", %{conn: conn, response: response} do
      conn = post(conn, "/api/responses", @create_attrs)
      assert %{"data" => %{"id" => id}} = json_response(conn, 201)
      assert id == response.id
    end
  end
end
