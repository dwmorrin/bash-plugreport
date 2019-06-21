# plugreport
bash scripts to generate a report of installed audio plug-ins on MacOS

## configuration
`plugreport` reads file path names from a file named `plugpaths.config`.
Put each path on a single line.  Use `#` for comments.
The file is just read by the builtin `read` if you want to test your file.

## features
* comma separated fields; output can be directed to a .csv file
 * todo: allow user definied delimiter, or at least a `\t` option
* each record contains these fields:
 * bundle identifier
 * developer signature
 * executable name
 * version

## caveats
The fields reported were selected as the most reliable sources for indentifying the "make" and "model" of any given plug-in, however there is no universal system among plug-in developers, so these fields may not be satisfactory in all cases.

An open issue is to make the report as universal as possible.  Whether this is done internally through added code complexity, or whether command line arguments or config file features can offer improved results is TBD.

For example, if a particular path of interest is known to contain the "good" info is some obscure info.plist field, then perhaps a directive to add that field could be indicated in the config file and passed into the awk file.