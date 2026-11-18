# RANKED IRL crew for StarNet

This folder adds **VOLT**, a growth agent that markets RANKED IRL and runs side revenue (Etsy art shop
first). It uses StarNet's built-in **Import Agent** (OpenClaw format) and built-in **Telegram** channel,
so StarNet's own code is unchanged.

```
crew/
  rankedirl-hq/workspace/   ← import this folder (SOUL, IDENTITY, AGENTS, USER, MEMORY)
  MONEY.md                  ← money opportunities + free/cheap model options
```

## 1. Start StarNet (from source) — the free way

One time, sign the `claude` command in to your Claude subscription (opens the browser):

```bash
claude auth login
```

Then always start StarNet with the launcher:

```bash
~/Projects/starnet/crew/start-free.sh
```

Why the launcher: `~/.zshrc` exports a paid `ANTHROPIC_API_KEY`. A StarNet started straight from a terminal hands that
key to Claude Code, so every agent turn is billed to the API account. The launcher removes it for StarNet only, so
CLAUDE CODE runs on your subscription. (It also runs `npm ci` the first time; the main README says the sidecar
needs no install, but this checkout needs `ajv` from npm.)

Note: `~/.claude/settings.json` also points the `claude` command at OpenRouter with an OpenRouter key. StarNet
ignores that file (it runs Claude Code with `--setting-sources ""`), but your own `claude` sessions in a terminal
will still go through OpenRouter until you remove those two `env` entries.

Open http://localhost:8787. (Or install the desktop build from the releases page in the main README.)

## 2. Give it a brain without buying new credits

Pick one on the first-run brain screen, or later in **SETTINGS → PROVIDERS**:

| Option | Cost | Notes |
| --- | --- | --- |
| **CLAUDE CODE** | already paid (your Claude plan) | Uses the `claude` CLI you're signed in to. No key stored in StarNet. Best quality. Watch your plan's usage limits. |
| **GEMINI** (Google AI Studio key) | free tier | Flash models only on the free tier; limits are small and change — check AI Studio for your real numbers. Free-tier prompts may be used by Google to improve products. |
| **OPENROUTER** `:free` models | free | **Recommended on this Mac.** `nvidia/nemotron-3-ultra-550b-a55b:free` — tested 2026-11-18: answers in ~2 s and makes correct tool calls. 20 req/min; 50 req/day, or 1,000/day once you've bought $10 of credits once. Free models come and go — if one errors, pick another `:free` model with tool support. |
| **OLLAMA** (local) | free | Measured on this 2015 Intel MacBook: `qwen3:4b` runs ~3 words/s (about 4 min per answer) — too slow for agents here. Fine on Apple Silicon. `:cloud` models now need a paid Ollama plan. |

Tip: run VOLT's daily scans on a free model, and switch to Claude Code for writing that matters (launch posts, listings).

## 3. Import VOLT

**MARKETPLACE → ⇪ IMPORT AGENT → PICK FOLDER…** and choose:

```
~/Projects/starnet/crew/rankedirl-hq/workspace
```

The preview should say **VOLT** with sources SOUL.md, AGENTS.md, USER.md, MEMORY.md, IDENTITY.md. Mint the agent, then place it in a room that has the web, browser, files and memory objects (a room = what the agent is allowed to do).

## 4. Connect Telegram

1. In Telegram, message **@BotFather** → `/newbot` → pick a name and a username ending in `bot`. Copy the token.
2. In StarNet: **CONNECT → MESSAGING → TELEGRAM**. Paste the token into **Bot token** → **CONNECT**.
   - Want a separate Telegram contact just for VOLT? Use **ADD A BOT**, paste a second token, choose **VOLT**.
3. Click **PAIR OWNER**, copy the whole `/pair …` message StarNet shows, and send it to **your new bot** (not BotFather) within 10 minutes.

⚠️ **Use a new bot, not your WebAgency agency bot.** Telegram lets only one program read a bot's messages at a time, so sharing a token makes both systems drop messages.

The token stays on your machine (OS keychain). Never paste it into chat or commit it.

## 5. Put VOLT on a schedule

In VOLT's panel → schedules (cron), add:

| When | Task |
| --- | --- |
| Daily 08:00 | "Run your Daily marketing routine from AGENTS.md and send me the Telegram summary." |
| Mon 09:00 | "Run your Weekly marketing routine: creator list, ASO check, Reddit drafts, weekly report." |
| Wed 10:00 | "Run the Weekly Etsy loop and hold all listings for my approval." |

Turn on **Night Shift** only with a tight budget and leash. VOLT holds anything public or paid for your OK.

## Ground rules baked into VOLT
- Never posts, DMs, lists, buys or accepts terms without your yes over Telegram.
- Never invents stats, reviews or testimonials; never uses trademarks or other artists' work.
- Discloses AI use and print-on-demand partners on Etsy listings.
