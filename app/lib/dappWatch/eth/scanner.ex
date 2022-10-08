defmodule DappWatch.Eth.Scanner do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  # проходим с нулевого блока
  # берем блок по номеру - номер обрабатываемого блока записываем в базу полсе обработк
  # смотрим все транзакции
  # получем адреса
  # понимаем где адрес смарт-контракта
  # записываем в базу - адрес смарт-контракта + номер лока
  # запрашиваем баланс смарт-контракта

  use GenServer

  def start do
  end

  @impl true
  def init({}) do
  end

  def get_block_by_number(block_number) do
    # block_number from STRING to hex, FROM int to hex
    block_number = Ethereumex.HttpClient.eth_block_number()
    block_info = Ethereumex.HttpClient.eth_get_block_by_number(block_number, true)
    IO.inspect(block_info)
  end

  # GenServer.code_change/3 (function)
  # * GenServer.format_status/2 (function)
  # * GenServer.handle_call/3 (function)
  # * GenServer.handle_cast/2 (function)
  # * GenServer.handle_continue/2 (function)
  # * GenServer.handle_info/2 (function)
  # * GenServer.terminate/2 (function)Elixir
end
