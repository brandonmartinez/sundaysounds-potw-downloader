# sundaysounds-potw-downloader

Downloads the latest MainStage patch from the Sunday Keys insider patches.

## Execute

To download the latest patch locally, just execute `./run.sh` in git repository.
If you'd liked to specify a different directory, you can pass the directory
without the trailing slash to the script:

```sh
./run.sh "~/Documents/MainStage Patches"
```

## Schedule to Run Weekly

New patches are released every Wednesday. To schedule the script to run weekly,
create a cron job to run the script with the directory of your choosing.

Run `crontab -e` to open the vim editor, hit `i` to enter insert mode, and add
the following line:

```sh
0 8 * * WED /path/to/sundaysounds-potw-downloader/run.sh "/Users/username/your/download/directory"
```

Then hit `esc` to exit insert mode, type `:wq` to save and quit, and hit enter.
