# Blocalm — UI Prototype (V1.0)

This folder contains the visual UI prototype for **Blocalm V1.0** (the calendar + planner + trusted-scheduling release described in `doc/01_Requirements/Blocalm_Requirement_Specification.md`).

## What's in here

| File | Purpose |
| --- | --- |
| `Blocalm_dashboard.html` | Single-file clickable prototype of the V1.0 main dashboard. Opens in any browser. |
| `README.md` | This file. |

## How to open

Just double-click `Blocalm_dashboard.html` — it opens in your default browser. No build step, no dependencies (Inter and Fraunces fonts load from Google Fonts; everything else is inline).

## What the prototype shows

The dashboard demonstrates the following V1.0 requirements visually:

| Requirement (from SRP §7) | Where in the prototype |
| --- | --- |
| FR-V1-007 Display Calendar Views | Day / Week / Month / Year tab switcher (Week is shown) |
| FR-V1-004/005/006 Create / Edit / Delete Event | Click any event or the **+** FAB → New Event modal |
| FR-V1-008 Manage Time Blocks | Wed "Deep Work Block" event spanning 3 hours |
| FR-V1-009/010 Tasks & Status | Today's Tasks panel on the right with checkable items |
| FR-V1-011 Recurring Events | "Call mom — Weekly · every Friday" task; recurrence selector in modal |
| FR-V1-012 Reminders | Reminder dropdown in the New Event modal |
| FR-V1-013 Event Categories | Color-coded events; pill selector in modal (Work / Personal / Health / Social / Study) |
| FR-V1-016 Display Friend Availability | Friends panel showing free / busy status |
| FR-V1-017/018/019 Schedule Requests | Requests cards with Accept / Propose / Decline buttons |
| FR-V1-022 Prevent Double Booking | (Visual cue only — handled at save-time in real app) |
| FR-V1-023 Manage Notifications | Bell icon in top bar with unread indicator |
| FR-V1-024 Privacy Settings | Visibility selector in modal: Private / Friends-see-busy / Shared |

## Design choices

- **Aesthetic:** clean and modern, with a soft warm-neutral background (`#FAF9F6`) and a calm purple-indigo accent (`#6E5BD9`). Designed to feel friendly to students and working professionals, and to leave visual room for the future mood-tracking direction (V3.0+) without committing to it now.
- **Typography:** Inter for UI, Fraunces (serif) for titles and date headings — gives the planner a slightly editorial, journal-like feel.
- **Category palette:** five soft pastels for Work / Personal / Health / Social / Study, paired with darker fg tones for accessibility.
- **Layout:** three columns — left nav (240px), main calendar (flex), right rail (320px) — provides a desktop/tablet reference for the Flutter app. Mobile layouts should adapt this into bottom navigation or a compact rail plus stacked panels.

## Suggested next step: translate to Flutter

The current project direction is a **Flutter cross-platform app** supported by Figma design/prototyping and a FastAPI backend. This HTML file should be treated as a visual reference for the first Flutter implementation, not as production frontend code.

| HTML element | Flutter translation |
| --- | --- |
| Top bar | `AppBar` or custom `PreferredSize` widget with search field and actions |
| Sidebar | `NavigationRail` on desktop/tablet; `NavigationBar` or drawer on mobile |
| Calendar week grid | Custom `Widget` using `GridView`, `Stack`, and positioned event blocks |
| Right rail (tasks, requests, friends) | Responsive side panel on wide screens; stacked sections or tabs on mobile |
| New Event modal | `showDialog`, `AlertDialog`, or modal bottom sheet depending on screen size |
| Color tokens | Define once in `ThemeData`, custom color extension, or shared design-token file |
| Local data | Persist private events, tasks, reminders, categories, and privacy settings with Drift/SQLite |
| Backend data | Connect shared features to the FastAPI REST API backed by PostgreSQL |

The HTML file uses CSS variables for all colors and spacing. These should be converted into Flutter theme tokens so the app keeps a consistent visual language across mobile and desktop.

## What's NOT in this prototype yet

These are deliberately deferred and can be added in follow-up screens:

- Login & registration screens
- Full month / year calendar views (only Week is implemented)
- Friends list management (add / remove / block)
- Settings screen (privacy, notifications, data export, account deletion)
- Group event creation flow
- Read-only event detail popover (currently clicking an event opens the editor)

## Feedback loop

When you and your friend review this, the easiest workflow is:
1. Open the file, click around (try the FAB, click an event, try the category pills, check off a task).
2. Note what you'd change — colors, spacing, missing fields, layout.
3. Record the feedback as design notes or issues, then translate approved changes into the Figma design and Flutter implementation.
