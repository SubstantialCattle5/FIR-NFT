import time

from brownie import FIR , config, network, accounts
from scripts.common import get_account


def deploy():
    account = get_account()
    FIR.deploy({
        'from' : account
    })
def main():
    deploy()
