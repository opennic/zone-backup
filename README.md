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

## GPG keys

**Team members:** If you are signing tags, please add your GPG fingerprint and a link to your key below that they will be signed with. See ["Signing Your Work"](https://git-scm.com/book/en/v2/Git-Tools-Signing-Your-Work) at git-scm.com for details.

- [@JonahAragon](https://github.com/JonahAragon) `9BD822880E2784EE5C929CD6DB49BB255B868219` ([Mirror 1](https://jda.mn/pgp/), [Mirror 2](https://keybase.io/jonaharagon/pgp_keys.asc?fingerprint=9bd822880e2784ee5c929cd6db49bb255b868219))

## Creating signed tags

Simply run `git tag -s vX.X -m 'I verified these zones'` in this repository. You must have a GPG key configured on your computer.

Replace `vX.X` with the following numbering scheme:

- **Major:** Currently `1`, only increase this value if a **new** zone has been added since the previous tag, or a zone that existed in the previous tag has been deleted.
- **Minor:** Increase this value by 1 on every new commit. Resets to `0` after a Major version change.

## Verifying tags

`git tag -v vX.X` will show information about a tag. For example:

```
DELTA:zone-backup jonaharagon$ git tag -v v1.0

object dff545b84fce21542ffcd0210d1829e10493908b
type commit
tag v1.0
tagger Jonah Aragon <jonah@triplebit.net> 1531587824 -0500

First good zonefiles
gpg: Signature made Sat Jul 14 12:03:44 2018 CDT
gpg:                using RSA key 46304652EF5786F1E0A2AF53FDA1FDB64086F4B1
gpg: Good signature from "Jonah Aragon <redacted>" [ultimate]
gpg:                 aka "Jonah Aragon <redacted>" [ultimate]
gpg:                 aka "Jonah Aragon <redacted>" [ultimate]
gpg:                 aka "Jonah Aragon <redacted>" [ultimate]
gpg:                 aka "Jonah Aragon <redacted>" [ultimate]
Primary key fingerprint: 9BD8 2288 0E27 84EE 5C92  9CD6 DB49 BB25 5B86 8219
     Subkey fingerprint: 4630 4652 EF57 86F1 E0A2  AF53 FDA1 FDB6 4086 F4B1
```

This shows that this tag was signed with my `BB25 5B86 8219` key (using the `FDB6 4086 F4B1` subkey).
