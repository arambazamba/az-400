# YAML Resources

[About resources for Azure Pipelines](https://learn.microsoft.com/en-us/azure/devops/pipelines/process/about-resources?view=azure-devops&tabs=yaml)

## Demos 

 - Create and use variable groups in Azure Pipelines
 - Use multiple repos in a pipeline

## Create and use variable groups in Azure Pipelines

Execute `create-variable-group.azcli`:

```bash
az pipelines variable-group create --name az400-variables --variables node-version=14x app-name=food-app --output yaml
```

Examine in Azure DevOps and use in pipeline `use-var-grp.yml`:

## Use mulitple repos in a pipeline

