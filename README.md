Roundup
=======

The Roundup project aims to provide an easy to use interface to the [Rally REST API](http://rallydev.com) via Ruby.

Background
----------

Roundup provides a plugin powered architecture that allows you to interact with the [Rally REST API] using the 
existing [rally_rest_api](http://rally-rest-api.rubyforge.org/rally_rest_api/).

The intention is to provide a simple scriptable interface to the most commonly used features during a sprint.

Usage
-----

### Configuration
Roundup uses a standard YAML configuration located at config/rally.yml. See config/rally.example.yml for an example.

There are several ways you can use Roundup. Here are a few examples to get you started.

### Shell access
Roundup comes with a script which you can use to directly call any plugin method via the use of command arguments.
Currently, the only thing output is a hash representation of the results, which will be handled with output filters
in the future.

    $ bin/roundup search story signup
    
### Scriptable access
You can require the Roundup library directly, but currently you need to include the plugins you want. I plan on cleaning
this up and allowing you to configure which plugins you would like to load, but for now just include the files. See bin/roundup
for an example of how to require and setup Roundup.

Plugins
-------

As previously stated, all functionality provided by Roundup is via plugins.  Plugins allow access to the workspace, project,
and rally object provided by rally_rest_api. Creating your own plugins is very simple, wrapping up rally_rest_api is a bit
more work. Currently these requests are unwrapped, but shortly all interactions with rally_rest_api will be encapsulated within
Roundup::Resource objects for brevity and ease of use.

    class MyPlugin < Roundup::Plugin
      register_command :say_hello, :hello

      def self.hello(args)
        puts "Hello " + args.join(' ')
      end
    end

    $ bin/roundup say_hello World
    # => "Hello World"

Future
------
The intention is to provide editor plugins (vim, TextMate) to unify rally management within your favorite editor.

