# AutoFoundry Marketing Site

## Source of Truth
- Authoring source path: `/home/tw/workspaces/autofoundry-marketing/repo`
- Live deploy target (Apache docroot): `/var/www/html/autofoundry`

## Rules
- Do not author directly in `/var/www/html/autofoundry`.
- Treat `/var/www/html/autofoundry` as runtime/deploy output only.

## Preview / Verify
- Basic local file check: `ls -la ./index.html ./pricing/index.html ./style.css`
- Live check after deploy: `curl -I https://autofoundry.ai/` and `curl -I https://autofoundry.ai/pricing/`

## Deploy
- Dry run:
  - `DRY_RUN=1 ./deploy_marketing_site.sh`
- Normal deploy (safe sync, no deletes):
  - `./deploy_marketing_site.sh`
- Optional destructive sync (explicit opt-in):
  - `ALLOW_DELETE=1 ./deploy_marketing_site.sh`

## Git Workflow
- Commit and review changes from this repo.
- Push to a dedicated marketing remote once created.
