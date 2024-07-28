Folder structure:
multi-instance: 
    -> For separate DB in separate instances
    steps:-
        1) Initialize the variables in terraform.tfvars
        2) change the bucket in state_files_store.tf for storing the state file
        3) terraform plan and apply
scripts_files:
    -> Script files to be profided as user data while instance creating. It is basic setup so feel free to improvise.
single_instance:
    -> All DB setup in a single instance
    steps:-
        1) same process as multi-instance

Jenkinsfile to automate the process but its not complete for now. 
Feel free to check it out.