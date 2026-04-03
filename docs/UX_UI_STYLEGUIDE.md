# AutoFoundry — UX / UI Style Guide

---

# 🎯 Philosophy

This is not a chatbot page.

This is a Founder Control Console.

UI must feel:

- Structured
- Deterministic
- Professional
- System-like
- Calm under load

---

# 🏗 Layout System

3-column shell:

[ Teams Panel ] [ Agents Panel ] [ Main Work Area ]

CSS:

.shell--panels {
  display: grid;
  grid-template-columns: 320px 360px 1fr;
  height: 100vh;
}

Side panels:
- Fixed height (100vh)
- Independent vertical scroll
- No horizontal scrollbars

Main pane:
- Only region that scrolls

---

# 🧱 Tile System

Tile requirements:

- No overflow
- Ellipsis for long text
- Right-side status badge only
- Consistent padding (reduced to avoid clipping)

---

# 🏷 Badge System

Only right badge flips state.

States:

Ready:
- Green
- Class: badge--ready

Working:
- Amber
- Class: badge--working

Subtitle:
- Always descriptive text
- Never replaced with “Working”

---

# 🔄 Working State Rules

Agent tile shows Working if:

- Any network request is in-flight
- Agent-specific request tracker > 0

Buttons must:

- Disable while in-flight
- Prevent spam
- Clear state via finally blocks

---

# 🧠 Organizational Model

UI reflects org chart:

Founder/CEO
CTO
CMO
CRO
CFO

Locked agents indicate roadmap depth.

Active agents signal current capability.

---

# 🎨 Visual Tone

- Dark theme control console
- Structured spacing
- Minimal animation
- Status-driven color use
- No playful UI
- No unnecessary gradients

---

# 🚀 Deployment Contract

All UI changes must deploy via:

make ui-deploy-fast
make ui-deploy

Strict VERSION match required.

No manual rsync.
No ad-hoc service restarts.

---

# 🏁 Design Standard

The UI must feel:

Like a control tower.
Not a landing page.
Not a demo.
Not a chat toy.