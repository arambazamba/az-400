# Using Task Groups in Microsoft 365 Deployments

[YAML Templates](https://docs.microsoft.com/en-us/azure/devops/pipelines/process/templates?view=azure-devops)

[YAML Template Samples](https://github.com/microsoft/azure-pipelines-yaml/tree/master/templates)

[CLI for Microsoft 365](https://pnp.github.io/cli-microsoft365/)

## Demo: Use Task Groups with SPFx WP and Microsoft 365 CLI

Import `spfx-build.yaml`:

```yaml
stages:
  - stage: Build
    jobs:
      - job: BuildJob
        steps:
          - task: NodeTool@0
            inputs:
              versionSpec: 14.x
            displayName: Install Node.js
          - task: CmdLine@2
            displayName: npm install
            inputs:
              script: "npm install"
              workingDirectory: "$(fld)/"

          - task: gulp@1
            displayName: "gulp bundel"
            inputs:
              gulpFile: "$(fld)/gulpfile.js"
              targets: "bundle"
              arguments: "--ship"
              enableCodeCoverage: false

          - task: gulp@1
            displayName: "gulp package solution"
            inputs:
              gulpFile: "$(fld)/gulpfile.js"
              targets: "package-solution"
              arguments: "--ship"

          - task: CopyFiles@2
            displayName: "Copy Files to: $(build.artifactstagingdirectory)/drop"
            inputs:
              Contents: "$(fld)/sharepoint/solution/*.sppkg"
              TargetFolder: "$(build.artifactstagingdirectory)/drop"

          - task: PublishBuildArtifacts@1
            displayName: "Publish artifacts: drop"
            inputs:
              PathtoPublish: "$(Build.ArtifactStagingDirectory)/drop"

```

Import `Deploy-M365-WebPart-CLI.json` as release pipeline. Notice the path in the downloaded artifact from the build:

![artifact](_images/artifact.png)

It is used in the [M365-CLI Task](https://pnp.github.io/cli-microsoft365/cmd/spo/app/app-add/):

![m365-cli](_images/m365-cli.png)

Refactor to Task Group:

![taskgroup](_images/taskgroup.png)

![final](_images/final.png)

>Note: In the next module we will get the credentials from Key Vault