# Ansible Role: Install Maven

Installs Maven on Ubuntu servers.

## Requirements

After execute the roles, please reload the shell.

```
$ exec $SHELL -l
```

## Role Variables

Available variables are listed below, along with default values (see `defaults/main.yml`):

    maven_version: {{ maven_version_specified | default('3.3.9') }}

The default version to install is 3.3.9. Define another value as `maven_version_specified` if you want to change it.

    maven_major_version: {{ maven_version | regex_search('^[0-9]+') }}

`maven_major_version` is automatically extracted by value of `major_version`

    maven_target_url: "http://www-eu.apache.org/dist/maven/maven-{{ maven_major_version }}/{{ maven_version }}/binaries/apache-maven-{{ maven_version }}-bin.tar.gz"

`maven_target_url` is also automatically extracted.

    maven_install_dir: "/opt"

maven is installed as /opt/maven  in default.    
