# 🧟 DIT vs ZOMBIES

> **A top-down 2D zombie game set across a hand-recreated version of DIT University, Dehradun.**

**DIT vs ZOMBIES** is a top-down 2D zombie game built in **Godot Engine 4.3**.

The idea is simple:

**What if you could explore the entire DIT University campus while it's overrun by zombies?**

The game recreates the campus layout with roads, buildings, parking areas and other recognizable locations, giving players a chance to explore a familiar environment while trying to survive a growing zombie threat.

There is currently no traditional story, mission structure, or final ending. Instead, the game is designed as an **open-ended survival/exploration experience** where you can freely explore the campus, fight zombies, restore your health, and try to survive for as long as possible.

---

## 🎮 Gameplay

You start at the **college entrance** and can freely travel through the campus.

There is no fixed mission path.

Explore the roads, parking areas and campus environment while encountering zombies along the way.

### Current gameplay loop

```text
ENTER CAMPUS
     ↓
EXPLORE
     ↓
ENCOUNTER ZOMBIES
     ↓
SHOOT & SURVIVE
     ↓
EXPLORE FURTHER
     ↓
RETURN / KEEP EXPLORING
     ↓
SURVIVE AS LONG AS POSSIBLE
```

If your health reaches zero, you die and can try again.

The game is intentionally designed without a conventional beginning → mission → ending structure. It is currently more of a **free-roam zombie survival playground**.

---

## 🔫 Combat

The player currently uses **dual pistols**, although only one pistol is currently functional.

### Player

* ❤️ **100 health**
* 🔫 Pistol
* ♾️ Infinite ammunition
* 🎯 Direct shooting
* 💊 Health restoration

### Zombies

There are currently **112 zombies** placed throughout the campus.

* 🧟 49 zombies are actively roaming and attacking
* 🚧 63 zombies are positioned behind barricades
* 🩸 Zombie contact deals **10 damage**
* 👥 All zombies use the same basic zombie type
* 🧠 Zombies detect and chase the player when within their detection range

The barricaded zombies are not just decorative. They are functional zombies that can become part of future gameplay events.

---

## 🧟 Zombie AI

The current zombie AI is intentionally simple and lightweight.

Each zombie:

1. Detects the player within a defined range.
2. Calculates the direction toward the player.
3. Moves toward the player.
4. Stops when it reaches the player.
5. Deals damage once per second while in attacking range.

The current implementation uses Godot's `CharacterBody2D` and `move_and_slide()` system.

This keeps the AI straightforward while allowing a large number of zombies to exist simultaneously on the map.

---

## 🗺️ The Campus

One of the main ideas behind the project is the **campus itself**.

The game is based closely on the real **DIT University campus in Dehradun**.

The map was created by manually sketching the environment and then refining the artwork digitally/with AI assistance, using visual references including Google Earth.

The goal isn't to create a generic zombie map.

It's to create a recognizable version of **the actual campus**.

### Current playable environment

* 🏫 Campus roads
* 🚗 Parking areas
* 🌳 Outdoor areas
* 🚧 Barricaded sections
* 🏢 Campus buildings/environment

The map is intentionally large, allowing the player to freely travel around the campus.

---

## 🕹️ Controls

### PC

| Action     | Key     |
| ---------- | ------- |
| Move Up    | `W`     |
| Move Down  | `S`     |
| Move Left  | `A`     |
| Move Right | `D`     |
| Shoot      | `SPACE` |

There is currently no reload mechanic because ammunition is unlimited.

---

## 🎨 Art & Assets

A major part of the project was creating the game's visual assets from scratch.

The development process included:

* ✏️ Hand-drawn concepts
* 🎨 Custom sprite creation
* 🤖 AI-assisted refinement
* 🗺️ Hand-created campus layout
* 🌍 Real-world campus references
* 🎮 Custom game UI

Some assets were initially drawn on paper and then recreated/refined digitally with AI assistance.

The campus environment was also developed using the real DIT University layout as a visual reference.

