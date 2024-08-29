<p align="left">
  <img width="600" height="400" src="https://github.com/GluuFederation/agama-pw/assets/43112579/639a8ca4-7549-4167-a5eb-5fe19fad3ff5">
</p>

[![Contributors][contributors-shield]](contributors-url)
[![Forks][forks-shield]](forks-url)
[![Stargazers][stars-shield]](stars-url)
[![Issues][issues-shield]](issues-url)
[![Apache License][license-shield]](license-url)

# Gluu Agama-PW

Welcome to the [https://github.com/GluuFederation/agama-pw](Agama-PW) project.
This project is governed by [Gluu](https://gluu.org) and published under an
Apache 2.0 license. It provides various flows to password authenticate a person.

## Introduction 

The Agama-pw project is available in the Explore Catalog. This project is 
designed for password authentication and validation. For project setup, 
refer to the [quick start guide](https://gluu.org/quick-start-guide/). 
In this project, we have created a login flow.



## Implementations

* Jans Auth Server
* Gluu Flex

## Flow: One-step password authn

This is the classic combined username / password form authentication workflow.
The sequence diagram below shows the good flow.

![agama-pw sequence diagram image](Agama-PW-sequence.png)
[Source](https://sequencediagram.org/index.html#initialData=C4S2BsFMAIEEHMCGBbRBaACgdWgCUQA4ECe0AYuAPYDuAULYgMbCUBO0BkrAzpQHa0CiVqEYghfYNABGrGty61IksKWqRp3MJEHDR4xJOgBJACIZa0ygFc+AE2GlE14AAtloxMB2CuvPmgAfGYYAFzQxJDcHFCICgB0iSbQ1IZSLNBU8CACIUGy8lzh1iB2APQE1ORsyL48-Ply1Aqs4YyskHbclk0tQSHhGADyAMoAKtWstXmBzm4eIIxekOEAbojgpcsAFCV2ADQc1ACUDC7uKkve-ebhAN4ARB3c1uDAD6EPL4yMUdwP+wAOnwHoxKHZIB9oAAmAAMsKBIOQf0Q8Eh4QeQwA0g8AL60GYFZpFaBDTh8MzQMEQnqFVhBdSabRtDbgaRMADWQA)

### Login Flow

This flow was created using a pre-defined template located in the code folder. 
you can view code for the login flow. The image below illustrates 
the login flow:

![image](./agama-pw.png)

The flow includes the UI for the login page, informational messages, 
service calls, and a validation loop.


In the `Web` folder, you can customize the UI of the page. Additionally, 
you can generate the code for this login flow by using the `Generate Code` button.

![image](./pw-generated-code.png)

Also can inster the notes to the flow

#### Exporting and Importing Login Flows

1. Export the Flow:

* Select the option to export the flow.
* A ZIP file containing your login flow configuration will be generated.
* Save this ZIP file to your local system for future use or sharing.

2. Importing a Login Flow:

* Navigate to the `web` section where you manage flows.
* Click on the `Import` button.
* Choose the ZIP file that you import.
* The system will process the file and import the flow configuration.
* Ensure that the imported flow is correctly integrated and functioning as intended.



### Uploading the Agama-pw Flow

To use the Agama-pw flow:

1. Download the login flow and upload it as an Agama project in Tui.
2. After uploading the flow, import the flow configuration.

You can also obtain a sample `Flow Configuration` by exporting it from Tui.


#### Flow Configuration
Below is a typical agama-pw flow
  ```
        {
            "org.gluu.agama.pw.main": {
              "MAX_LOGIN_ATTEMPT": "6",
              "ENABLE_LOCK": "true",
              "LOCK_EXP_TIME": "180"
            }
        }
  ```
- MAX_LOGIN_ATTEMPT: Is the maximum failed login attempt before the user account is locked
- ENABLE_LOCK: true/false, this is use to enable the Account Lock feature
- LOCK_EXP_TIME: The time in seconds befor a locked account is unlock.
  
### Running the Agama Project

To run the flow, you need to [install the Trap extension](https://github.com/JanssenProject/jans/tree/main/demos/jans-tarp). 
This extension is available for Chrome and Firefox.

After installing the Trap extension, follow these steps:

1. Add the client by entering the hostname, client expiry date, and selecting the scopes.
The add client process as shown below

![git](./addclient.gif)

2. Once configured, the Authentication Flow Inputs screen will be displayed.
On this screen, add an `Acr Value` such as `agama_Qualified_Name`.
The authentication process is shown below.

![gif](./openlogin.gif)

The login screen should appear as shown in the image below:

![image](./pw-login-page.png)

### Verification

1. Verify the Login Flow: Ensure that the login flow operates as expected 
according to the designed process.
2. Check User Details: After successful login, verify if the user 
details are retrieved correctly.

![gif](../web/login-success.gif)

# Core Developers

<table>
 <tr>
  <td align="center" style="word-wrap: break-word; width: 150.0; height: 150.0">
    <a href=https://github.com/syntrydy>
        <img src="https://avatars.githubusercontent.com/u/7513418?v=4" width="100;"  style="border-radius:50%;align-items:center;justify-content:center;overflow:hidden;padding-top:10px" alt=Thomas Gasmyr>
        <br />
        <sub style="font-size:14px"><b>Mougang Gasmyr</b></sub>
    </a>
  </td>
    <td align="center" style="word-wrap: break-word; width: 150.0; height: 150.0">
        <a href=https://github.com/mmrraju>
            <img src=https://avatars.githubusercontent.com/u/43112579?v=4 width="100;"  style="border-radius:50%;align-items:center;justify-content:center;overflow:hidden;padding-top:10px" alt=Md Mostafejur Rahman/>
            <br />
            <sub style="font-size:14px"><b>Md Mostafejur Rahman</b></sub>
        </a>
  </td>
 </tr>
</table>

# License

This project is licensed under the [Apache 2.0](https://github.com/GluuFederation/agama-pw/blob/main/LICENSE)


<!-- This are stats url reference for this repository -->
[contributors-shield]: https://img.shields.io/github/contributors/GluuFederation/agama-pw.svg?style=for-the-badge
[contributors-url]: https://github.com/GluuFederation/agama-pw/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/GluuFederation/agama-pw.svg?style=for-the-badge
[forks-url]: https://github.com/GluuFederation/agama-pw/network/members
[stars-shield]: https://img.shields.io/github/stars/GluuFederation/agama-pw?style=for-the-badge
[stars-url]: https://github.com/GluuFederation/agama-pw/stargazers
[issues-shield]: https://img.shields.io/github/issues/GluuFederation/agama-pw.svg?style=for-the-badge
[issues-url]: https://github.com/GluuFederation/agama-pw/issues
[license-shield]: https://img.shields.io/github/license/GluuFederation/agama-pw.svg?style=for-the-badge
[license-url]: https://github.com/GluuFederation/agama-pw/blob/main/LICENSE
