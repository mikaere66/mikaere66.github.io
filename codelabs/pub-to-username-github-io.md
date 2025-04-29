authors: Michael Mossman
categories: github
feedback link: https://github.com/mikaere66/mikaere66.github.io/issues
id: pub-to-username-github-io
status: Published
summary: How to Publish codelabs to <username>.github.io

# Publish your codelabs to GitHub

<!-- 1. Start Section -->
## Check Prerequisites
Duration: 0:02:00

These instructions assume that you have successfully run both the `export` and `dist` commands on your own codelab, as outlined in my [other Codelabs](https://mikaere66.github.io) and are ready to <I>commit the artifacts into your preferred serving vehicle</I>, in this case <B>GitHub</B>.

It's also assumed that you <B>have a GitHub account</B> already set up and <I>can</I> <B>log in</B>!

### Next Steps
These are the steps that we're going to cover in this tutorial:
1. `git` package is installed
2. Create a GitHub Pages repo
3. Generate an Access token
4. Create local ReadMe file
5. Initialize your Local repo
6. Push files to GitHub repo
7. Test upload success
8. Troubleshooting, if req'd

> aside negative
> Important: in <I>all</I> cases throughout this tutorial, please substitute <B>&lt;username&gt;</B> (including the angle brackets) with <I>your</I> actual GitHub username

### Check for Git package
Run the following command in your terminal to check if the `git` package is installed:
``` bash
$ which git
```
If you <B>get output showing the full path</B> to the `git` executable, then skip to the next section.

However, if you <B>get no output</B> whatsoever, then you need to install the `git` package from your distro's repositories.

To do that, run the following command in your terminal:
``` bash
$ sudo apt update && sudo apt install git
```
You should now be able to move on to the next section ...
<!-- End Section -->

<!-- 2. Start Section -->
## GitHub Pages Repo
Duration: 0:01:30

> aside positive
> The big green button below will actually take you to the correct GitHub page for creating a new repository: <B>https://github.com/new</B>
> <P>Tip: right-click the button and select <B>Open link in new window</B> so that <I>this</I> and <I>that</I> page can be positioned side-by-side</P>

Start by going to <button>[Create a new repository](https://github.com/new)</button>

Under <B>Repository name</B> enter `&lt;username&gt;.github.io`

Once your <B>Repository name</B> is verified as <B>available</B>, leave all other fields with their defaults, then scroll down and click the <B>Create repository</B> button at bottom-right

As soon as GitHub creates your new repository, you'll be presented with a few suggestions to get you started.

If you would like to save these steps for future reference, then copy/paste them into an empty text-file <B>now</B>, before moving on with next steps, because once you navigate away from that page, you'll never see them again!
<!-- End Section -->

<!-- 3. Start Section -->
## Generate an Access token
Duration: 0:04:30

Obviously, your GitHub account is password protected, which is a good thing. Not only does this protect unauthorized access in a web browser, but also at the command-line.

In order to publish files to your new GitHub repository, you need a secure mechanism to allow <B>only you</B> to access your account, however just typing in your password is not secure enough!

This is where GitHub access tokens come into play. By creating an access token on the GitHub website itself, then using that token in lieu of your password at the command-line, you increase your security-level exponentially.

You may have seen this mentioned in Linux before: <B>With great power comes great responsibility</B>

> aside positive
> Tip: once you get to the <B>Personal access tokens (classic)</B> step below, create a Bookmark in your browser, so that you can quickly get back to that page in future ... the bookmark would point to <B>https://github.com/settings/tokens</B>

To create a GitHub access token, you need to go to Developer Settings. To do this, follow these steps:
* Once logged in, click your profile pic in the top-right corner of the GitHub website
* Select &sext; Settings about 2/3 of the way down the menu
* Scroll down and select &LeftAngleBracket;&RightAngleBracket; Developer Settings on the left
* Once in Developer Settings, click the drop-down arrow next to <B>Personal access tokens</B> and select <B>Tokens (classic)</B>
* Find the <B>Generate new token</B> menu, either at top-right or in the middle of the page, then click it and select <B>Generate new token (classic)</B>

At this point, you <I>may</I> be asked to re-enter your GitHub password ... remember, this is a good thing =)

Once you've reached the <B>New personal access token (classic)</B> section, you are presented with <I>alot</I> of choices, but don't worry ... you're only interested in a few!

* Start by entering a reference/note regarding this particular access token ... usually something like the current <I>stage</I> of your project. Just for today, type in `First commit`
* Next, you want to set an Expiration date ... it's best to keep this as <I>short</I> as possible, so click the drop-down menu and select <B>Custom...</B>
* Click the little calendar icon for <B>Show date picker</B>, and select `tomorrow's date` which is the minimum allowed (it will be highlighted with a gray square)
* Now, at the top of the list (under <B>Select scopes</B>) click the first checkbox to select-all in the <B>repo</B> scope (Full control of private repositories)
* Scroll down a little, and under the <B>admin:org</B> scope, select only the <B>read:org</B> checkbox (Read org and team membership, read org projects)
* Scroll down some more, and click the checkbox to select <B>gist</B> (Create gists)

That's it ... now, scroll to the bottom of the list and click the <B>Generate token</B> button

Next, you will be presented with the original <B>Personal access tokens (classic)</B> page, but now it will list your current token(s)

> aside negative
> Important: be aware that by <I>coming back</I> to the <B>Personal access tokens</B> page at a later time, the access tokens <I>themselves</I> will <B>not be visible</B> ... so, either keep that browser tab open while you work, or copy/paste the new access token to a temporary file

Please keep this information safe, and <B>do not share</B> access tokens, as that could pose a huge security risk (no so much from your friend/colleague, but from the information transfer)
<!-- End Section -->

<!-- 3. Start Section -->
## Create local ReadMe file
Duration: 0:01:00

Remember when GitHub created your new repository, and you were presented with a few suggestions to get you started?

In this section, we're going to follow the suggestions that were outlined under <B>Create a new repository on the command line</B>, but with a few minor changes ...

Open your terminal in (or `cd` into) the <B>parent</B> directory containing your `dist` folder, which should be `site` ... if you <B>don't</B> see a `dist` folder, you may need to re-run the `claat export ...` command.

Remove the existing `README.md` file by running the following command:
``` bash
$ rm README.md
```
Now run the following command to create a new `README.md` file (copy/paste everything, from `cat` to `EOF` inclusive, to your terminal):
``` bash
cat << EOF > README.md
This repository contains the source files for
<BR>
the Codelabs at [https://<username>.github.io](https://<username>.github.io)
EOF
```

> aside positive
> The reason you create your `README.md` file in the <B>parent</B> folder is that the `build` and `dist` folders are <B>removed</B> then <B>recreated</B> by the `CLaaT` tool <I>multiple times</I> during development. By storing the file <I>outside</I> the `dist` folder, there is little risk of it also being removed

<B>Note</B>: you will only have to create this `README.md` file <B>once</B>.

Alternatively, you can just copy/paste this version straight into a new `README.md` file, using your favorite text editor:
``` console
This repository contains the source files for
<BR>
the Codelabs at [https://<username>.github.io](https://<username>.github.io)
```
Remember to replace `&lt;username&gt;` with your <I>actual</I> GitHub username
<!-- End Section -->

<!-- 4. Start Section -->
## Initialize Local Repo
Duration: 0:02:00

Now, you need to initialize your local `dist` folder <B>as a Git repository</B>.
Initializing as a <B>git repo</B> means preparing the <I>unversioned</I> project so that it's recognized as a legitimate Git repository. The `git init` command achieves this by creating a (normally hidden) .git folder containing the git "plumbing" and version information

> aside negative
> Don't be too concerned about <I>why</I> you need to do this, but rather that it has to be done <B>each &amp; every time</B> `gulp dist` is executed. As previously mentioned, the `build` and `dist` folders are <B>removed</B> then <B>recreated</B> by the `CLaaT` tool <I>multiple times</I> during development

Open your terminal in (or `cd` into) your `dist` folder, and run the following commands:
```
git init
git add .
git commit -m "First commit"
git branch -M master
git remote add origin https://github.com/<username>/<username>.github.io.git

```
> aside positive
> Note the slight variation from the <I>suggested</I> GitHub commands. In our case, we replaced
> <BR>
> <B>git add README.md</B> with <B>git add .</B> (dot) ... the dot means <B>all</B> modified files &amp; sub-folders.
> <BR>
> Also, each `commit` should have a unique `message` that describes the latest changes. In this case, our commit message matches our access token's <B>Note</B> field, but only to keep it simple

Also, remember that these five commands (or a variation thereof) will need to be run <B>each &amp; every time</B> `gulp dist` is executed, so now might be a good time to create a `bash` script containing the commands. Tip: replace "First commit" above with `$1` and ensure that your script has been called with this `message` parameter!

There is a [sample script](https://raw.githubusercontent.com/mikaere66/mikaere66.github.io/refs/heads/main/codelabs/pub-to-username-github-io/scr/gulp-dist.sh) available for download, within the repo for [these codelabs](https://github.com/mikaere66/mikaere66.github.io) ... to <I>view</I> the script, just click the <B>sample script</B> link above, or to <I>save</I> the script to your computer, right-click the <B>sample script</B> link and select <B>Save link as</B> ...

Keep your terminal open, as you will need it for the next step
<!-- End Section -->

<!-- 6. Start Section -->
## Push files to GitHub
Duration: 0:01:00

The final step in publishing your codelab(s) is to <B>push</B> (or upload) your files to the GitHub repository that you created earlier.

This step assumes that you have run the `git add` | `git commit` and other commands on your local repo.

To `push` any changes to your remote repository, ensure that you are in the `dist` directory within your terminal, and run the following command:
``` bash
$ git push -f origin master
```
The `-f` switch is required, to forcefully overwrite the remote files, since our <B>entire</B> local repo is rewritten each &amp; every time
<!-- End Section -->

<!-- 7. Start Section -->
## Test upload success
Duration: 0:01:00

Once you've pushed your files to GitHub, it's time to check to see if everything works as expected

> aside positive
> Tip: once you get to the <B>Pages</B> step below, create a Bookmark in your browser, so that you can quickly get back to that page in future ... the bookmark would point to <B>https://github.com/&lt;username&gt;/&lt;username&gt;.github.io/settings/pages</B>

Start by going to your <B>https://github.com/&lt;username&gt;/&lt;username&gt;.github.io</B> repository on GitHub.

Now click &sext; <B>Settings</B> at top-right (if your window is too small, this may be hidden within an ellipsis menu (`&hellip;`) with the tooltip <I>Additional navigation options</I>). Note that this is <B>not</B> the settings for your GitHub account, but the settings for <B>this</B> repo.

Once in Settings, click <B>Pages</B> under the <B>Code, planning, and automation</B> section at left.

Under the <B>GitHub Pages</B> heading, you should see a message that says <B>Your site is live at https://&lt;username&gt;.github.io/</B> with a `Visit site` button to the right. Click the button to visit your newly published website, which should open in a new tab.

> aside negative
> If the GitHub servers are busy, it might take a minute or two for your site to come online.
> If this is your second or subsequent <B>push</B> to GitHub, you'll see a message under
> <B>GitHub Pages</B> saying <B>Last deployed by &lt;username&gt; x [minutes | hours] ago</B>.
> <BR>
> Refresh this page every 15 seconds or so, until the time-frame changes to <B>now</B>.
> Then, you can view your site using the `View site` button

You should now be viewing your codelab(s) ... if not, please review the next section for Troubleshooting
<!-- End Section -->

<!-- 8. Start Section -->
## Troubleshooting Tips
Duration: 0:01:00

Some users have experienced 404 messages when attempting to host a static website on GitHub Pages.

Here are some suggestions that are proven to be successful, depending on your GitHub setup:

### Plan A
Open your terminal in (or `cd` into) the `dist` folder, then create an empty `.nojekyll` file by running the following command:
``` bash
$ touch .nojekyll
```
Next, `commit` your changes, give it a minute or two, then check your Pages website to see of this solution helped

### Plan B
If the solution above doesn't work, you <I>may</I> need to change a few Settings, specifically for your Pages repo.

Start by going to your <B>https://github.com/&lt;username&gt;/&lt;username&gt;.github.io</B> repository on GitHub.

Now click &sext; <B>Settings</B> at top-right (if your window is too small, this may be hidden within an &hellip; ellipsis menu)

> aside positive
> Note that <I>these</I> Settings are specific to <I>this</I> repo, i.e. they are not global

Once in Settings, click the &circleddash; <B>Actions</B> drop-down at left, and select <B>General</B>.

Under the <B>Actions permissions</B> heading, select <B>Disable actions</B> then click the <B>Save</B> button just below it.

Give it a minute or two, then check your Pages website to see of this solution helped. You <I>may</I> have to recommit your repo (this suggestion is untested)
<!-- End Section -->
