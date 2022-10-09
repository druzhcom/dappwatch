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

  alias DappWatch.Eth.Db.Block
  alias DappWatch.Repo
  import Ecto.Query, only: [from: 2]

  def start_link(opts) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  def get_block_by_number(block_number) do
    # TODO block_number from STRING to hex, FROM int to hex
    # TODO block_number = Ethereumex.HttpClient.eth_block_number()
    block_info = Ethereumex.HttpClient.eth_get_block_by_number(block_number, true)
    IO.inspect(block_info)
  end

  def add_block(block_number) do
    GenServer.cast(__MODULE__, {:add_block, block_number})
  end

  def get_all_blocks() do
    GenServer.call(__MODULE__, {:lookup_all_blocks})

  end

  @impl true
  def init(:ok) do
    {:ok, %{}}
  end

  @impl true
  def handle_call({:lookup_all_blocks}, _from, _block_numbers) do
    query =
      Ecto.Query.from(
        b in Block,
        select: b.block_hash
      )

    block_info = Repo.all(query)

    {:reply, block_info}
  end

  @impl true
  def handle_cast({:add_block, block_number}, _blocks) do
    # if Map.has_key?(blocks, block_number) do
    #   {:noreply, block_numbers}
    # else
    block_info = get_block_by_number(block_number)

    changeset =
      Block.changeset(%Block{}, %{
        block_number: block_info.number,
        block_hash: block_info.hash
      })

    result =
      case Repo.update(changeset) do
        {:ok, block} -> IO.inspect("Block added: #{block}")
        {:error, changeset} -> IO.inspect("Error with add_block: #{changeset}")
      end

    {:noreply, result}
    # end
  end

  # GenServer.code_change/3 (function)
  # * GenServer.format_status/2 (function)
  # * GenServer.handle_continue/2 (function)
  # * GenServer.handle_info/2 (function)
  # * GenServer.terminate/2 (function)Elixir
end
