# Azure Artifacts

[Artifacts in Azure Pipelines](https://docs.microsoft.com/en-us/azure/devops/pipelines/artifacts/artifacts-overview?view=azure-devops&tabs=nuget)

[Azure Artifacts Credential Provider](https://github.com/microsoft/artifacts-credprovider#azure-artifacts-credential-provider)

[Azure Artifacts Upstream Sources](https://docs.microsoft.com/en-us/azure/devops/artifacts/concepts/upstream-sources?view=azure-devops)

## Demos

- Source Code is located at [https://github.com/arambazamba/az-400-dependencies](https://github.com/arambazamba/az-400-dependencies)

- Explain Azure Artifacts
- Create a Feed in Azure Artifacts and assign permissions to the [PROJECT]\Build Service ([PROJECT] is the name of your Azure DevOps project)
- Checkout commit with tag `initial-project` and explain the relation between the two projects in `food-api.csproj`
- Explain and run `az-pipelines/publish-foodcalc.yml` and mention GitVersion settings
- Explain [Azure Artifacts Credential Provider](https://github.com/microsoft/artifacts-credprovider) and [Device Auth Flow](https://docs.microsoft.com/en-us/azure/active-directory/develop/v2-oauth2-device-code). The installation script can be downloaded [here](https://github.com/microsoft/artifacts-credprovider/blob/master/helpers/installcredprovider.ps1).
- Checkout commit with tag `project-using-feed` and explain nuget.config and updated package ref

    `*.csproj:`
    ```xml
    <Project Sdk="Microsoft.NET.Sdk.Web">
        <PropertyGroup>
            <TargetFramework>net6.0</TargetFramework>
        </PropertyGroup>
        <ItemGroup>
            ...
            <PackageReference Include="FoodCalculations" Version="0.1.0" /> 
        </ItemGroup>
    </Project>
    ```

    `dotnet restore --interactive`

    ![restore-interactive](_images/restore-interactive.jpg)

- Explain and run `consume-foodcalc.yaml`
- Show Feed and upstream sources

    ![upstream](_images/upstream.png)

## Extensions & Tools

Install GitVersion on Windows PC:

```
choco install gitversion.portable
```

[GitTools - containing GitVersion for Azure DevOps](https://marketplace.visualstudio.com/items?itemName=gittools.gittools)