No external music or sound library is currently used for the game.

---

## 🛠️ Technology

### Engine

**Godot Engine 4.3**

### Language

**GDScript**

### Platforms

Currently developed for:

* 🖥️ Windows

Planned:

* 📱 Android

### Plugins

No external Godot plugins or addons are currently used.

---

## 🧠 Development

This project is primarily a learning and experimentation project.

The game was developed independently with assistance from **ChatGPT and Claude** during development.

The AI tools were mainly used for:

* Debugging
* Understanding Godot systems
* Code suggestions
* Problem solving
* Iterating on gameplay systems
* Asset refinement

However, the generated solutions were often modified, rejected, or rewritten during development when they didn't work with the actual project.

The goal was not simply to generate a game with AI, but to **build and understand the systems while using AI as a development assistant**.

---

## ⚙️ Systems Currently Implemented

| System              | Status |
| ------------------- | ------ |
| Player movement     | ✅      |
| Zombie movement     | ✅      |
| Zombie detection    | ✅      |
| Zombie attacks      | ✅      |
| Player health       | ✅      |
| Health restoration  | ✅      |
| Shooting            | ✅      |
| Infinite ammunition | ✅      |
| Zombie collision    | ✅      |
| Player collision    | ✅      |
| Camera following    | ✅      |
| Camera boundaries   | ✅      |
| Background music    | ✅      |
| Large zombie groups | ✅      |
| Campus environment  | ✅      |
| Death / retry       | ✅      |

---

## 📸 Screenshots

> Screenshots and gameplay footage will be added here as development continues.

### Campus

![Campus](screenshots/campus.png)

### Zombie Horde

![Zombie Horde](screenshots/zombie-horde.png)

### Gameplay

![Gameplay](screenshots/gameplay.png)

---

## 🚧 What's Next?

The current version focuses on the core free-roam survival experience.

Future development may include:

* 📱 Android support
* 🕹️ Virtual joystick controls
* 🔘 Mobile shooting controls
* 🧟 More zombie gameplay
* 👑 Boss encounters
* 📖 Story elements
* 🗺️ Additional areas
* 🔫 More weapons
* 🎬 More scripted events
* 💥 Larger zombie encounters
* ✨ General gameplay and visual polish

These features are part of the future direction of the project and are **not currently part of the finished game**.

---

## 📦 Running the Project

### Requirements

* Godot Engine **4.3**
* Windows PC

### Run from Godot

1. Clone the repository.
2. Open **Godot 4.3**.
3. Import the project.
4. Open the project.
5. Press **Play**.

### Windows Build

A Windows build can be exported through:

```text
Project
   ↓
Export
   ↓
Windows Desktop
   ↓
Export Project
```

Keep the exported executable and its associated files together.

---

## 🎯 Why I Made This

This project started as an experiment in **building a game around a real environment that I actually know**.

Instead of creating a fictional city or generic zombie level, I wanted to see what it would feel like to turn a familiar university campus into a zombie survival environment.

It also serves as a practical way to learn:

* Game development
* Godot
* GDScript
* 2D physics
* Enemy AI
* Collision systems
* Game UI
* Level design
* Asset creation
* Performance considerations
* Cross-platform development

---

## 📍 Project Status

### **Playable — Core Game Complete**

The current version has a fully playable core experience:

**Explore → Fight → Survive → Restore Health → Keep Exploring**

There is no traditional campaign ending at the moment.

The project will continue to evolve as new gameplay systems and ideas are added.

---

## 👨‍💻 Developer

### Kartikey Bhardwaj

B.Tech Computer Science Engineering
DIT University, Dehradun

Built as a personal game-development project.

---

## ⭐ Support

If you found the project interesting, feel free to:

⭐ Star the repository
🐛 Report bugs
💡 Suggest ideas
🎮 Try the game
📢 Share the project

---

> **Welcome to DIT.**
>
> **Except this time, the campus isn't safe.** 🧟
