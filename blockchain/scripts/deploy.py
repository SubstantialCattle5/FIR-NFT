import time

from brownie import lottery, config, network, accounts
from scripts.common import get_account, get_contract, fund_with_link


def deploy():
    account = get_account()

    lottery_deploy = lottery.deploy(get_contract("eth_usd_price_feed").address,
                                    get_contract("vrf_coordinator").address,
                                    get_contract("link_token").address,
                                    config['networks'][network.show_active()]['fee'],
                                    config['networks'][network.show_active()]['keyhash'],
                                    {
                                        "from": account
                                    },
                                    publish_source=config['networks'][network.show_active()].get("verify", False)
                                    )


def start_lottery():
    account = get_account()
    lottery_deployed = lottery[-1]
    starting_tx = lottery_deployed.startLottery({
        "from": account
    })
    starting_tx.wait(1)
    print("Lottery Started!")


def entry_lottery():
    account = get_account()
    lottery_deployed = lottery[-1]  # grabbing the latest lottery
    money = lottery_deployed.getEntranceFee() + 100000000
    tx = lottery_deployed.enter({
        "from": account,
        "value": money
    })
    tx.wait(1)
    print("You entered the lottery!")


def end_lottery():
    """
    funding the contract  with link
    calling the end lottery function
    displaying who won

    :return:
        none
    """
    account = get_account()
    lottery_deployed = lottery[-1]
    tx = fund_with_link(lottery_deployed.address)
    ending_transaction = lottery_deployed.endLottery({
        "from": account
    })
    ending_transaction.wait(1)
    time.sleep(60)
    print(f"{lottery_deployed.recentWinner()} is the new Winner!")


def main():
    deploy()
    start_lottery()
    entry_lottery()
    end_lottery()
