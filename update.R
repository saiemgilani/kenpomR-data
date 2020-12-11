library(kenpomR)
library(tidyverse)
library(git2r)
# New Year Data Repo Recreation
repo <- git2r::repository('./') # Set up connection to repository folder
version <- "0.0.0.9"

git2r::add(repo, glue::glue("data/*"))
git2r::commit(repo, message = glue::glue("Updated Team Pages {Sys.time()} using kenpomR version {version}")) # commit the staged files with the chosen message
git2r::pull(repo) # pull repo (and pray there are no merge commits)
git2r::push(repo, credentials = git2r::cred_user_pass(username = Sys.getenv("ghub"), password = Sys.getenv("gh_pw"))) # push commit
