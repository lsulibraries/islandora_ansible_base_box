## General Description

This is an ansible configuration for LSU's Islandora deployment. The base configuration is accomplished largely through the plays found under `roles/`. Ongoing configuration customizations are managed through a growing number of 'migrations', small ansible plays manage configurations such as: 

- the presence and status of drupal modules, features, themes,
- cron jobs
- logging parameters

These migrations are highly specific to LSU's multisite deployment and are held in a private repo at the moment. If you want to build the base box, update the `Vagrantfile` to use `build.yml` instead of `local.yml` as the top-level playbook.

## Local Information

### Branches

Branches follow numbering that aligns with project milestone numbering. Branch LDL-0.5.x has a corresponding column in the roadmap Trello board https://trello.com/b/DFu4JyQv/islandora-roadmap. 


### Releases and migrations

Project planning milestones are space about a month apart, but during the month, there may be many opportunities to push new features to the production system (a new _release_). Release numbering is sequential, `LDL-0.5.5.0`, `LDL-0.5.5.1`... and _contains_ one or more _migration_, which are named accourding to the time of creation: `migration-yyyymmddhh.yml`. 

Branch and release playbooks exist in the top-level of the repo. The conceptual arrangement looks like this directory structure:

~~~
.
├── LDL-0.5.x
│   ├── LDL-0.5.5.0
│   │   ├── migration-2016112203.yml
│   │   └── migration-2016112314.yml
│   ├── LDL-0.5.5.1
│   │   ├── migration-2016112713.yml
│   │   └── migration-2016112803.yml
│   ├── LDL-0.5.5.2
│   │   ├── migration-2016120110.yml
│   │   └── migration-2016120112.yml
│   └── LDL-0.5.5.3
│       └── migration-2016120210.yml
└── LDL-0.6.x
    ├── LDL-0.6.0
    │   └── migration-2016120411.yml
    ├── LDL-0.6.1
    │   ├── migration-2016120518.yml
    │   ├── migration-2016120519.yml
    │   └── migration-2016120520.yml
    └── LDL-0.6.2
        └── migration-2016120808.yml
~~~


### Build

- git clone --recursive https://github.com/lsulibraries/islandora_ansible
- cd islandora_ansible
- git checkout LDL-0.5.x     # or whatever...
- vagrant up

#### Known issues:

- fetching the geshi library from sourceforge may time out (migration-2016111711.yml).

### Sample collections

once you have 

1. created the parent through the Islandora GUI and 
2. copied a small zipped collection to your islandora_ansible/ directory (for example, ulm-p15140coll27.zip), 

log into the box with 'vagrant ssh' and become root.

~~~

sudo su

# Navigate to the drupal root for the main LDL site:
cd /var/www/ldl/sites/ldl

# Run the batch scan preprocess step as user 1, 
# specifying the .zip location, the desired namespace, 
# and the parent collection.
drush -v -u 1 icbp --target=/vagrant/ulm-p15140coll27 --namespace=ulm-p15140coll27 --parent=ulm-p15140coll27:collection

# this will create a batch job and will return a message containing its numeric ID, in this case, 54.

# Kick off the actual ingest process.
drush -u 1 ibi 54

~~~
