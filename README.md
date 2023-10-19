# "Hello-World" 

"Hello-world" a project for Agama Developer Studio (ADS). We will build, deploy and test a simple password-based authentication flow using [Agama](https://docs.jans.io/head/agama/introduction/) and [Agama Lab](https://cloud.gluu.org/agama-lab/dashboard/projects)

# Table of Contents

- [Agama Lab](#agama-lab)
- [Commonly used Bean](#commonly-used-bean)
- [Web Template](#web-template)
- [Engin and Bridge Configuration](#engine-and-bridge-configuration)
- [Getting Started](#getting-started)




## Agama Lab

[Agama Lab](https://cloud.gluu.org/agama-lab/dashboard/projects) is an online visual editor to build authentication flows. A flow built on Agama Lab is packaged as a `.gama` project file. `.gama` package needs to be manually deployed on Janssen Server where the Agama engine will execute the flow when an authentication request is received.

Major Steps involved in this process are:

* Create Agama project using Agama Lab
* Deploying .gama package on Janssen Server
* Testing the authentication flow

## Commonly used Bean

To obtain a managed bean inside agama flow [CdiUtil](https://github.com/JanssenProject/jans/blob/main/jans-core/service/src/main/java/io/jans/service/cdi/util/CdiUtil.java) is used.

1. [AuthenticationService](https://docs.jans.io/head/admin/developer/managed-beans/#1-authenticationservice)

Allow to authenticate a user or obtain the current authenticated user. To know more visit [here](https://docs.jans.io/head/admin/developer/managed-beans/#1-authenticationservice)

## Web Template

To design user interface. We use Freemaker Template. There have multiple default template. 

![template](https://github.com/mmrraju/agama-pw/assets/43112579/7f6ba44c-efc5-43c1-a6bc-d23b3169a4ed)

## Engine and Bridge Configuration
To know about Engine and Bridge Configuration please [visit](https://docs.jans.io/head/admin/developer/agama/engine-bridge-config/)
By default, both components are disabled. To activate them do the following:

Open Jans TUI

Navigate to `Auth Server > properties > agamaConfiguration > check enabled > save`

Navigate to `Scripts > Search 'agama' > Select the script and hit enter > check enabled > save`

## Getting Started

We will use [Agama Lab](https://cloud.gluu.org/agama-lab/dashboard/projects) to create a simple username-password based user authentication flow. This involves defining the authentication steps, designing the user interface to capture user inputs, and lastly, releasing the flow as an Agama project.

- [Log Into Agama Lab](#log-into-agama-lab)
- [Create A New Project](#create-a-new-project)
- [Create Authentication Flow](#create-authentication-flow)
- [Design User Interface](#design-user-interface)
- [Release The Project](#release-the-project)
- [Deploy Agama Project](#deploy-agama-project)
- [Test](#test)




### Log Into Agama Lab
Go to [Agama Lab](https://cloud.gluu.org/agama-lab/dashboard/projects) login page. And authenticate using your Github profile. After successfull authenticaton you will see your agama lab Dashboad. Then chose a repository 


### Create A New Project

To create a new project, click on the `New Project` button on the project listing page. Enter the name and the description for the new project and click the Create button.

![Screenshot from 2023-10-19 04-55-28](https://github.com/mmrraju/agama-pw/assets/43112579/85f0508a-8e43-43d7-a2c4-4690d6b86858)

This will create a new project and it'll be listed on the project listing page.

![Screenshot from 2023-10-19 04-58-31](https://github.com/mmrraju/agama-pw/assets/43112579/fa9ef639-996c-4470-929a-3f5782808600)


### Create Authentication Flow

#### Create A Flow File

Click on ↗

The flow authoring view will open with a blank canvas. To start creating the flow, we need to create a Flow File. To do that,

`Right-click` on code and then select `New > Flow File`

#### Create AuthenticationService Call block

![Screenshot from 2023-10-19 20-46-03](https://github.com/mmrraju/agama-pw/assets/43112579/498206ee-a6a4-43a3-83a1-dcbe01fe410c)

#### Create CdiUtil Call block

![Screenshot from 2023-10-19 20-48-15](https://github.com/mmrraju/agama-pw/assets/43112579/201e59a5-19e1-4749-b9ff-6f845883cb00)


#### Create Assignment(s) block

![Screenshot from 2023-10-19 20-49-50](https://github.com/mmrraju/agama-pw/assets/43112579/b6f12c21-bde2-4f7d-a04c-c536337b14ca)


#### Create repeat block

`Repeat` block represents the Repeat instruction of Agama DSL.

`Repeat` block creates a loop to iterate over certain steps(blocks). We will create a repeat loop that allows 3 retries if the authentication fails.

![Screenshot from 2023-10-19 20-50-29](https://github.com/mmrraju/agama-pw/assets/43112579/5dd38fda-315e-44f9-b57c-fa3bb8ecf043)

#### Create An RRF block

`RRF block` represents the `RRF` instruction of Agama DSL.

![Screenshot from 2023-10-19 20-51-58](https://github.com/mmrraju/agama-pw/assets/43112579/7046fc63-248f-4de8-9c72-18ab1074c346)


#### Create a CdiUtil Call block

Create a Call block to process the `username` and `password` received from the user (in `RRF`) and validate them. The result of validation should be stored in a variable.

![Screenshot from 2023-10-19 20-56-23](https://github.com/mmrraju/agama-pw/assets/43112579/a26cd0dc-64f3-46f8-830b-4e901d50626b)


#### Create An Assignment block

In case of authentication failure, we want to show the `username` to the user while reentering the password on the web page. For this, we will save the username in a variable using the `Assignment(s) block`.

![Screenshot from 2023-10-19 20-57-40](https://github.com/mmrraju/agama-pw/assets/43112579/851758b5-2c59-459f-9687-5fc7fecaba1a)


#### Create A Conditional When block

`When block` represents the `When` instruction of Agama DSL.

Create a conditional check using the `When block` to check if the authentication (validated in validate credentials block) has been successful.

![Screenshot from 2023-10-19 20-58-29](https://github.com/mmrraju/agama-pw/assets/43112579/d702e6f8-7225-48fe-8922-6daa550db3a4)


#### Create finish blocks

The `Finish block` represents the `Flow finish` instruction of Agama DSL.

If the authentication was successful then the flow should `finish` and `return` the `username`. This will be achieved by adding a `Finish block` to the `When block`. And if authentication fails after 3 attempts, we need another `Finish block` following the `Repeat block`.

![Screenshot from 2023-10-19 21-01-06](https://github.com/mmrraju/agama-pw/assets/43112579/e9ddbb47-37e8-4b0b-9288-0fce1c967839)


#### Check Generated code

Agama Lab flow gets translated in Agama DSL. Click the `Code Generated` button to see the code generated by the flow.

![Screenshot from 2023-10-19 21-33-51](https://github.com/mmrraju/agama-pw/assets/43112579/070dfc87-1f99-49c3-8f6b-851f51fdad59)


#### Design User Interface

In the RRF configuration step, we mentioned `login.ftlh` to render the login page elements. We need to add `login.ftlh` to the Agama project so that the flow can use during the flow execution. Use the steps below to create the page.

![Screenshot from 2023-10-19 03-26-16](https://github.com/mmrraju/agama-pw/assets/43112579/6493bd10-f127-490e-8ed2-4d62bd513a77)

#### Release The Project

To use the flow for authentication in the Janssen Server, the flow needs to be released. Agama Lab releases the flow and the related artifacts (like template) in the form of a `.gama` file in the GitHub repository.

To release the project, `click` on any of the files in the left project explorer, and click `Release Project`.

![Screenshot from 2023-10-19 22-00-25](https://github.com/mmrraju/agama-pw/assets/43112579/e4af0832-a90c-48e5-8a3e-fe2ff1418bbf)

#### Deploy Agama Project

Please ensure that `Agama engine` and `scripts` are`enabled` in Janssen Server deployment

1. Download the `.gama` file from the GitHub repository
2. Open TUI using following commands on Janssen Server
  `/opt/jans/jans-cli/jans_cli_tui.py`
3. Navigate to Auth `Server > Agama > Upload Project`. Select the `.gama` file to upload.

#### Test

Keep your `ACR` value `agama` and need to pass your agama flow name as `ADDITIONAL` paramaters 

```
ACR_VALUES = "agama"

ADDITIONAL_PARAMS = {'agama_flow': 'co.acme.password.flow'}

```



























