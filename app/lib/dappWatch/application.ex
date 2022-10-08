defmodule DappWatch.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      DappWatch.Repo,
      # Start the Telemetry supervisor
      DappWatchWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: DappWatch.PubSub},
      # Start the Endpoint (http/https)
      DappWatchWeb.Endpoint,
      # Start a worker by calling: DappWatch.Worker.start_link(arg)
      # {DappWatch.Worker, arg}
      # DappWatch.Eth.Scanner
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: DappWatch.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    DappWatchWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
