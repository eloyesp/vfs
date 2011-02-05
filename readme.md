# Vfs - Virtual File System

Handy and simple abstraction over any storage that can represent (at least partly) concept of 'file' and 'directory'.

Currently there are following implementations available:

- local file system
- remote file system (over ssh)

# Goals

- **handy, simple and clean** API over any storage that has FS-like structure.
- **high performance** - the same as by using low-level API of underlying system, there should be no extra calls.
- same API for different storages (Local FS, SSH, Hadoop, or any other , ...).
- should work simultaneously **with multiple different storages**.
- simple and small codebase and good specs, easy to understand and extend.
- simple driver implemenation, should be easy to add new storage types (Hadoop DFS, LDAP, Document Oriented DB, In-Memory, ...).

# Code samples:

    box = Vfs::Box.new host: 'webapp.com', ssh: {user: 'root', password: 'secret'}

    box.upload_directory '/my_project', '/apps/my_project'
    box.bash 'nohup /apps/my_project/server_start'

# Why?

To easy my work: with local FS, remote FS (cluster management, deployment automation), and some specific systems like Hadoop DFS.

Because the API of standard File/Dir/FileUtils classes is just terrible. And there's the reason for it - the goal of thouse tools
is to provide 1-to-1 clone of underlying OS API, instead of provididing handy tool for working with FS.

It uses functional design (instead of object-oriented) and bloated naming convetion.
After 3 years of Ruby I steel need sometime to consult RDoc for doing some relativelly basic FS stuff.

And if you want to use remote FS things are getting even worse and more complicated (Net::SSH & Net::SFTP use a little
different API than local FS, and you has to remember all thouse little quirks).
  
## TODO

### v 0.1


- Vos: Dir.bash
- File.append
- list of entries/files/dirs

### v 0.2

- efficient (not copy/destroy) versions of move_to, rename
- glob search for directories: Dir['**/*.yml']
- access via attributes and helpers for unix chmod
- add driver: remote FS over HTTP.

### future

- add storages: Hadoop DFS, MongoDB, Amazon S3

[rush]: http://github.com/adamwiggins/rush