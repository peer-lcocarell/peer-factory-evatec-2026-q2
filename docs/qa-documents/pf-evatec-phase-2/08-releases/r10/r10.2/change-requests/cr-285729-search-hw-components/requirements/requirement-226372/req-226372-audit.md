4.3.1REQUIREMENT: Modules
https://ops1.peergroup.com/DefaultCollection/PFEvatec/_testPlans/define?planId=291616&suiteId=292239

PF will provide a screen to view all of the modules with their basic information and current status. There are two types of modules

Real modules which represent a physical module that can be docked to a tool

oFor non-Retired real modules a location will be provided which is a link to the tool & module location if Docked, or the configured location otherwise

Abstract modules which can be used to define hardware configurations for comparison

The list will include the module #, serial #, name/label, module type, location, status, article #, description and a count of how many submodules the module contains.

Users will be able to view the details of a module.

In addition users will be able to

Create a module, or copy the selected module if they have the Modules_Create security right

Edit the selected module if they have the Modules_Edit security

Retire the selected module if they have the Modules_Remove security right and it is not already retired

Permanently remove the selected module if they have the Modules_Admin security right

View the Hardware configuration for the selected module if its module type has a logbook configured and the user has the HardwareConfiguration_View security right

Search for hardware components if the user has the HardwareConfiguration_View security right

View the Logbook for the selected module if the user has the Logbook_View security right

Users will be able to toggle between active modules and all modules (including retired). Retired modules can only be viewed.

Users must have the Modules_View security right to access this screen.
