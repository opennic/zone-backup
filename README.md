# zone-backup

Hourly backups of every OpenNIC top-level domain zone. This script is run on a server operated by [@JonahAragon](https://github.com/JonahAragon) that downloads each zone from its respective primary nameserver, see `run.sh` for details.

## `output`

These files contain the output of `dig +onesoa +nocomments +nocmd +nostats AXFR $1 @$2` (the full zone, without Dig's comments).

## `output/include`

These files are the zone files, without the zone's `SOA`, `NS`, and DNSSEC-related records.

***Why is this useful?*** These records can be implemented in an existing zone, which can be useful if you are planning on taking over a zone and adding your own records, while still preserving previously existing records: *See [zytrax.com/books/dns/ch7/include.html](http://www.zytrax.com/books/dns/ch7/include.html)*.

## Running a local copy

`run.sh` is a very simple script that will generate all the zones automatically. You may need to edit or remove the Git specific commands to fit your needs.

## What if a zone is deleted?

Any zones that are removed from the master nameserver will be overwritten here as well at the next backup. The easiest way is to look through the [commit history] to find the last up-to-date zonefile before it was deleted.

Additionally, OpenNIC team members will be tagging "verified" zone files periodically. You can look through [this repository's tags](https://github.com/opennic/zone-backup/tags) to find the last known good copies of all zones. These tags will be GPG signed with a verified key.

Zone files not included within a "verified" Git tag should not be considered trustworthy necessarily, as they are updated by an automatic process. Ensure you check the zonefile's contents against some other method or use the last verified tag.

## GPG Keys

**Team members:** If you are signing tags, please add your GPG fingerprint and a link to your key below that they will be signed with. See ["Signing Your Work"](https://git-scm.com/book/en/v2/Git-Tools-Signing-Your-Work) at git-scm.com for details.

- [@JonahAragon](https://github.com/JonahAragon) `9BD822880E2784EE5C929CD6DB49BB255B868219` ([Mirror 1](https://jda.mn/pgp/), [Mirror 2](https://keybase.io/jonaharagon/pgp_keys.asc?fingerprint=9bd822880e2784ee5c929cd6db49bb255b868219))
