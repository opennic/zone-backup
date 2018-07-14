# zone-backup

Hourly backups of every OpenNIC top-level domain zone. This script is run on a server operated by @JonahAragon that downloads each zone from its respective primary nameserver, see `run.sh` for details.

## `output`

These files contain the output of `dig +onesoa +nocomments +nocmd +nostats AXFR $1 @$2` (the full zone, without Dig's comments).

## `output/include`

These files are the zone files, without the zone's `SOA`, `NS`, and DNSSEC-related records.
