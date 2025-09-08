# Tautulli Webhooks

Tautulli can send webhooks to platforms in order to notify of playback changes. Some will be sent to Home Assistant with information about what is being played, by who, and what the status of that stream is.

Home Assistant has automations configured to read these properties (who, what, when, etc) and send notifications via Telegram.
