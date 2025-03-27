authors: Michael Mossman
categories: markdown
feedback link: https://github.com/mikaere66/mikaere66.github.io/issues
id: create-your-own-codelabs
status: Published
summary: How to use Markdown Syntax to create your own Codelabs

# Create a Codelab with Markdown

<!-- 1. Start Section -->
## Codelabs Introduction
Duration: 0:02:00

![Codelab logo](assets/markdown.png)

### About CLaaT (Codelabs as a Thing)
Code(what?) ... the concept of codelabs is a <B>learning by doing</B> approach to education and tutorials.
<BR>
Rather than have your audience lose interest by presenting them with a long-winded "how to" or a tedious "wiki page", you can format an easy-to-follow guide in the form of a step-by-step `codelab`.

Developed and <B>maintained by a small group of dedicated Googlers</B> (Google employees), the `CLaaT` (Codelabs as a Thing) project is open source, and available for anyone to use.

Also, this format is <B>not restricted to just coding</B>! You could author a codelab to represent <I>any</I> type of tutorial. It may be related to Car Maintenance, Home Improvement, Operating Systems, PC Upgrades ... the possibilities are endless.

### How do I create my own Codelabs?
There are actually <I>two</I> different formats supported: .doc (Google Docs) and .md (Markdown Syntax). However, <B>we will only be discussing the</B> `Markdown` <B>version</B> ... please refer to my [other Codelabs](https://mikaere66.github.io) for the `Google Docs` version.

* `Google Documents`: the content for <I>this</I> type of codelab-authoring can be written in Google Docs, using some simple formatting conventions. Google docs files can be stored in your Google Drive account, but <I>not</I> hosted there ... refer to the Conclusion/Hosting section for more on that topic.
<BR>
Google Docs has the advantage of supporting collaboration, so it would be great for a team

* `Markdown Language`: you can also author codelabs using markdown syntax. Mark(what?) ... Wikipedia describes Markdown as a lightweight <I>markup</I> language for creating formatted text using a plain-text editor.
<BR>
Markdown has the advantage of being stored locally, so it can be edited even when offline

> aside positive
> <B>Markup</B> is a generic term for <I>any language</I> that describes a document's formatting.
> <BR>
> <B>Markdown</B> is a specific <I>markup language</I>, originally created by John Gruber in 2004
<!-- End Section -->

<!-- 2. Start Section -->
## Software Installation
Duration: 0:10:00

To create and view Codelab pages on your computer, follow these instructions to get set up:

> aside negative
> Please read this page in it's entirety <B>before installing anything</B>
> <BR>
> so you'll get the <B>big picture</B> about what we're trying to achieve

### The following software is required:
* Go (sometimes referred to as golang)
* Node.js (v10 or greater req'd) + NPM
* CLaaT (codelabs command-line tool)

> aside positive
> All external hyperlinks open in a new tab

#### Check for Curl
Curl is a command-line tool for transferring data with URL syntax, supporting <I>many</I> web protocols ... it's required to install `Go` in the next step. To check if it's installed, run the following command in your terminal:
``` bash
$ which curl
```
<B>If you receive output</B> showing the full-path to curl, then skip to the next step.
<BR>
However, <B>if there is no output</B>, install curl from your distro's repos, as shown:
``` bash
$ sudo apt update && sudo apt install curl
```

#### Install Go(lang)
Go is an open source project developed by a team at Google, as well as many contributors from the open source community. Go is distributed under a BSD-style license.
* Please follow the install instructions on the official [Go website](https://go.dev/doc/install)

> aside negative
> Note that (as of January 2025) the <I>full</I> one-liner found on the Go website <B>will fail</B> (as is) <B>if</B> you've never installed Go before. Please <B>run as two separate commands</B> to avoid confusion: e.g.
> <BR>`rm -rf /usr/local/go`
> <BR>
> then
> <BR>
> `tar -C /usr/local -xzf go1.23.x.linux-amd64.tar.gz`
> 
> Also, note that <B>both</B> commands require <B>elevated</B> privileges (i.e. `sudo`)

#### Install Node.js
Node.js is a platform built on Chrome's JavaScript runtime for easily
building fast, scalable network applications. Node.js uses an
event-driven, non-blocking I/O model.

Start by checking your distro's repos for availability and version number:
``` bash
$ apt-cache policy nodejs
```
If the correct version is available (v10+) then install using this command:
``` bash
$ sudo apt install nodejs
```
* Alternatively, you can install it directly from the [Node.js website](https://nodejs.org/en/download/)

#### Install NPM
NPM is the package manager for the Node JavaScript platform. It puts
modules in place so that node can find them, and manages dependency
conflicts intelligently.

If nodejs was available in your repos, the `npm` package should be as well:
``` bash
$ sudo apt install npm
```
* Alternatively, install NPM from Node.js website, using the link above

#### Install CLaaT
The claat executable program converts your input file (.md) into the codelab format, which is HTML by default.

Assuming you have Go successfully installed, this command will result in CLaaT having the full path: `$HOME/go/bin/claat` ... note that executable permissions will already be set, using this method
``` bash
$ go install github.com/googlecodelabs/tools/claat@latest
```
* Or download directly from the [Google Codelabs](https://github.com/googlecodelabs/tools/releases/latest) GitHub page. Be sure to select the correct architecture for your O/S

> aside negative
> Whether you choose to download CLaaT directly from GitHub, or install it using `go`, you'll need to add its path to `.bashrc` as mentioned in the Environment/Variables section. Remember to <I>grant permissions</I> to make the file executable, as shown in the example below (for ease-of-use, either <I>rename your downloaded file</I> to `claat` or <I>create an alias</I> for `claat-linux-amd64` or `claat-linux-amd64` as the case may be)
``` bash
$ chmod u+x path-to/claat
```

#### Install Google Codelab Tools
The final step in installing software is to `git clone` or `download` the Google Codelabs Tools repo

> aside positive
> For the remainder of this codelab, `YOUR-PROJECTS` refers to the <B>root of
> <BR>
> <I>your</I> projects folder</B>, wherever you normally store your Current Project files

If you have `git` installed, open your terminal in (or `cd` into) `YOUR-PROJECTS` and run the following command:
``` console
$ git clone https://github.com/googlecodelabs/tools.git CodelabTools
```
Note that after the `git clone &lt;url&gt;` command, we've specifically added a `&lt;space&gt;` followed by the `CodelabTools` name ... this will first a create a folder named `CodelabTools`, then clone the contents of the `tools` repo into this folder

* Alternatively, manually [download the tools archive](https://github.com/googlecodelabs/tools/archive/refs/heads/main.zip) and unzip it into the `YOUR-PROJECTS` folder, then rename `tools` or `tools-main` to `CodelabTools`, so that the instructions in this codelab match your folder hierarchy. The expected hierarchy is discussed in the next section
<!-- End Section -->

<!-- 3. Start Section -->
## Environment/Variables
Duration: 0:04:00

### Verify your <I>Node.js</I> and <I>NPM</I> installation

#### Check your Node.js installation
``` bash
$ node -v
```

#### Check your NPM installation
``` bash
$ npm -v
```

### Set up <I>Local Modules</I> with NPM
Gulp is an open-source Javascript toolkit and task runner, which is built on Node. js and NPM, and is used for the optimization of time-consuming and repetitive tasks.

> aside positive
> `YOUR-PROJECTS` refers to the root of <I>your</I> current projects folder,<BR>where you cloned Google Codelabs Tools (or unzipped the archive)

Open your terminal in (or `cd` into) `YOUR-PROJECTS/CodelabTools/site` and run these two commands, which will set up CLaaT to work locally, alongside gulp:
``` bash
$ npm install
$ npm install gulp-cli
```

While you're in the terminal, <B>create a new folder</B> under the `site` directory, in which to store your `codelab.md` files. Also create a <B>sub-folder</B> in which to store images ... tip: both folders can be created using `mkdir` with the `-p` switch (no error if existing, make <B>parent</B> directories as needed)
``` bash
$ mkdir -p codelabs/assets
```
Your `projects` folder structure should now look similar to this:
```
YOUR-PROJECTS
|-- CodelabTools
|--|-- site
|--|--|-- codelabs
|--|--|--|-- assets
```
> aside positive
> Note: the <I>top two</I> folder names are not so important, as long as you know where everything is

### Set up your <I>Environment</I> variables

#### Check the path where Go was installed:
``` console
$ ls /usr/local/go/bin
```
You should see two files: `go` and `gofmt`
> aside negative
> If not, alter the paths above and below to match the Go path used for your Go installation

#### Add the following to your .bashrc file:
``` console
$ export PATH=$PATH:/usr/local/go/bin
```
> aside positive
> You may need to close and re-open your terminal window for these changes to take effect

#### Add the path where CLaaT was saved:
If you <B>installed CLaaT using Go</B>, add the following to your `.bashrc` file:
``` console
$ export PATH=$PATH:$HOME/go/bin
```

If you <B>downloaded directly</B> from GitHub, add its path to your `.bashrc` file:
``` console
$ export PATH=$PATH:$HOME/bin
```
> aside negative
> The paths to CLaaT shown here are examples only! Please adjust
> <BR>
> the path to correctly point to the `claat` executable file's location

### Verify your <I>Go</I> and <I>CLaaT</I> installation

#### Check your Go installation
``` bash
$ go version
```

#### Check your CLaaT installation
``` bash
$ claat version
```
<!-- End Section -->

<!-- 4. Start Section -->
## Metadata Format
Duration: 0:05:00

The top of your `codelab.md` file needs to have certain metadata, to enable a codelab to function correctly. Some of this metadata is <B>required</B> and some is <B>optional</B>, as follows:

### Required metadata
`authors: your_name_here`
<BR>
At least one name, separated by commas
<BR><BR>
`categories: android, kotlin`
<BR>
At least one category, separated by commas
<BR><BR>
`feedback link: https://example.com`
<BR>
The hyperlink to open when "Report a mistake" is clicked at bottom-left
<BR><BR>
`id: how-to-write-a-codelab`
<BR>
Must be <B>unique</B> within your codelabs directory. This is also
<BR>
used as the folder name where exported files will be created
<BR><BR>
`status: Published`
<BR>
Valid options: Draft, Published, Deprecated, Hidden

### Optional metadata
`analytics account: project-id-123`
<BR>
This allows you to specify a custom Google Analytics ID for your codelab
<BR><BR>
`environments: Web`
<BR>
A tag that allows CLaaT to output some codelabs for a specific environment.
All codelabs default to the "Web" environment, but given some hardware constraints, we might only want to generate them for a "Kiosk" environment, where we know people will have the right hardware.
You can also use this to target specific events, for instance: `Web, polymer-summit`
<BR><BR>
`summary: Create a Codelab using Markdown`
<BR>
A short summary of the codelab that will be shown in the codelab browser UI
<BR><BR>
`tags: compose, coroutines`
<BR>
Add relevant tags to make your codelab easy to find
<!-- End Section -->

<!-- 5. Start Section -->
## Let's Get Started
Duration: 0:04:00

### Metadata and Header 1
In the previous section, you learned about codelab metadata, required at the top of each `codelab.md` file. Based on that info, <B>create a new file</B> in the `YOUR-PROJECTS/CodelabTools/site/codelabs` folder ... 

Name it `my-first-markdown-codelab.md` ... this is a similar name to the <B>id</B> metadata, just to keep things simple for this tutorial. Using your favorite plain-text editor, add the following to outline your required `metadata` as well as the overall `document title` then save the file:
```
summary: My first Codelab using Markdown
id: my-first-markdown-codelab
categories: sample
status: Published
authors: your_name_here
Feedback Link: https://example.com

# My first Markdown codelab
```
In the code snippets above, we have used 6 of the 9 available `metadata` keywords, and provided an overall document title using the `Header 1` format.

The hash symbol and text `# My first Markdown codelab` are <B>not a comment</B> like you might find in a `bash` script, but is how `&lt;h1&gt;` is written in markdown. All header formats will be explained in the next section
<!-- End Section -->

<!-- 6. Start Section -->
## Headers/Header Levels
Duration: 0:04:00

<B>Header 1</B> is reserved for the overall <B>document title</B>, in this case "My first Markdown codelab" as shown on this browser tab, and in the top left-hand corner.
<BR>
It would also show on the landing page ... we will cover landing pages in a later step.
<BR>
<B>Syntax:</B>
<BR>
`# My first Markdown codelab`

<B>Header 2</B> is reserved for individual <B>section subtitles</B>, in this case "Headers/Header Levels", used in the Table of Contents to the left, and at the top of each section, as shown above
<BR>
<B>Syntax</B>:
<BR>
`## Headers/Header Levels`

Do you see a pattern emerging, with the number of hashes?

Note that headers 2, 3 &amp; 4 markdown will get translated to `&lt;h2&gt;`, `&lt;h3&gt;` and `&lt;h4&gt;` respectively
> aside positive
> <B>Numbering is generated automatically</B>, for both the ToC and for each section header, by the CLaaT tool ... you do <I>not</I> need to number sections individually

<B>Headers 3 and 4 use the following syntax</B>:

`### Header 3` produces
### Header 3
`#### Header 4` produces
#### Header 4
Note that, unlike Headers 1 and 2, the Headers 3 and 4 have no bearing on the <I>overall</I> codelab

### Add your section headers

Since we already specified our Header 1 in the previous section, leave a blank line (just for readability), then <B>add two Header 2</B> entries, as follows:
```
## This is Section one

## This is Section two
```
We'll expand on each of these in the next few sections ...
<!-- End Section -->

<!-- 7. Start Section -->
## Duration and Time
Duration: 0:01:00

Some participants are not fully committed to completing a codelab when they first start out. One of the ways that we can keep them engaged is by giving them accurate estimates, regarding how much additional effort is required to complete the codelab, at each step.

In order to add this feature to your codelab, each section needs to have an estimated <B>time to complete</B>, in the form `Duration: H:MM:SS`, and it should be placed on the line immediately following the <B>section</B> header.

Example markdown showing `section header` and `duration` for <I>this</I> section:
```
## Duration and Time
Duration: 0:01:00
(do not add this)
```
The total duration for <B>all sections</B> is calculated automatically by the CLaaT tool when a codelab is "exported" ... it appears at the beginning of all codelabs, opposite the codelab's title, where you'll see a timer icon followed by the total <B>time remaining</B> estimate. This time estimate is <I>also</I> used for each codelab on the "landing page" if applicable.
> aside positive
> We will cover "exporting" the codelab and "landing pages" in later sections

As the student progresses through each section in the codelab, the estimated time changes to reflect total <B>time remaining</B> for all sections not-yet completed.

If you <I>forget</I> to add the duration for a section, the default of <B>1 minute</B> will be used.

#### Notes
* If you <B>forget</B> to add the duration for a section, the default of 1 minute will be used
* If only <B>one</B> colon is used (`M:SS`), then that duration is assumed to be minutes:seconds
* If the <B>last</B> section of your codelab is simply a `Congratulations` or `Summary` page, you should set the duration for that section to 0 (zero)
### Add your estimated duration
In the blank space immediately following `## This is Section one` add the following `Duration:` keyword, following by an estimated time in the form `H:MM:SS`
```
Duration: 0:01:00
```
Do the same under `## This is Section two`, but this time <B>make it 2 minutes</B>.

Save the file, and continue to the next section ...
<!-- End Section -->

<!-- 8. Start Section -->
## Bullets/Numbering
Duration: 0:01:00

### How to create a Bulleted list
<B>Syntax</B>:

`* Hello`
<BR>
`* World`
<BR>
`* Codelab`

This is plain text, immediately followed by bullets. No <I>additional</I> line breaks, but notice the formatting
* Hello
* World
* Codelab

If you prefer, list items <I>can</I> be represented by the dash (`-`) character, instead of an asterix (`*`)

### How to create a Numbered list
<B>Syntax</B>:

`1. List`
<BR>
`2. Using`
<BR>
`3. Numbers`

This is plain text, immediately followed by numbers. No <I>additional</I> line breaks, and similar formatting
1. List
2. Using
3. Numbers

Note that your markdown numbers <B>do not have to be sequential</B>. You can simply have `1.` for <I>all</I> list items, meaning maintenance for long lists would be much easier

### Create your Bulleted list
Add the following to your file:
``` console
#### Shopping
* Apples
* Oranges
* Bananas
```

### Create your Numbered list
Add the following to your file:
``` console
#### Chores
1. Mow the Lawns
2. Put out Trash
3. Wash the Car
```
<!-- End Section -->

<!-- 9. Start Section -->
## Code Blocks/Images
Duration: 0:01:00

### How to add a Code block
Notice how the syntax in the `code` block below both starts <I>and</I> finishes with three "backticks". Everything within is considered `code` with syntax highlighting, and will be highlighted according to either the language you specify, or if omitted, the CLaaT tool will try to "guess" the code-type used.

If you wish to have <B>no formatting</B>, simply use the keyword `console` in place of a language (console in this context means "terminal output").

Note that we're <B>not</B> using the <B>actual backtick character</B> below, as such. Just for this example, it has been substituted with the HTML <B>backprime</B> character. That's because the three backticks <I>themselves</I> are difficult to render correctly within a code block!

> aside positive
> On an English (US) keyboard (US-International), the <B>backtick</B> (`&#96;`) character is located at top left, on the same key as the <B>tilde</B> (`~`) character. Worth noting is that the <I>proper</I> name for a code block is actually `fenced code block` and that each set of <B>3 backticks</B> is called a `fence`

<B>Syntax</B>:
``` bash
‵‵‵ bash
FILENAME="scores.log"
if [ ! -f $FILENAME ]; then
    touch $FILENAME
fi
‵‵‵
```

Try adding your own `code` block, somewhere in your codelab file. Please <B>do not copy/paste the example</B> above, because (as is) it won't work!

### How to add an Image
<B>Syntax</B>:

`![alt text](path-relative-to-markdown-file/puppy.jpg)`

Note the format: an exclamation mark, immediately followed by [square brackets containing the `alt text`] which is again followed immediately by (round brackets containing the <B>relative</B> path to the `assets/image-file.ext` file)

In this case:
```
![Doggo image](assets/puppy.jpg)
(do not add this)
```
![Doggo image](assets/puppy.jpg)

#### Add your own Image
Search on Google (or whatever) for something that you have an interest in, then flip to the Images tab.

Find something of medium size, i.e. the example above is 924x601 pixels ... if too big, you'll find that the image is actually downsized (if required) to match the <I>width</I> of the codelab's <I>main</I> section (this).

For example, try dragging the right-hand edge of this window in and out to see how the image resizes (tip: when done, press ESC <I>while still holding the mouse button</I>, to restore the window's original size)

Save and copy the file to your `YOUR-PROJECTS/CodelabTools/site/codelabs/assets` folder
<BR>
<B>or</B>
<BR>
just save it directly to that path/location, using a meaningful name, with no spaces
> aside negative
> Although long path names, and the ability to have spaces in filenames, is a wonderful feature in modern computing, please <B>avoid having either</B> when it comes to some programming projects

Add the following to your codelab file, substituting everything in UPPER CASE with <I>your own</I> values:
```
![YOUR OWN ALT TEXT](assets/YOUR-OWN-FILENAME.EXT)
```
Add some text, either above or below, to accompany the image.

Save the file, and continue to the next section ...
<!-- End Section -->

<!-- 10. Start Section -->
## Info Boxes/Text Styles
Duration: 0:01:00

### Info Boxes
Info boxes are colored callouts that enclose special information in codelabs. Positive info boxes should contain positive information like best practices and time-saving tips. Negative info boxes should contain information like API usage restrictions or warnings.

#### How to create a Positive info box
<B>Syntax</B>:

`&lt;aside class="positive"&gt;`
<BR>
`This is a positive info box. Opening and closing tags`
<BR>
`may be placed on new lines, for markdown readability.`
<BR>
`&lt;/aside&gt;`

<aside class="positive">
A positive info box should contain positive information like best practices and time-saving tips
</aside>

Add the following to your file:
``` html
<aside class="positive">This is a positive info box</aside>
```

#### How to create a Negative info box
<B>Syntax</B>:

`&lt;aside class="negative"&gt;`
`This is a negative info box`
`&lt;/aside&gt;`

<aside class="negative">
A negative info box should contain information like API usage restrictions or warnings
</aside>

Add the following to your file:
``` html
<aside class="negative">This is a negative info box</aside>
```

### Text Styles
Fonts have no effect when authoring codelabs. Everything will be formatted using <B>Roboto</B> in the final codelab.

However, there <I>are</I> some simple ways that you can add emphasis to certain parts of the text:
<BR>
<B>Bolded</B> and <I>Italicized</I> text will be passed through to the codelab markup as `&lt;strong&gt;` and `&lt;em&gt;` tags respectively. Also, small passages of text surrounded by backticks (`&backprime;`) will be passed through as an inline `&lt;code&gt;` tag in the markup, as demonstrated a few times in this paragraph.

You might have to experiment with line breaks to get your pages looking just right. Also, while you <I>can</I> use <I>some</I> regular HTML, be aware that left and right angle brackets are special characters in markdown, so in this paragraph, we've had to use the following to <B>demonstate</B> for example <B>&lt;BR&gt;</B> correctly:
```
&lt;BR&gt;
```

### Download Buttons
Codelabs sometimes contain <B>links to sample code</B>, or SDKs, for example. The codelab renderer will apply special button-esque styling to any hyperlink formatted with the `button` tag.

<button>[Google Search](https://www.google.com)</button>

Although the button above will just take you to the `google.com` website, buttons work for specific file-downloads as well.

Add the following to your file:
``` html
<button>[Download the Internet](https://www.example.com)</button>
```
<!-- End Section -->

<!-- 11. Start Section -->
## Export/Landing Pages
Duration: 0:01:00

### How to Export your Codelab
Use the CLaaT tool to <B>export</B> your codelab for viewing/testing locally ... to do this, open your terminal in (or `cd` into) the `YOUR-PROJECTS/CodelabTools/site/codelabs` folder and run the following command:
``` bash
$ claat export name-of-your-codelab.md
```
Now you need to `cd ..` (up one level) to the `YOUR-PROJECTS/CodelabTools/site` folder and run the following command:
``` bash
$ gulp serve --codelabs-dir=codelabs
```
Then open your browser at [http://localhost:8000](http://localhost:8000) to view your creation

> aside positive
> Tip: while developing your codelab, you might find it helpful to create a `bash`
> <BR>
> script to run these commonly used commands, as they can be quite repetitive

### How to Distribute your Codelab
> aside negative
> If you've made <B>changes since your last export</B>, be sure to run `export` again, as shown above

Use the Gulp tool to <B>distribute</B> your codelab before uploading it to your website ... to do this, open your terminal in (or `cd` into) the `YOUR-PROJECTS/CodelabTools/site` folder and run the following command:
``` bash
$ gulp dist --codelabs-dir=codelabs
```
This time, instead of creating a <B>build</B> folder containing your local web portal, the `gulp` command (with `dist` parameter) creates the <B>dist</B> folder, containing a <B>minified</B> version of your final codelab

### Landing Pages
An example of a "landing page" is what you may have already seen at the root of my GitHub Pages [Codelabs](https://mikaere66.github.io/) website.

A landing page for <I>your</I> codelabs is created automatically, in the
<BR>
`YOUR-PROJECTS/CodelabTools/site/[build|dist]` folder, when you `gulp serve` or `gulp dist` your codelab(s) ...

The output for your landing page can be customized to suit your requirements by following the intructions here, at Google's GitHub [Codelabs Site](https://github.com/googlecodelabs/tools/blob/main/site/README.md) repo.

Specific `views` can also be created ... views are themed/styled collections of codelabs, meant to target a specific topic, for example Android, Linux, or Windows O/S
<!-- End Section -->

<!-- 12. Start Section -->
## Conclusion/Hosting
Duration: 0:00:00

### Bonus Content
As a bonus for clicking through right to the end of this tutorial, here are some more interesting tricks for codelabs in general:

#### Embed YouTube Videos
To embed a video uploaded to <B>YouTube</B> with this sample URL `https://www.youtube.com/watch?v=DWAinkJ54AP8` you can use an inline video tag, similar to the example in the code block, where `DWAinkJ54AP8` is the video ID in the sample URL:
``` console
<video id="DWAinkJ54AP8" />
```

#### Resumable Codelabs
A codelab remembers <B>where the student left off</B>, so that when they return at a later date or time, they are taken to their most recent point in the codelab. This makes it easier for the student to "jump back in". This is simply part of the framework. There is nothing that you need to do as a codelab author to enable this feature.

### More Information
For an alternative perspective on this tutorial, check out this Medium article by Zarin Lokhandwala:
<BR>
[Publish Technical Tutorials in Google Codelab Format](https://medium.com/@zarinlo/publish-technical-tutorials-in-google-codelab-format-b07ef76972cd)

For further info, check out the official GitHub repo:
[Google Codelabs Tools](https://github.com/googlecodelabs/tools)

For codelab hosting ideas, check out these helpful links:
* [Quickstart for GitHub Pages](https://docs.github.com/en/pages/quickstart)
* [How do I Publish my Codelabs?](https://github.com/googlecodelabs/tools#how-do-i-publish-my-codelabs)
<!-- End Section -->