#!/usr/bin/env python3
import os
import re
import sys
import argparse

try:
        import json
except ImportError:
        import simplejson as json


class DymanicInventory():
    def __init__(self):
        self.inventory = {}
        self.get_cli_args()

        #Если мы вызываем скрипт с параметром '--list'
        if self.args.list:
            #Выполняется генерация dynamic_json_inventory, параметры для генерации файла берутся из значений 'terraform output'
            self.inventory = self.exist_inventory()
        elif self.args.host:
            # Not implemented, since we return _meta info `--list`.
            self.inventory = self.empty_inventory()
        else:
            self.inventory = self.empty_inventory()
        print(json.dumps(self.inventory))

    def empty_inventory(self):
        return {"_meta": {"hostvars": {}}}

    def exist_inventory(self):
        terr_out_hosts = os.popen('cd .. && cd terraform/stage && terraform output').read().replace("\"", "")
        temp_list = terr_out_hosts.split("\n")
        temp_list.pop()
        ansible_hosts = dict(re.sub(" ", "", item).split("=") for item in temp_list)
        hosts_list = list(ansible_hosts.keys())
        dynamic_json = {}

        for key in hosts_list:
            dynamic_json[key] = {
                "hosts": [ansible_hosts.pop(key)],
                "vars": {"example_variable": "Test var = " + key}
            }
            dynamic_json["_meta"] = {
                "hostvars": {"example_host_var": "Test var = " + key}
            }
        return dynamic_json

    def get_cli_args(self):
        parser = argparse.ArgumentParser()
        parser.add_argument('--list', action="store_true")
        parser.add_argument('--host', action="store")
        self.args = parser.parse_args()

    def get_tr_out_hosts(self):
        hosts = os.popen('cd .. && cd terraform/stage && terraform output').read()
        temp_list = hosts.split("\n")
        temp_list.pop()
        self.yc_created_hosts = dict(item.split("=") for item in temp_list)


DymanicInventory()
