# DappWatch

Watch what happens in Dapps

## Blockchains

- Ethereum (Goerli)

## Logs

```bash
sudo nano /etc/systemd/system/geth.service
sudo systemctl daemon-reload
sudo systemctl start geth.service
sudo systemctl status geth.service
sudo systemctl enable geth.service
sudo journalctl -f -u geth.service -o cat | ccze -A
```

```bash
sudo nano /etc/systemd/system/lighthousebeacon.service
sudo systemctl daemon-reload
sudo systemctl start lighthousebeacon.service
sudo systemctl status lighthousebeacon.service
sudo systemctl enable lighthousebeacon.service
sudo journalctl -f -u lighthousebeacon.service -o cat | ccze -A
```

## Docker

```
docker run -t -p 8080:8545 goerli
docker run -it goerli /bin/bash
```

## Ecto

```
mix ecto.create         # Создать хранилище для репозитория.
mix ecto.drop           # Удалить хранилище для репозитория.
mix ecto.gen.migration  # Сгенерировать новую миграцию для репозитория.
mix ecto.gen.repo       # Сгенерировать новый репозиторий.
mix ecto.migrate        # Запустить миграции для репозитория.
mix ecto.rollback       # Откатить миграции из репозитория.
```

## Source

- https://github.com/mana-ethereum/ethereumex 
- https://github.com/izelnakri/eth
- https://github.com/agro1986/caustic
- https://github.com/alexfilatov/near-api-ex
- https://github.com/mcvnh/tradehub-elixir 
- https://github.com/mana-ethereum/ex_rlp