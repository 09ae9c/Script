# Qvpub

Quick publish specified tag's [Quiver notes](http://happenapps.com/) to your remote blog

## Usages

before use this, you should findout where your Quiver library store and get it path
see at 'Quiver --> Preferences --> Sync', and get 'Current Library path'

below are required options for script execution

-p: source quiver library path, should like: Quiver.qvlibrary
-t: tag to publish, only publish note which has this tag
-o: output path for parsed files
-c: publish command after output

then execute command `python qvpub.py -p ~/Quiver.qvlibrary -t Blog -o ~/Blog/source/_post -c 'hexo g; hexo d'`

what this command to do is:

1. findout all notes at '~/Quiver.qvlibrary'
2. foreach notes and filter which has tag 'Blog'
3. parse notes content and rewirte to '~/Blog/source/_post'
4. execute a Hexo command to generate blog and deploy to remote, see [09ae9c.github.io](https://github.com/09ae9c/09ae9c.github.io) for more infomation about hexo blog

any other blog system you can use, just replace the publish command



