pipeline {
    agent any

    environment {
        AMI_PLACEHOLDER = ''
        INSTANCE_TYPE_PLACEHOLDER = ''
        KEY_PAIR_NAME_PLACEHOLDER = ''
        SUBNET_ID_PLACEHOLDER = ''
        STORAGE_SIZE_PLACEHOLDER = 0
        STORAGE_TYPE_PLACEHOLDER = ''
        USER_DATA_PATH_PLACEHOLDER = ''
        INSTANCE_COUNT_PLACEHOLDER = 0
        BUCKET_NAME_PLACEHOLDER = ''
        KMS_KEY_ID_PLACEHOLDER = ''
        TERRAFORM_APPLY_CONFIRMATION = ''
    }

    stages {
        stage('User Input') {
            steps {
                script {
                    // Gather user input for all variables
                    userInputAMI = input(
                        id: 'userInputAMI',
                        message: 'Enter AMI ID:',
                        parameters: [string(defaultValue: '', description: 'AMI ID')]
                    )

                    userInputInstanceType = input(
                        id: 'userInputInstanceType',
                        message: 'Enter instance type:',
                        parameters: [string(defaultValue: '', description: 'Instance type')]
                    )

                    userInputKeyPairName = input(
                        id: 'userInputKeyPairName',
                        message: 'Enter key pair name:',
                        parameters: [string(defaultValue: '', description: 'Key pair name')]
                    )

                    userInputSubnetID = input(
                        id: 'userInputSubnetID',
                        message: 'Enter subnet ID:',
                        parameters: [string(defaultValue: '', description: 'Subnet ID')]
                    )

                    userInputStorageSize = input(
                        id: 'userInputStorageSize',
                        message: 'Enter storage size (GiB):',
                        parameters: [string(defaultValue: '0', description: 'Storage size')]
                    )

                    userInputStorageType = input(
                        id: 'userInputStorageType',
                        message: 'Enter storage type:',
                        parameters: [string(defaultValue: '', description: 'Storage type')]
                    )

                    userInputUserDataPath = input(
                        id: 'userInputUserDataPath',
                        message: 'Enter user data script path:',
                        parameters: [string(defaultValue: '', description: 'User data script path')]
                    )

                    userInputInstanceCount = input(
                        id: 'userInputInstanceCount',
                        message: 'Enter number of instances:',
                        parameters: [string(defaultValue: '0', description: 'Number of instances')]
                    )

                    userInputBucketName = input(
                        id: 'userInputBucketName',
                        message: 'Enter bucket name for tf.state file:',
                        parameters: [string(defaultValue: '', description: 'Bucket name')]
                    )

                    userInputKMSKeyID = input(
                        id: 'userInputKMSKeyID',
                        message: 'Enter KMS key ID for encryption of the statefile:',
                        parameters: [string(defaultValue: '', description: 'KMS key ID')]
                    )

                    // Set environment variables
                    env.AMI_PLACEHOLDER = userInputAMI
                    env.INSTANCE_TYPE_PLACEHOLDER = userInputInstanceType
                    env.KEY_PAIR_NAME_PLACEHOLDER = userInputKeyPairName
                    env.SUBNET_ID_PLACEHOLDER = userInputSubnetID
                    env.STORAGE_SIZE_PLACEHOLDER = userInputStorageSize.toInteger()
                    env.STORAGE_TYPE_PLACEHOLDER = userInputStorageType
                    env.USER_DATA_PATH_PLACEHOLDER = userInputUserDataPath
                    env.INSTANCE_COUNT_PLACEHOLDER = userInputInstanceCount.toInteger()
                    env.BUCKET_NAME_PLACEHOLDER = userInputBucketName
                    env.KMS_KEY_ID_PLACEHOLDER = userInputKMSKeyID
                }
            }
        }

        stage('Run sed command on main.tf') {
            steps {
                script {
                    sh """
                        sed -i "s/var\.ami/${AMI_PLACEHOLDER}/g" main.tf
                        sed -i "s/var\.instance_type/${INSTANCE_TYPE_PLACEHOLDER}/g" main.tf
                        sed -i "s/var\.key_pair_name/${KEY_PAIR_NAME_PLACEHOLDER}/g" main.tf
                        sed -i "s/var\.subnet_id/${SUBNET_ID_PLACEHOLDER}/g" main.tf
                        sed -i "s/var\.instance_count/${INSTANCE_COUNT_PLACEHOLDER}/g" main.tf
                        sed -i "s/var\.storage_type/${STORAGE_TYPE_PLACEHOLDER}/g" main.tf
                        sed -i "s/var\.storage_size/${STORAGE_SIZE_PLACEHOLDER}/g" main.tf
                        sed -i "s/var\.user_data_path/${USER_DATA_PATH_PLACEHOLDER}/g" main.tf
                        sed -i "s/var\.bucket_name/${BUCKET_NAME_PLACEHOLDER}/g" main.tf
                        sed -i "s/var\.kms_key_id/${KMS_KEY_ID_PLACEHOLDER}/g" main.tf
                    """
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    sh 'rm -rf .terraform'
                    sh 'terraform init'
                    sh 'terraform plan -out=tfplan'
                }
            }
        }

        stage('User Input for Apply') {
            steps {
                script {
                    userInputApplyConfirmation = input(
                        id: 'userInputApplyConfirmation',
                        message: 'Do you want to apply the changes? (yes/no):',
                        parameters: [string(defaultValue: 'no', description: 'Apply confirmation')]
                    )

                    env.TERRAFORM_APPLY_CONFIRMATION = userInputApplyConfirmation.toLowerCase()
                }
            }
        }

        stage('Terraform Apply') {
            when {
                expression { env.TERRAFORM_APPLY_CONFIRMATION == 'yes' }
            }
            steps {
                script {
                    sh 'terraform apply tfplan'
                }
            }
        }

    }
}
