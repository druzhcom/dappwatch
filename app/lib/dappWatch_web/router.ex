defmodule DappWatchWeb.Router do
  use DappWatchWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", DappWatchWeb do
    pipe_through :api

    get "/random", RandomController, :index
  end
end
