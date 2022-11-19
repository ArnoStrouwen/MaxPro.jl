name: GitHub Actions Version Updater

# Controls when the action will run.
on:
  schedule:
    # Automatically run on every Sunday
    - cron:  '0 0 * * 0'

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v2
        with:
          # [Required] Access token with `workflow` scope.
          token: ${{ secrets.WORKFLOW_SECRET }}

      - name: Run GitHub Actions Version Updater
        uses: saadmk11/github-actions-version-updater@v0.7.1
        with:
          # [Required] Access token with `workflow` scope.
          token: ${{ secrets.WORKFLOW_SECRET }}
