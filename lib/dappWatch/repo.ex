defmodule DappWatch.Repo do
  use Ecto.Repo,
    otp_app: :dappWatch,
    adapter: Ecto.Adapters.Postgres
end
