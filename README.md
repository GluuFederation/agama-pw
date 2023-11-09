<p align="left">
  <img width="600" height="400" src="https://github.com/GluuFederation/agama-pw/assets/43112579/b6e12bd2-81d5-4cff-860d-ad784d3390d3">
</p>

[![Contributors][contributors-shield]](contributors-url)
[![Forks][forks-shield]](forks-url)
[![Stargazers][stars-shield]](stars-url)
[![Issues][issues-shield]](issues-url)
[![Apache License][license-shield]](license-url)



# "Hello-World"

Welcome to the **"Hello-World"** project! This project serves as an ideal starting point for those who are new to Agama Lab. In this introductory project, we will take you through the basics of Agama Low code helping you get started with confidence.

# Overview

This project is a sample of password-based authentication. Authentication flow designed and developed using Agama and Agama Lab. If you are interested in low-code development and eager to create your authentication flow with drag-and-drop features, then Agama Lab is the right choice for you.

What is Agama? To gain a better understanding, please visit [here](https://docs.jans.io/head/agama/introduction). 

The **"Hello-World"** project can be constructed using Agama Lab. To learn more about Agama Lab, please visit [here](https://gluu.org/agama-lab).

# Pre-requisite
Let's take a look at what you need:
1. An account in [Agama Lab](https://gluu.org/agama-lab/).
2. Basic knowledge about [Agama](https://docs.jans.io/head/agama/introduction).
3. Commonly used [Bean](https://docs.jans.io/head/admin/developer/managed-beans/#1-authenticationservice) for your authentication flow.
4. [Jans server](https://docs.jans.io/head/admin/install/).

To quickly adapt to Agama projects like **"Hello-World"** please visit [Quick Start Using Agama Lab](https://docs.jans.io/head/admin/developer/agama/quick-start-using-agama-lab/).

Once flow is completed, you will need to establish a connection between your flow and an engine like Jans Server. To learn more about Engine and Bridge Configuration, please visit [here](https://docs.jans.io/head/admin/developer/agama/engine-bridge-config/).

# Deploy and Test

## Deployment 

* Download the release package from the Github [releases](https://github.com/GluuFederation/agama-pw/releases)
  ```
  wget https://github.com/GluuFederation/agama-pw/releases/download/hello-world-1.0.1/hello-world.gama
  ```
* Verify integrity of the downloaded package by verifying published `sha256sum`.
  Download `sha256sum` file for the package
  ```
  wget https://github.com/GluuFederation/agama-pw/releases/download/hello-world-1.0.1/hello-world.gama.sha256sum
  ```
  Check the hash if it is matching
  ```
  sha256sum -c hello-world.gama.sha256sum
  ```
  output similar to below should confirm the integrity of the downloaded package.
  ```
  hello-world.gama: OK
  ```

* Follow this [guideline](https://docs.jans.io/head/admin/developer/agama/quick-start-using-agama-lab/#deploy-agama-project) to deploy an Agama Project.

## Test Deployment

You'll need an OpenID Connect test RP. You can try [oidcdebugger](https://oidcdebugger.com/),
[jans-tarp](https://github.com/JanssenProject/jans/tree/main/demos/jans-tarp) or [jans-tent](https://github.com/JanssenProject/jans/tree/main/demos/jans-tent). Check out this video to see
an example of **Hello-world** in action:

https://github.com/GluuFederation/agama-pw/assets/43112579/e595b9a4-01b7-441f-a13f-c91f3dcbad97


# Contributors

<table>
<tr>
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

