defmodule JM.Repo do
  use Ecto.Repo,
    otp_app: :jm_repo,
    adapter: Ecto.Adapters.Postgres
end
