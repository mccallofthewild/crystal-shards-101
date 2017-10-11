# 💎 👩‍🏫 Crystal Shards 101

How to write and release Crystal Shards.

##

 [![Build Status](https://travis-ci.org/mccallofthewild/crystal-shards-101.svg?branch=master)](https://travis-ci.org/mccallofthewild/crystal-shards-101) [![Docs](https://img.shields.io/badge/docs-available-brightgreen.svg)](https://mccallofthewild.github.io/crystal-shards-101/) [![GitHub release](https://img.shields.io/github/release/mccallofthewild/crystal-shards-101.svg)](https://github.com/mccallofthewild/crystal-shards-101/releases)

## _What's a Shard?_
Simply put, a Shard is a package of Crystal code, made to be shared-with and used-by other projects.

## Installation

If you haven't already, install the latest version of the Crystal compiler.
[Installation instructions here](https://crystal-lang.org/docs/installation/)

...and if you haven't done that, 


## Usage

In this tutorial, we'll be making a Crystal library called _palindrome-example_.

> For those who don't know, a palindrome is a word which is spelled the same way forwards as it is backwards. 
  
> E.g. racecar, mom, dad, kayak, madam

### Creating the Project
Begin by using [the Crystal compiler](https://crystal-lang.org/docs/using_the_compiler/) to generate a new library in a subfolder of the current directory.

In your terminal, enter 
```bash
 $  crystal init lib palindrome-example
      create  palindrome-example/.gitignore
      create  palindrome-example/.editorconfig
      create  palindrome-example/LICENSE
      create  palindrome-example/README.md
      create  palindrome-example/.travis.yml
      create  palindrome-example/shard.yml
      create  palindrome-example/src/palindrome-example.cr
      create  palindrome-example/src/palindrome-example/version.cr
      create  palindrome-example/spec/spec_helper.cr
      create  palindrome-example/spec/palindrome-example_spec.cr
Initialized empty Git repository in /Users/YOUR_USER_NAME/.../palindrome-example/.git/
```

...and `cd` into the directory
```bash
cd palindrome-example
```

Then `add` & `commit` to start tracking the files with Git:

```bash
 $  git add -A
 $  git commit -am "First Commit"
[master (root-commit) 77bad84] First Commit
 10 files changed, 102 insertions(+)
 create mode 100644 .editorconfig
 create mode 100644 .gitignore
 create mode 100644 .travis.yml
 create mode 100644 LICENSE
 create mode 100644 README.md
 create mode 100644 shard.yml
 create mode 100644 spec/palindrome-example_spec.cr
 create mode 100644 spec/spec_helper.cr
 create mode 100644 src/palindrome-example.cr
 create mode 100644 src/palindrome-example/version.cr
```

### Writing the Code

The code you write is up to you, but how you write it impacts whether people want to use your library and/or help you maintain it.

#### TDD
- Test your code. All of it. It's the only way for anyone, including you, to know if it works.
- Crystal has [an awesome built-in testing library](https://crystal-lang.org/api/0.23.1/Spec.html). Use it!

#### Documentation
- Document your code with comments. All of it. Even the private methods.
- Crystal has [an awesome built-in documentation generator](https://crystal-lang.org/docs/conventions/documenting_code.html). Use it!

Run `crystal doc` and open the files in `/doc/` in your browser to see how your documentation is looking along the way. (the process of seeing your comments and code magically turned into documentation is surprisingly satisfying)

#### Coding Style 
- It's fine to have your own style, but sticking to [some core rubrics defined by the Crystal team](https://crystal-lang.org/docs/conventions/coding_style.html) can help keep your code consistent, readable and usable for other developers.


### Writing a README

A good README can make or break your project.
[Awesome README](https://github.com/matiassingers/awesome-readme) is a nice curation of examples and resources on the topic.

Most importantly, your README should explain: 
1. what your library is 
2. what it does
3. how to use it

This explanation should include a few examples along with subheadings.

NOTE: Be sure to replace all instances of `[your-github-name]` in the Crystal-generated README template with your Github username.

Fill out and insert the following block of markdown build badges below the description in your README. 
> The purpose of this is to inform users on the status of certain aspects of your repository. More on this in a minute.
```Markdown
[![Build Status](https://travis-ci.org/[YOUR-GITHUB-USERNAME]/[YOUR-REPOSITORY-NAME].svg?branch=master)](https://travis-ci.org/[YOUR-GITHUB-USERNAME]/[YOUR-REPOSITORY-NAME]) [![Docs](https://img.shields.io/badge/docs-available-brightgreen.svg)](https://[YOUR-GITHUB-USERNAME].github.io/[YOUR-REPOSITORY-NAME]/) [![GitHub release](https://img.shields.io/github/release/[YOUR-GITHUB-USERNAME]/[YOUR-REPOSITORY-NAME].svg)](https://github.com/[YOUR-GITHUB-USERNAME]/[YOUR-REPOSITORY-NAME]/releases)
```


### Writing a `shard.yml`

[The spec](https://github.com/crystal-lang/shards/blob/master/SPEC.md#names) is your rulebook. Follow it.

#### Name
Your `shard.yml`'s `name` property should be concise and descriptive. 

- Search [crystalshards.xyz](https://crystalshards.xyz/) to check if your name is already taken.

e.g.
```YAML
name: palindrome-example
```

#### Description
Add a `description` to your `shard.yml`. 

A `description` is a single line description used to search for and find your shard.

A description should be:
1. Informative
2. Discoverable

#### Optimizing
It's hard for anyone to use your project if they can't find it.
[crystalshards.xyz](https://crystalshards.xyz/) is currently the go-to place for Crystal libraries, so that's what we'll optimize for.

There are people looking for the _exact_ functionality of our library and the _general_ functionality of our library.
e.g. Bob needs a palindrome library, but Felipe is just looking for libraries involving text and Susan is looking for libraries involving spelling.

Our `name` is already descriptive enough for Bob's search of "palindrome". We don't need to repeat the _palindrome_ keyword. Instead, we'll catch Susan's search for "spelling" and Felipe's search for "text".
```YAML
description: |
  A textual algorithm to tell if a word is spelled the same way forwards as it is backwards.
```

### Github

- Create a repository with the same `name` and `description` as specified in your `shard.yml`.

- Add and commit everything:
```bash
$ git add -A && git commit -am "shard complete"
```
- Add the remote: 
```bash 
$ git remote add public https://github.com/[YOUR-GITHUB-NAME]/[YOUR-REPOSITORY-NAME].git
```
- Push it: 
```bash
$ git push public master
```

#### Github Releases
It's good practice to do Github Releases. 

Start by navigating to your repository's _releases_ page.
  - This can be found at _https://github.com/YOUR-GITHUB-NAME/YOUR-REPOSITORY-NAME/releases_

Click "Create a new release".

According to [the Crystal Shards README](https://github.com/crystal-lang/shards/blob/master/README.md), 
> When libraries are installed from Git repositories, the repository is expected to have version tags following a semver-like format, prefixed with a `v`. Examples: v1.2.3, v2.0.0-rc1 or v2017.04.1

Accordingly, in the input that says `tag version`, type `v0.1.0`. Make sure this matches the `version` in `shard.yml`. Title it `v0.1.0` and write a short description for the release.

Click "Publish release" and you're done!

You'll now notice that the Github Release badge has updated in your README.

Follow [Semantic Versioning](http://semver.org/) and create a new release every time your push to `master`.

### Setting up Travis CI and `.travis.yml`
If you haven't already, [sign up for Travis CI](https://travis-ci.org/).

Add the following lines to your `.travis.yml`:
```YAML
script:
  - crystal spec
```
This tells Travis CI to run your tests.

Commit and push to Github.

Follow [these guidelines](https://docs.travis-ci.com/user/getting-started/) to get your repo up & running on Travis CI.

Once you're up and running, and the build is passing, the Build badge will update in your README.


### Hosting your `docs` on Github-Pages

Add the following `script` to your `.travis.yml`:
```YAML
  - crystal docs
```

This tells Travis CI to generate your documentation.

Next, add the following lines to your `.travis.yml`.

```YAML
deploy:
  provider: pages
  skip_cleanup: true
  github_token: $GITHUB_TOKEN
  project_name: YOUR-GITHUB-REPOSITORY-NAME
  on:
    branch: master
  local_dir: doc
```

[Set the Environment Variable](https://docs.travis-ci.com/user/environment-variables#Defining-Variables-in-Repository-Settings), `GITHUB_TOKEN`, with your [personal access token](https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/).

If you've been following along, your `.travis.yml` file should look something like this:

```YAML
language: crystal
script:
  - crystal spec
  - crystal docs
deploy:
  provider: pages
  skip_cleanup: true
  github_token: $GITHUB_TOKEN
  project_name: YOUR-GITHUB-REPOSITORY-NAME
  on:
    branch: master
  local_dir: doc
```

[Click Here](https://docs.travis-ci.com/user/deployment/pages/) for the official documentation on deploying to GH-Pages with Travis CI.


## Contributing

1. Fork it ( https://github.com/mccallofthewild/crystal-shards-101/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [McCall Alexander](https://github.com/mccallofthewild) mccallofthewild - creator, maintainer
