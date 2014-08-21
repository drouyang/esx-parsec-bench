from fabric.api import *

env.user="ouyang"

def list_hosts():
    print env.hosts

def cmd(cmd):
    run(cmd)

def ping():
    run("hostname")

def serial_cmd(cmd):
    run(cmd)

def sudo_cmd(cmd):
    sudo(cmd)
