#!/usr/bin/env python

from python_hosts import Hosts, HostsEntry
import json
import os
import yaml


def main():
    hostentries = []

    if os.environ['USER'] == "root":
        user = os.environ['SUDO_USER']
    else:
        user = os.environ['USER']

    with open("/Users/{}/.vagrant.d/data/machine-index/index".format(user), "r") as rawindex:
        currentvagrants = json.load(rawindex)

    for machine in currentvagrants['machines']:
        currentvagrants['machines'][machine]['machineprovider'] = currentvagrants['machines'][machine]['extra_data']['box']['provider']
        with open("{local_data_path}/machines/{name}/{machineprovider}/vm".format(**currentvagrants['machines'][machine]), "r") as vmraw:
            vmdetails = yaml.load(vmraw)
            name = currentvagrants['machines'][machine]['name']
            hostentries.append(HostsEntry(entry_type="ipv4", address=vmdetails['host'], names=["{}.vagrant.skytap.com".format(name), name, "vagrant"]))
            print("Updating host entry: {} with address: {}".format(name, vmdetails['host']))


    hosts = Hosts("/private/etc/hosts")
    hosts.remove_all_matching(name="vagrant")

    hosts.add(hostentries)

    hosts.write()

if __name__ == "__main__":
    main()
