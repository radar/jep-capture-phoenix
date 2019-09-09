defmodule Capture.Repo do
  use Ecto.Repo,
    otp_app: :responses,
    adapter: Ecto.Adapters.Postgres
end
