Mongo setup:-
    
    If services is not running:
        # sudo systemctl start mongod

    Run mongo shell
        # mongosh

    port: 27017

Mysql setup:-

    Command for changing root password: 
        # sudo mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'Your_Password';"
    
    Secure installation command:
        # sudo mysql_secure_installation
        and fill the prompts as desired
    
    To change authentication method
        # sudo mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH auth_socket;"

    Run mysql shell
        # mysql -u root -p YourPassword

    # port: 3306

Postgresql setup:-

    Command to run shell
        # sudo -i -u postgres
        # psql

    port: 5432

Scylla setup:- 

    Configure the following parameters in the /etc/scylla/scylla.yaml configuration file.
    # cluster_name, seeds, listen_address, rpc_address

    Command for scylla setup
        # sudo scylla_setup
    # The script invokes a set of scripts to configure several operating system settings; for example, it sets RAID0 and XFS filesystem.

    Command to run scyllaDB service
        # sudo systemctl start scylla-server

    Command to run command line
        # cqlsh

    # port: 9042