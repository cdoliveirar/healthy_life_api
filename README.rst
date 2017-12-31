|Wercker| |license|

:Version: 0.0.0
:Web: gitlab.com:healthy_life/api
:Download: gitlab.com:healthy_life/api
:Source: gitlab.com:healthy_life/api
:Keywords: api

.. contents:: Table of Contents:
    :local:

healthy life
============

A chatbot to make delivery for restaurants.
`healthy_life_api.com <https://healthy_life_api.com>`__

Requirements
------------

This is a list of applications that need to be installed previously to
enjoy all the goodies of this configuration:

-  `Python 3.6.1`_
-  `Docker`_
-  `Docker Compose`_


Flight To Infinity... and Beyond
--------------------------------

First, we need to install some requiments inside a virtualenv and then
we have to build and run up all the services. Then we need to migrate
our database and create a super user in order to acced the admin
(http://localhost/admin/).

.. code:: bash

    $ make setup
    $ make docker.build
    $ make django command=migrate

-  Do not forget to stop your postgresql service if this is running on
   the 5432 port.

Then, we run a local development server doing this.

.. code:: bash

    $ make django.runserver

In order to run the shell of Django we need to run this.

.. code:: bash

    $ make django command=shell

Or another command, without any argument.

::

    $ make django command={another command}

In order to delete your database and create another one we need to enter
the container doing something like this:

.. code:: bash

    λ docker ps  # We need to identify the container_id.
    λ docker exec -it {posgis_container_id} bash
    λ dropdb $POSTGRES_DB -U $POSTGRES_USER
    λ createdb $POSTGRES_DB -U $POSTGRES_USER
    λ psql $POSTGRES_DB -U $POSTGRES_USER
    λ cat healthy_life.sql|docker exec -i 61285943fe09 psql -U postgres -d healthy_life
    
Deployment
----------

Execute command

.. code:: bash

    $ make setup
    $ make ansible.update env=prod
    $ make ansible.deploy env=prod

License
*******

GNU

Changelog
*********

Please see `CHANGELOG`_ for more information what
has changed recently.

Contributing
************

Please see `CONTRIBUTING`_ for details.

Credits
*******

-  `CONTRIBUTORS`_

Made with :evil: ️:coffee:️ and :pizza: by `company`_.

.. |Wercker| image:: https://app.wercker.com/status/d6c8b1c4dcca13b2915d998e3f11eca5/s/
  :target: https://app.wercker.com/project/byKey/d6c8b1c4dcca13b2915d998e3f11eca5
  :alt: wercker status
.. |license| image:: https://img.shields.io/github/license/mashape/apistatus.svg?style=flat-square
  :target: LICENSE
  :alt: License

.. Links
.. _`CHANGELOG`: CHANGELOG.rst
.. _`CONTRIBUTORS`: AUTHORS.rst
.. _`CONTRIBUTING`: CONTRIBUTING.rst


.. _`company`: https://github.com/healthy_life_api
.. dependences
.. _`Python 3.6.1`: https://www.python.org/downloads/release/python-361
.. _`Docker`: https://www.docker.com/
.. _`Docker Compose`: https://docs.docker.com/compose/

