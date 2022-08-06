# 0.019
# 1900000000000000000000000

from brownie import accounts, lottery, config, network
from web3 import Web3


def test_get_entrance_fee():
    account = accounts[0]
    lottery_deploy = lottery.deploy(config["networks"][network.show_active()]["eth_usd_price_fee"], {
        "from": account
    })
    assert lottery_deploy.getEntranceFee() > Web3.toWei(0.0018, "ether")
