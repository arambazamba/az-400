# Getting Started

To avoid problems with saved credentials I recommend using an alternate browser.

- [Register a Github User Account](https://github.com/) or use your existing account
- [Activate your Azure Pass to create your Azure Subscription](../05-azure-pass) to create a subscription with free grants

    >Note: Azure Passes can only be used once per e-mail account. Please do not use Azure AD Accounts with existing subscriptions. If you are not sure, please register a new [Outlook.com](https://outlook.live.com/owa/) account. Use the same e-mail account as you have used for the Azure DevOps Organization

- [Configure CloudShell for first use in your Azure Tenant](../04-CLI/#configure-cloud-shell)
- [Register an Azure DevOps Organization](../07-azure-devops)
- [Setup your Lab Machine & install required Software using Script - optional](../../setup)
  
  >Note: You can also work on your own machine. Execute [setup-az-400.ps1](../../setup/setup-az-400.ps1) to install the required Software on a Windows machine

- Configure Git on the Lab VM
- Setup Git and Fork the class repo

## Configure Git on the Lab VM - Optional

Set User and E-Mail in order to be able to commit to git:

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@yourdomain.com"
```

## Setup Git and Fork the class repo

Go to `https://github.com/ARambazamba/az-400` and fork the repo or use the GitHub CLI:

```
gh repo fork https://github.com/arambazamba/az-400
```

![forking-wf](_images/fork.jpg)

The forking-workflow allows you to commit your changes to your fork of the repo and still get updates on the repo

![forking-wf](_images/forking-workflow.jpg)

Clone Class Repo:

```bash
git clone https://github.com/Student01/az-400
```

> Note: If you have forked the class repo clone your own fork, otherwise use https://github.com/ARambazamba/az-400
