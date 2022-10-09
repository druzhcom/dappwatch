defmodule DappWatchWeb.RandomController do
  use DappWatchWeb, :controller

  def index(conn, _params) do
    send_resp(conn, 200, "hello world")
  end
end
