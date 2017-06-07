[![Gem Version](https://img.shields.io/gem/v/gitv.svg)](https://rubygems.org/gems/gitv)
[![Build Status](https://travis-ci.org/rbld/rbld-plugin-hello.svg?branch=master)](https://travis-ci.org/rbld/gitv)
[![Build Status](https://ci.appveyor.com/api/projects/status/github/rbld/gitv?branch=master&svg=true)](https://ci.appveyor.com/project/daynix/gitv)

```gitv``` is yet another gem for versioning based on git tags.

## Installation

Run

    gem install gitv

Usage

  From shell:

  ```bash
  gitv
  ```

  From ruby code:

  ```ruby
  gitv = GitV.new(src_root, version_file) # src_root defaults to PWD
                                          # version_file defaults to PWD/lib/data/version
  gitv.version # Retrieve version (either from git tags or cached)
  gitv.cache   # Cache version number and return cache file name
  ```

  See also ```gitv.gemspec``` for usage example.

---

    This gem is licensed under the Apache License, Version 2.0.
    See LICENSE for the full license text.
