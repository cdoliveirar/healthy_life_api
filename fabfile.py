__author__ = 'baudelaire'
from fabric.api import *
from fabric.colors import green

env.user = 'ubuntu'
env.host_string = '165.227.54.123'
env.password = 'fleursdumal123'
home_path = "/home/ubuntu"
settings = "--settings='midoc.settings_prod'"
activate_env = "source {}/midocenv/bin/activate".format(home_path)
manage = "python manage.py"


def requirements():
    print("Beginning Deploy:")
    with cd("{}/midoc".format(home_path)):
        run("git pull origin master")
        run("{} && pip install -r requirements.txt".format(activate_env))
    print(green("requirements ok"))

def deploy():
    print("Beginning Deploy:")
    with cd("{}/midoc/src".format(home_path)):
        run("git pull origin master")
        run("{} && {} collectstatic --noinput {}".format(activate_env, manage,
                                                         settings))
        run("{} && {} migrate {}".format(activate_env, manage, settings))
        sudo("service nginx restart", pty=False)
        sudo("service supervisor restart", pty=False)
    print(green("Deploy socios successful"))


def createsuperuser():
    with cd("{}/midoc/src".format(home_path)):
        run("{} && {} createsuperuser {}".format(activate_env, manage,
                                                 settings))
    print(green("Createsuperuser successful"))