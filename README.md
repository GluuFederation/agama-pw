# "agama-pw" 

"agama-pw" an "Hello" project for Agama Developer Studio (ADS). We will build, deploy and test a simple password-based authentication flow using [Agama](https://docs.jans.io/head/agama/introduction/) and [Agama Lab](https://cloud.gluu.org/agama-lab/dashboard/projects)

## Table of Contents

- [Agama Lab](#agama-lab)
- [Getting Started](#getting-started)
- [Commonly used Bean](#commonly-used-bean)
- [Web Template](#web-template)
- [Engin and Bridge Configuration](#engine-and-bridge-configuration)



### Agama Lab

[Agama Lab](https://cloud.gluu.org/agama-lab/dashboard/projects) is an online visual editor to build authentication flows. A flow built on Agama Lab is packaged as a `.gama` project file. `.gama` package needs to be manually deployed on Janssen Server where the Agama engine will execute the flow when an authentication request is received.

Major Steps involved in this process are:

* Create Agama project using Agama Lab
* Deploying .gama package on Janssen Server
* Testing the authentication flow

### Getting Started

We will use [Agama Lab](https://cloud.gluu.org/agama-lab/dashboard/projects) to create a simple username-password based user authentication flow. This involves defining the authentication steps, designing the user interface to capture user inputs, and lastly, releasing the flow as an Agama project.

- [Log Into Agama Lab](#log-into-agama-lab)
- [Create A New Project](#create-a-new-project)
- [Create Authentication Flow](#create-authentication-flow)
- [Design User Interface](#design-user-interface)
- [Release The Project](#release-the-project)
- [Deploy Agama Project](#deploy-agama-project)


### Commonly used Bean

To obtain a managed bean inside agama flow [CdiUtil](https://github.com/JanssenProject/jans/blob/main/jans-core/service/src/main/java/io/jans/service/cdi/util/CdiUtil.java) is used.

1. [AuthenticationService](https://docs.jans.io/head/admin/developer/managed-beans/#1-authenticationservice)

Allow to authenticate a user or obtain the current authenticated user. To know more visit [here](https://docs.jans.io/head/admin/developer/managed-beans/#1-authenticationservice)



### Log Into Agama Lab
Go to [Agama Lab](https://cloud.gluu.org/agama-lab/dashboard/projects) login page. And authenticate using your Github profile. After successfull authenticaton you will see your agama lab Dashboad. Then chose a repository 


### Create A New Project

To create a new project, click on the `New Project` button on the project listing page. Enter the name and the description for the new project and click the Create button.

![Screenshot from 2023-10-19 04-55-28](https://github.com/mmrraju/agama-pw/assets/43112579/85f0508a-8e43-43d7-a2c4-4690d6b86858)

This will create a new project and it'll be listed on the project listing page.

![Screenshot from 2023-10-19 04-58-31](https://github.com/mmrraju/agama-pw/assets/43112579/fa9ef639-996c-4470-929a-3f5782808600)


### Create Authentication Flow

Click on ↗

The flow authoring view will open with a blank canvas. To start creating the flow, we need to create a Flow File. To do that,

`Right-click` on code and then select `New > Flow File`



### Web Template

To design user interface. We use Freemaker Template. There have multiple default template. In the RRF configuration step, we mentioned `login.ftlh` to render the login page elements. We need to add `login.ftlh` to the Agama project so that the flow can use during the flow execution. Use the steps below to create the page.

![Screenshot from 2023-10-19 03-26-16](https://github.com/mmrraju/agama-pw/assets/43112579/6493bd10-f127-490e-8ed2-4d62bd513a77)



### Engine and Bridge Configuration
To know about Engine and Bridge Configuration please [visit](https://docs.jans.io/head/admin/developer/agama/engine-bridge-config/)
By default, both components are disabled. To activate them do the following:

Open Jans TUI

Navigate to `Auth Server > properties > agamaConfiguration > check enabled > save`

Navigate to `Scripts > Search 'agama' > Select the script and hit enter > check enabled > save`


























