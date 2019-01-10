# Qvpub

Quickly publish specified tag's [Quiver notes](http://happenapps.com/) to your remote blog

## Usages

before use this, you should findout where your Quiver library store and get it path,
see at 'Quiver --> Preferences --> Sync', and get 'Current Library path'

below are required options for script execution

- -p: source quiver library path, should like: Quiver.qvlibrary

- -t: tag to publish, only publish note which has this tag

- -o: output path for parsed files

- -c: publish command after output

then execute command `python qvpub.py -p Users/TC/Quiver.qvlibrary -t Blog -o Users/TC/Blog/source/_post -c "hexo g; hexo d"`

what this command to do is:

1. findout all notes at 'Users/TC/Quiver.qvlibrary'
2. foreach notes and filter which has tag 'Blog'
3. parse notes content and rewirte to 'Users/TC/Blog/source/_post'
4. execute a Hexo command to generate blogs and deploy to remote, see [09ae9c.github.io](https://github.com/09ae9c/09ae9c.github.io) for more infomation about hexo blog

for convenience, you can add this command to alias, e.g.

```
cd ~
vi .bash_profile

# add alias line:
alias qvpub='python qvpub.py -p /Users/TC/Quiver.qvlibrary -t Blog -o /Users/TC/Blog/source/_post -c "hexo g; hexo d"'

# and then refresh:
source .bash_profile
```

finally, when you write a note in Quiver, and you want to publish it to remote blog, just two steps:

- 1. add tag 'Blog' for this note in Quiver's panel
- 2. execute a command 'qvpub'

that's All!

any other blog system you can use, just replace the publish command

# TODO

- add image source replacement



