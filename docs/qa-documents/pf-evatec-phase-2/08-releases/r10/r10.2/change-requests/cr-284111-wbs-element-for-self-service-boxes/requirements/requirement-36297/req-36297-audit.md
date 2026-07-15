# Audit — Requirement 36297: Boxes

## Requirement Reference

- **Requirement ID:** 36297
- **CR:** 284111
- **Ticket:** 34682
- **Title:** WBS Element for Self-Service Boxes

---

## Requirement Summary

- The Boxes screen lists all boxes with basic information and current status.
- Users with `Boxes_Create` can create new boxes.
- Users with `Boxes_Edit` can edit active boxes.
- Users with `Boxes_Transfer` can transfer substrates from active boxes.
- Users with `Boxes_Remove` can remove active boxes.
- Users must have `Boxes_View` to access the screen.
- Sorting and filtering state is preserved in the URL.
- Global user filtering defaults the owner filter to the current user.
- Users can toggle between active boxes and all boxes (including removed).

### CR 284111 Additions

- New box wizard gains a step: "Is the box from the Self-Serve Station?" (Yes / No).
- Selecting **Yes** sets `IsSelfServe = true`.
- When `IsSelfServe = true`, the **WBS Element** field is required and visible.
- WBS Element is pre-populated as `{ExternalId}-##-##`.
- WBS Element must match the pattern `(-\d\d){2}$` and have a max length of 60 characters.
- When the work order changes, WBS Element is updated to `{newExternalId}-##-##`.
- When `IsSelfServe = false`, the WBS Element field is hidden and saved as null.
- In read-only and deleted views, WBS Element is shown only when `IsSelfServe = true`.
- Box list gains a **Self-Serve** column (Yes / No) with a dropdown filter.
- Entry date filter is updated to support a **date range**.

---

## Coverage Assessment

### Test Cases Required

- New box wizard — self-serve step with Yes selection (happy path)
- New box wizard — self-serve step with No selection (WBS field hidden)
- Create box — WBS Element pre-population from work order external ID
- Create box — WBS Element validation (invalid pattern)
- Create box — WBS Element validation (exceeds 60 characters)
- Create box — change work order updates WBS Element prefix
- Edit box — toggle IsSelfServe from No to Yes, WBS field appears
- Edit box — toggle IsSelfServe from Yes to No, WBS field hidden and nulled
- View box — WBS Element visible when IsSelfServe = true
- View box — WBS Element hidden when IsSelfServe = false
- Box list — Self-Serve column present and filterable
- Box list — Entry date filter accepts date range
- Permissions — Boxes_Create, Boxes_Edit, Boxes_View, Boxes_Transfer, Boxes_Remove

### Coverage Gaps

- No existing test cases found for this requirement.
- All scenarios require new test case authoring.

---

## Recommendations

- Prioritize happy path and WBS validation scenarios first.
- Include a boundary test at exactly 60 characters for WBS Element.
- Verify WBS null persistence when IsSelfServe is toggled back to No.
- Confirm URL state preservation includes the new Self-Serve filter.

---

## Notes

- Pattern validation: `(-\d\d){2}$`
- DB types: `IsSelfServe` = bit, `WbsElement` = varchar(60)
- WBS Element is nulled in the mapper when `IsSelfServe = false`
