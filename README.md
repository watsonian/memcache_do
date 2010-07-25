# MemcacheDo

This is a lightweight library that lets you execute ad hoc memcache commands to a designated host and port. This code was extracted from the [memcache-client](http://github.com/mperham/memcache-client) library.

## Usage

In its most simple form, you can use it like this:

    MemcacheDo.exec('stats')

By default, it uses 'localhost:11211' as the host and port to connect to, but if you need to specify a host or port:

    MemcacheDo.exec('stats', '1.2.3.4', '11222')

The command is executed exactly as you put it in except that a '\r\n' is appended to the end.