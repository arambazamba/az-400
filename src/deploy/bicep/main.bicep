param appName string
param rgLocation string = resourceGroup().location

param acaEnvName string = 'food-app-acaenv'

param acrName string
param acrPwd string

param defaultPort int = 80

param catalogName string
param catalogImage string

param shopName string
param shopImage string

module logs 'log-analytics.bicep' = {
	name: '${appName}logs'
	params: {
      location: rgLocation
      name: '${appName}logs'
	}
}

module ai 'ai.bicep' = {
  name: '${appName}-app-insights'
  params: {
      rgLocation: rgLocation
      aiName: '${appName}-app-insights'
      logAnalyticsId: logs.outputs.id
  }
}

module containerAppEnvironment 'aca-env.bicep' = {
  name: 'container-app-environment'
  params: {
    name: acaEnvName
    location: rgLocation
    logsCustomerId:logs.outputs.customerId
    logsPrimaryKey: logs.outputs.primaryKey
  }
}

module catalogApi 'containerapp.bicep' = {
  name: catalogName
  params: {
    name: catalogName
    location: rgLocation
    containerAppEnvironmentId: containerAppEnvironment.outputs.id
    containerImage: '${acrName}.azurecr.io/${catalogImage}:latest'
    containerPort: defaultPort
    envVars: [
        {
        name: 'ApplicationInsights__ConnectionString'
        value: ai.outputs.aiConnectionString
        }
    ]
    useExternalIngress: true
    registry: acrName
    registryUsername: acrName
    registryPassword: acrPwd
  }
}

module shopUI 'containerapp.bicep' = {
  name: shopName
  params: {
    name: shopName
    location: rgLocation
    containerAppEnvironmentId: containerAppEnvironment.outputs.id
    containerImage: '${acrName}.azurecr.io/${shopImage}:latest'
    containerPort: defaultPort
    envVars: [
        {
          name: 'ENV_CATALOG_API_URL'
          value: 'https://${catalogApi.outputs.fqdn}'
        }
        {
          name: 'ENV_APPLICATION_INSIGHTS'
          value: ai.outputs.aiKey
        }
    ]
    useExternalIngress: true
    registry: acrName
    registryUsername: acrName
    registryPassword: acrPwd
  }
}
