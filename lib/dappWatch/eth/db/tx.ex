defmodule DappWatch.Eth.Db.Tx do
  use Ecto.Schema

  import Ecto.Changeset

  # weather is the DB table
  schema "tx" do
    field(:tx_hash, :string)
    field(:tx_data, :string)
    belongs_to(:block, DappWath.Eth.Db.Block)
  end

  def changeset(tx_info, params \\ %{}) do
    tx_info
    |> cast(params, [:tx_hash, :tx_data])
    |> validate_required([:tx_hash, :tx_data])

    # |> validate_format(:email, ~r/@/)
    # |> validate_inclusion(:age, 18..100)
  end
end
