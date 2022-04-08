# Git Branching Flow Guide
### Table of Contents
1. [Background](#background)
2. [Practical Applications](#practical-applications)
    1. [Example](#example-git-flow)
3. [TLDR](#tldr)

## Background
Read [this tutorial](https://www.atlassian.com/git/tutorials/merging-vs-rebasing/workflow-walkthrough). It provides a good, in-depth explanation
about rebasing vs. merging and why it's a good idea to choose a rebase
workflow. 

## Practical Applications
So, you read (or didn't actually bother to read) the above article and 
now understand why rebasing is a better idea than merging. Wonderful! 
Here's how to actually start doing that.

Our is set up with a master branch that contains
the most recent completed version of our website - the alpha version of our site, which we'll use to present.

There is a branch off of master called development. It has the most recent version of the website that we are still working on - the beta version of our site. 

Off of development there will be a number of feature branches. As implied by the name, a feature branch holds a feature that someone is working on - each feature branch contains a feature-in-progress that we want to add to the beta. A good convention for naming feature branches is the name of the developer whose feature it is, followed by a slash and the name of the feature. 

### Example Git Flow
I want to start working on the incidents archive page. I have a local copy of the repository and I am in the top level directory. Firstly, I `git pull` so I have the most recent version of the website. Then, I switch to the branch I want to base my new branch off of by running `git checkout development`. 

To create my branch, I run `git checkout -b maya/incident-archives`, which creates and switches me to a new local branch called `maya/incident-archives` per the naming convention. This branch does not yet exist in the remote repo, so to add it I use `git push -u origin maya/incident-archives`. The `-u` links my local branch with the remote branch, and the push actually updates the remote. 

Since the creation command switched me to my new branch, I begin work as usual, and once I want to commit, I use `git add -A`, `git commit -m "Updated archives CSS to match wireframe"` and `git push` (talk to me about modifying your git so you don't have to type `git push origin <branch_name>` every time).

Once I'm done with the feature, I add, commit and push as usual, and then start to rebase. I `git checkout development` to switch to the base branch and then `git pull` so I know it's the most recent. Then I `git checkout maya/incident-archives` and run `git rebase development`, which takes all the changes I made and moves them to after the most recent commit in development. 

I might run into some merge conflicts on the way, but I fix them and move on (just come find me about merge conflict resolution. I can't tell you how to fix them through text). Once I'm rebased off of development, I can create a pull request on Github by going to our repo page and clicking the "Create Pull Request" button by my branch. After the pull request is verified, I can merge my branch into development and delete it. 

In this case, Github does the merging for me, but if I didn't want to use their interface, I would `git checkout development` and `git merge --no-ff maya/incident-archives` and that would do the same thing. 

And then I'm done with the feature, so I move on to the next one by repeating the above process.

## TLDR

#### To create a feature branch
```
git checkout development
git pull
git checkout -b <branch_name>
git push -u origin <branch_name>
```
<br>

#### To commit on my feature branch
```
git add -A
git commit -m "<Some sensible commit message>"
git push origin <branch_name>
```
<br>

#### To rebase onto development after finishing a feature
```
git checkout development
git pull
git checkout <branch_name>
git rebase development
```
<br>

#### To merge rebased feature branch into development
Create a pull request

*or*

```
git checkout development
git merge --no-ff
git push origin development
```
