# Node based Azure Function Deployment using yaml

- Implements Typescript based DoDouble Function
- Multistage Pipeline with build, provision and deployment

Source Code located at [https://github.com/arambazamba/func-devops](https://github.com/arambazamba/func-devops)

- Execute Provisioning Script

    ```bash
    env=$RANDOM
    grp=az400-funcapp-$env
    loc=westeurope
    app=func-devops-$env
    storage=funcdevops$env

    az group create -n $grp -l $loc

    az storage account  create -n $storage -g $grp --sku Standard_LRS

    az functionapp create -n $app -g $grp --storage-account $storage --consumption-plan-location $loc --runtime node --runtime-version 14 --functions-version 4
    ```

- Create ARM Service Connection to resource group

- Pipeline to import / execute: `func-cicd.yaml`