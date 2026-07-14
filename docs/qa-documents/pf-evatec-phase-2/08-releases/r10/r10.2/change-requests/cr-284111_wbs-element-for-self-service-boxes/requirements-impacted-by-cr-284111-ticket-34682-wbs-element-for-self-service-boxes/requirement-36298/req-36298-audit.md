5.1.3REQUIREMENT: New Box
When a user creates a new box they must first specify the type of substrates in the box by

a)scanning a Vendor QR code, or

b)searching for a Box Article number, or

c)selecting to define the substrates manually

Depending on which method was selected the new box & substrates screen will have different behaviours.

The user must also specify whether the box is from the self-server station.

The following rules apply to all types of boxes

The box name

oMust be 1 to 12 characters in length using only alphanumeric characters or dash

oCannot be in the form #...#, B#...#, D#...# or T#...# ((B|D|T){0,1}\d+ regex) because that would be confused with other ECL ID formats in the system

A work order associated to the box must be selected
‎Only work orders that are not closed will be included in the lists

oA list of the 20 most recent work orders by the user will be provided by default
‎The recent work orders may be updated by the user themselves or if they are the owner of a box created by another user

oOtherwise the user must start typing to get a filtered list of the first 20 matching work orders

‘From Self-Serve Station’ will be preset to Yes if the user indicated the box is from the self-serve station (toggle Yes|No)

If ‘From Self-Serve Station” is Yes then WBS Element must be specified (maximum 60 characters in length)

oMust be in the format [prefix].##.##

oWhen a work order is selected the WBS Element prefix will be set to the work order’s number, if WBS Element does not have the proper format then it will be generated as [work order number].00.00

An owner for the box will be defaulted to the current user, but can be selected

A location for the box must be selected from the list of locations (predefined type of Box: Location)

A shelf # may be entered (not required, maximum 50 characters in length)

A comment may be entered (not required)

Additional rules may apply for the box depending on the type, see below for more details

PF will always generate a unique Box # with a prefix of “B”, set the entry date to today and reminder date to 6 months in the future.

PF will use the box capacity to display the list of slots numbered bottom up starting at slot 1. PF will automatically update the box occupancy to the total number of substrates in the box.

PF will automatically update the new substrates in the box to have a Substrate ID formatted as . (i.e. My Box.01).

The initial side for all substrates will always be A.

Save will be available once all rules are valid (including type dependent ones).

Cancel will prompt the user for confirmation. If they select Yes to confirmation PF will redirect to the boxes screen without creating the box. If they select No PF will continue creating the box.

After saving the status of the box and all of its substrates will be set to New and the user will be redirected to the detail view for the box.

Users must have the Boxes_Create security right to access this functionality.
