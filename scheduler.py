import sys
import os
import glob
import schedule
import subprocess
import shutil
from datetime import datetime
import schedule
import time

files = glob.glob('../likelihood-implementation/chains/*7cosmo*progress')
def copyfiles():
    for f in files:
        shutil.copy(f, './')

def run(*args):
    return subprocess.check_call(['git'] + list(args))

def commit(add_all=False):
    #message = input("\nType in your commit message: ")
    #commit_message = f'{message}'
    now = datetime.now()
    currtime = now.strftime("%d/%m/%Y %H:%M:%S")
    if add_all:
        run('add', '--all')
    run("commit", "-am", "Current time: "+currtime)
    run("push")

def job():
    copyfiles()
    commit(add_all=True)

schedule.every(0.5).hours.do(job)
print("Job scheduled")

while True:
    schedule.run_pending()
    time.sleep(1)

