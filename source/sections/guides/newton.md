# Signing Up

<div class="special-offer">
	<h2>New Customers</h2>
	<p>Interested in using Redpoint? We'd love to talk with you. You can sign up using the form on <a href="http://catalyze.io/redpoint">this page</a>. Alternatively you email our sales department directly <a href="mailto:sales@catalyze.io">sales@catalyze.io</a>.</p>
	<h2>Existing Customers</h2>
	<p>Existing Catalyze integration customers will receive an invitation to Redpoint (sent to the main point of contact). That user can then invite other users within their organization.</p>
	<a href="http://catalyze.io/redpoint/vision" class="cta">Read our Integration Manifesto</a>
</div>

# Welcome To Redpoint

**Redpoint is the product evolution of Catalyze's industry-leading integration services, used by many progressive digital health vendors.**

## Introduction

Integrating with health systems is a journey riddled with complexity and roadblocks. The first mistake is starting the journey without a guide. Addressing only the technical components won't get you to the finish.

Redpoint shepherds you through the process, automating steps that would otherwise take up valuable time and resources. The Redpoint result—faster, more complete data and workflow integration leading to increased adoption.

Once your integration route is mapped, it’s ready for every integration at a moment's notice. Scale to 10 or 100 or 1,000 sites without flinching.

# Product Specifications

Redpoint is made up of three major components:

  - Connectors
  - Scripts
  - Bearings

## Connectors

**Streamline VPN connectivity to secure connections with any partner. Connectors scale as you scale.**

EHR integration is only part of your challenge. You also need to create and manage secure connections, typically via VPN, to health systems. This challenge grows exponentially at scale. Redpoint Connectors automate the creation and management of secure connections, eliminating that burden for you and your engineering team.

The core components of a Redpoint Connector are:

  1. A Health System name
  2. A secure VPN setup

1.) A Health System name is a unique string given to a Connector in order to identify the Health System that it's integrating with. For example; a Connector with a Health System name of `Boston Children's Hospital` would identify the Connector that connects to the Boston Children's Hospital health system.

Naming is very important here, so we've made the extra effort of integrating with the [Clearbit API](https://clearbit.com/docs#autocomplete-api) to auto-fill suggestions on naming (Note: You can still use a name that is not suggested by the auto-fill).

2.) A secure VPN connection makes up for the bulk of a Connectors functionality. See the video below as an example of creating a Connector:

<div style="width: 100%; height: 0px; position: relative; padding-bottom: 55.556%; margin-bottom: 20px;">
	<iframe src="https://streamable.com/e/fdvq" frameborder="0" allowfullscreen webkitallowfullscreen mozallowfullscreen scrolling="no" style="width: 100%; height: 100%; position: absolute;"></iframe>
</div>

### Edit a Connector

It is often the case that a user will not have every bit of required information to successfully complete a Connector form the first time. The VPN requirement of a Connector contains a lot of information.

Because of this, we've made it easy to save the Connector as incomplete with the option to edit it later. You can see in the video below how one might change the Health System name, and complete the VPN information of a Connector:

<div style="width: 100%; height: 0px; position: relative; padding-bottom: 57.361%; margin-bottom: 20px;">
	<iframe src="https://streamable.com/e/sv59" frameborder="0" allowfullscreen webkitallowfullscreen mozallowfullscreen scrolling="no" style="width: 100%; height: 100%; position: absolute;"></iframe>
</div>

## Scripts

**Pre-configured bundles of EHR integrations that solve specific workflow requirements.**

Scripts are custom-built workflows for digital health use cases. You select a Script that will help you accomplish tasks such as enrolling patients in your application for a care management solution, collecting patient data for a clinical research platform, adding telehealth encounter information to an EHR, or scheduling patients within patient portals.

In the current iteration of Redpoint, Catalyze supports your creation of simple scripts. Simply give your script a name, select an interface template, and tell Redpoint which direction that interface should travel. You can see how easy it is to create a script below:

<div style="width: 100%; height: 0px; position: relative; padding-bottom: 54.028%; margin-bottom: 20px;">
	<iframe src="https://streamable.com/e/8vfu" frameborder="0" allowfullscreen webkitallowfullscreen mozallowfullscreen scrolling="no" style="width: 100%; height: 100%; position: absolute;"></iframe>
</div>

The rest of the Script creation process is handled by Catalyze integration engineers. A typical script will take between 24 &amp; 48 hours to process. Once the Script has been created, you're free to start using the data.

After the Script and associated interfaces have been started, you'll begin to see data metrics flowing into your Redpoint dashboard as shown in the image below:

![Redpoint Dashboard](/assets/img/redpoint-dashboard.jpg)

## Bearings

**Offload project management duties to a committed team of experts so you can focus on your product.**

Coordination with hospitals and EHRs is central to a successful integration, but it’s the single hardest component to scale.

With Bearings, the project management process is offloaded to Redpoint. You gain the benefit of Catalyze’s expertise and relationships across the country, baked right into Redpoint itself.

Now project management is a reliable piece of the integration puzzle that scales with you as your business grows.

# Other Pieces of Redpoint

## Clusters

A Cluster is a group of mirth and postgres services that work together to serve your Connectors and Scripts. Most companies will have one cluster that encompasses all connections to Health Systems.  Some companies chose to organize connections differently using 2 or more clusters (e.g. a “Test” cluster and a “Production” cluster).  You can think of a Cluster as an access point to your Connectors for other members of your team. See the video below on how to add a user to a cluster:

<div style="width: 100%; height: 0px; position: relative; padding-bottom: 51.667%; margin-bottom: 20px;">
	<iframe src="https://streamable.com/e/qcr5" frameborder="0" allowfullscreen webkitallowfullscreen mozallowfullscreen scrolling="no" style="width: 100%; height: 100%; position: absolute;"></iframe>
</div>

Once the invite is sent to the user, they can enter the code into the clusters view in Redpoint. (Note: Be sure that your user signs up for a Catalyze dashboard account with the same email the invite was sent to). The video below shows how to navigate to the clusters view and where to enter the code:

<div style="width: 100%; height: 0px; position: relative; padding-bottom: 48.472%; margin-bottom: 20px;">
	<iframe src="https://streamable.com/e/vu3j" frameborder="0" allowfullscreen webkitallowfullscreen mozallowfullscreen scrolling="no" style="width: 100%; height: 100%; position: absolute;"></iframe>
</div>

In the event that a user no longer needs access to a cluster, you can revoke that access in the user management table below the invite form, shown in the image below:

![Redpoint Revoke Access](/assets/img/redpoint-user-management.jpg)