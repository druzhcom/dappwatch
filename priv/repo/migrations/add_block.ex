defmodule DappWatch.Repo.Migrations.AddBlock do
  use Ecto.Migration

  def change do
    create table(:blocks) do
      add(:block_number, :string, unique: true)
      add(:block_hash, :string, unique: true)

      timestamps
    end

    create(unique_index(:blocks, [:block_number], name: :unique_block_numbers))
  end
end
