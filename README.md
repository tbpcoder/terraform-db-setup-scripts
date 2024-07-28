# Multi-Instance and Single-Instance Setup

This repository contains configurations and scripts for setting up databases in either multi-instance or single-instance modes using Terraform.

## Folder Structure

### `multi-instance`
This folder contains configurations for setting up databases in separate instances.

#### Steps:
1. Initialize the variables in `terraform.tfvars`.
2. Update the bucket in `state_files_store.tf` to store the state file.
3. Run `terraform plan` and `terraform apply`.

### `scripts_files`
This folder contains script files to be provided as user data while creating instances. These scripts are for basic setup and can be improvised as needed.

### `single_instance`
This folder contains configurations for setting up all databases in a single instance.

#### Steps:
1. Follow the same process as the multi-instance setup.

## Jenkinsfile
A Jenkinsfile is provided to automate the process, although it is not complete. Feel free to review and modify it as needed.

## Getting Started

1. **Clone the repository:**
    ```sh
    git clone <repository-url>
    cd <repository-directory>
    ```

2. **Navigate to the desired setup folder:**
    ```sh
    cd multi-instance
    # or
    cd single_instance
    ```

3. **Initialize Terraform:**
    ```sh
    terraform init
    ```

4. **Update the necessary variables and configurations:**
    - Edit `terraform.tfvars` to set the required variables.
    - Update the `state_files_store.tf` with the appropriate bucket for storing the state file (for multi-instance setup).

5. **Plan and apply the Terraform configuration:**
    ```sh
    terraform plan
    terraform apply
    ```

6. **Review and customize the scripts in `scripts_files` as needed.**

## Contributing
Feel free to contribute to this project by opening issues or submitting pull requests.

---

Happy Coding!
