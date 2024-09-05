<p align="left">
  <img width="600" height="400" src="https://github.com/GluuFederation/agama-pw/assets/43112579/639a8ca4-7549-4167-a5eb-5fe19fad3ff5">
</p>

[![Contributors][contributors-shield]](contributors-url)
[![Forks][forks-shield]](forks-url)
[![Stargazers][stars-shield]](stars-url)
[![Issues][issues-shield]](issues-url)
[![Apache License][license-shield]](license-url)




# About

This repo is home to Gluu Agama-PW project. This Agama project provides 
standard username-password authentication for a person.

![image](./pw-login-page.png)

## Where To Deploy

Project can be deployed to any IAM server that runs an implementation of 
the [Agama Framework](https://docs.jans.io/head/agama/introduction/).
Known implementations for Agama engine are listed below:

* Jans Auth Server
* Gluu Flex

## How To Deploy

### Download the Project

Project is bundled as [.gama package](https://docs.jans.io/head/agama/gama-format/). Visit the `Assets` section of the [Releases](https://github.com/GluuFederation/agama-pw/releases) to download the `.gama` package.

### Add The Project To The Server

Different IAM servers may provide different methods and 
user-interfaces from where an Agama project can be deployed on that server. 

Steps here show how Agama-PW project can be deployed on the [Janssen Server](https://jans.io). The Janssen Server provides multiple ways in which an Agama project can be deployed and configured. Use a command-line tool, or a REST API or a TUI (text-based UI). Refer to [Agama project configuration page](https://docs.jans.io/head/admin/config-guide/auth-server-config/agama-project-configuration/) in the Janssen Server documentation for more details.

### Configure The Project

Agama project accepts configuration parameters in JSON format. Every Agama 
project comes with a basic sample configuration file for reference.

Below is a typical agama-pw flow configuration:
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

### Test The Flow

Use any Relying party implementation (like [jans-tarp](https://github.com/JanssenProject/jans/tree/main/demos/jans-tarp)) to send authentication request that triggers the flow.

From the incoming authentication request, the Janssen Server reads the `ACR` parameter value to identify which authentication method should be used. In order to invoke the Agama-PW project flow, specify the ACR value as that your request should be authenticated using Agama-PW project, use the ACR as `agama_<qualified-name-of-the-top-level-flow>`.  

The qualified name of the top level flow in Agama-PW project is `org.gluu.agama.pw.main`. So, use the ACR value as `agama_org.gluu.agama.pw.main`.

![gif](./openlogin.gif)

## Customize and Make It Your Own

Fork this repo to start customizing Agama-pw project in many ways. Starting from changing the main authentication flow to changing the styling of the web-pages to suite your organization's branding guidelines. Agama flow can also be used in conjunction with other Agama project to create complex authentication journeys. 

To make it easier to visualize and customize the Agama Project, use the [Agama Lab](https://cloud.gluu.org/agama-lab/login)

## Flows In The Project

This project contains one flow. 

- [org.gluu.agama.pw.main](#orggluuagamapwmain)

### org.gluu.agama.pw.main

[org.gluu.agama.pw.main](./code/org.gluu.agama.pw.main.flow) flow represents 
single step username and password authentication. This flow allows configurable
number of incorrect login attempts along with ability to call account locking 
endpoint if the attempts reach the maximum allowed number.

```mermaid
sequenceDiagram
title Agama-PW Happy Flow
actor Person
participant Browser
participant website
participant IDP
participant Authenticate
 
Person->>IDP: yes please... I want to login
IDP->>Browser: uid/pw Form
Person->>Browser: Creds
Browser->>IDP: POST Form
IDP->>Authenticate: validate(uid, pw)
Authenticate->>IDP: {"result":"success","code": 200,"message": "OK"}
IDP->>Browser: OpenID Code
Browser->>website: callback
 ```

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
