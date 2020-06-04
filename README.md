<center>
  <h1 align="center">repo.me</h1>
  <h4 align="center">A (now-archived) modern package manager repository template. This template contains samples on how you can easily make depiction pages without replicating your html pages. The pages are styled using <a href"https://getbootstrap.com">Bootstrap</a> which is really easy to use (for Cydia), and the Sileo pages are styled using JavaScript Object Notation.</h4>
  <h4 align="center">If you use web depictions / Reposi3, Sileo now converts web depictions to native depictions in realtime.</h4>
</center>

This guide does NOT cover creating .deb files but will briefly cover assiging depictions.

#### CREDITS TO: [Supermamon](https://github.com/Supermamon/), [Saurik](https://twitter.com/Saurik/), [Sileo Team](https://twitter.com/getSileo/), and the [AppTapp Team](https://twitter.com/AppTappTeam/).
#### Note: With the release of Silica from [Shuga](https://github.com/ShugaBuga/), I highly recommend using that over this, as it currently has Windows WSL support, and I'm working on a semi-solution for Windows Support as a whole. Shuga has contacted me regarding "adding WSL support" and in a sense, I technically do need to rewrite for the transition to apt-ftparchive, but this is barely worked on by me. I have other things to worry about other than maintaining projects I don't want to mess with too much. 

## How to use this template
If you are *not* hosting your repo on [Github Pages](https://pages.github.com/), you can download the zip file [here](https://github.com/sukarodo/repo.me/archive/master.zip) and extract to a subfolder on your website.

**Release File**

Modify `repo.conf` in ./assets/repo by changing the labels:
`ORIGIN_HERE`, `LABEL_HERE`, `CODENAME_HERE`, and `DESCRIPTION_HERE`

`updaterepo.sh` will take care of the Release file after modifying the config. 

**Branding**

Open `index.html`
Change <title>repo.me</title> to whatever you wish.
Change lines 54 - 63 to whatever you wish.
Change line 71 into your own URL.
Note: YOU DO NOT NEED THIS. YOU CAN ALSO MAKE YOUR OWN. DO WHAT YOU WISH.

Add "CydiaIcon.png" for your Cydia / Sileo Repository Logo.


**Page Footers**

This data are the links that appear at the bottom of every **Cydia Depiction**. The data is stored in `repo.xml` at the root folder of your repo.

```xml
<repo>
    <footerlinks>
        <link>
            <name>Follow me on Twitter</name>
            <url>https://twitter.com/Sukarodo</url>
            <iconclass>glyphicon glyphicon-user</iconclass>
        </link>
        <link>
            <name>I want this depiction template</name>
            <url>https://github.com/sukarodo/sidia</url>
            <iconclass>glyphicon glyphicon-thumbs-up</iconclass>
        </link>
    </footerlinks>
</repo>
```
### Depictions: Native Folder Is Sileo, Web is Cydia

### Adding a simple depiction page (Cydia)

Go to the depictions folder and duplicate the folder `com.sukarodo.oldpackage`.
Rename the duplicate with the same name as your package name.
There are 2 files inside the folder - `info.xml` and `changelog.xml`.
Update the 2 files with information regading your package.
The tags are pretty much self-explanatory.
Contact [@sukarodo](https://twitter.com/sukarodo) for questions.

`info.xml`.
```xml
<package>
    <id>com.sukarodo.oldpackage</id>
    <name>Old Package</name>
    <version>1.0.0-1</version>
    <compatibility>
        <firmware>
            <miniOS>5.0</miniOS>
            <maxiOS>7.0</maxiOS>
            <otherVersions>unsupported</otherVersions>
            <!--
            for otherVersions, you can put either unsupported or unconfirmed
            -->
        </firmware>
    </compatibility>
    <dependencies></dependencies>
    <descriptionlist>
        <description>This is an old package. Requires iOS 7 and below..</description>
    </descriptionlist>
    <screenshots></screenshots>
    <changelog>
        <change>Initial release</change>
    </changelog>
    <links></links>
</package>
```

`changelog.xml`.
```xml
<changelog>
    <changes>
        <version>1.0.0-1</version>
        <change>Initial release</change>
    </changes>
</changelog>
```
### Adding a simple depiction page (Sileo)

Go to the /depictions/native/com.sukarodo.samplepackage and copy the file `depiction.json`.
Move into a folder labeled as your package name.
Edit The Labeled Parts (i.e. VERSION_NUMBER, TWEAK_NAME, etc.)., use the Sileo Depiction Generator by [@M4cs](https://twitter.com/maxbridgland): [SileoGen](https://sileogen.com/), or use any of the templates from popular
repositories at /assets/Depiction Templates
Contact [@sukarodo](https://twitter.com/sukarodo) for questions.

#### Link the depiction page in your tweak's `control` file

You can add the depictions url at the end of your package's `control` file before compiling it.
The depiction line should look like this:

```text
Depiction: https://username.github.io/repo/depictions/web/?p=[idhere]
```

Replace `[idhere]` with your actual package name.

```text
Depiction: https://username.github.io/repo/depictions/web/?p=com.sukarodo.oldpackage
```
For Sileo Depictions, add the SileoDepiction key in your `control` file before compiling it.

```text
SileoDepiction: https://username.github.io/repo/depictions/native/com.sukarodo.samplepackage/depiction.json
````

#### Rebuilding the `Packages` file

With your updated `control` file, build your tweak.
*REMOVE THE PACKAGES FILE WITHIN FIRST*
Store the resulting `.deb.` file into the `/debians/` folder of your repo.
Build your `Packages` file and compress with `bzip2`.

_Windows users, see [dpkg-scanpackages-py](https://github.com/supermamon/dpkg-scanpackages-py) or [scanpkg](https://github.com/mstg/scanpkg)._

#### Repository at last!

If you haven't done yet, go ahead and add your repo to your package manager.
You should now be able to install your tweak from your own repo.

### Cleanup

Just a cleanup step, remove the debs that came with this template and re-run the commands on step 3. You can keep the sample depictions for reference but they're not needed for your repo.

## Sileo Extras

These are some extra things that can make your repository look even better on Sileo.

### Featured Packages (`sileo-featured.json`)

Change The Following Lines:
```
 "url": "https://raw.githubusercontent.com/sukarodo/repo.me/master/assets/Banners/RepoHeader.png", <---- The Package Banner
        "title": "Sample Package", <---- Your Package Name
        "package": "com.sukarodo.newpackage", <---- The Actual Package
```
