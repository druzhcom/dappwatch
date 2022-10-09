defmodule DappWatch.Eth.Db.Block do
  use Ecto.Schema
  import Ecto.Changeset
  alias DappWath.Eth.Db.Tx

  schema "blocks" do
    field(:block_number, :string)
    field(:block_hash, :string)
    has_many(:tx, Tx)
  end

  @required_fields ~w(block_number block_hash)
  # @optional_fields ~w()

  def changeset(block, params \\ %{}) do
    block
    |> cast(params, @required_fields)
    |> validate_required([:block_number, :block_hash])
    # |> validate_format(:email, ~r/@/)
    # |> validate_inclusion(:age, 18..100)
  end
end
