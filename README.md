# vagrant-slides

Hosted online at: <https://cgoeller.github.io/vagrant-slides>

To create a PDF printout:

1. Open <https://cgoeller.github.io/vagrant-slides?print-pdf> in Chrome
1. Open the in-browser print dialog (CTRL/CMD+P).
1. Change the Destination setting to Save as PDF.
1. Change the Layout to Landscape.
1. Change the Margins to None.
1. Enable the Background graphics option.
1. Click save.

The presentation was created using [reveal.js](https://revealjs.com)

## Topics

* What is vagrant
  * System for creation and management of VMs
  * Wrapper for Hypervisors: VBox, VMware, etc.
  * Docker, AWS, KVM
* Written in RUBY
* CLI only
* Plugins
* Maintained by Hashicorp
* Opensource, VMware plugin for money
* www.vagrantup.com
* Base boxes
  * Cloud <https://app.vagrantup.com/boxes/search>
  * Self-made with Packer or Vagrant (based on existing box)
* Providers
  * Virtualbox, VMWare Workstation, etc.
* Provisioners
  * Shell, File, Ansible, Puppet, Chef, etc.
* Multi-VM environments
* Vagrantfile in SCM
  * Configuration of box
  * Definition of desired state
  * Box customization (HW, Network)
* Synced Folders
* Port forwarding

## Examples

* Elasticsearch 6.0.0 Single-Node
* Elasticsearch 6.0.0 Cluster
* Maven-Build (settings.xml from client)
* Docker-Engine
* Docker swarm mode with ES Cluster
