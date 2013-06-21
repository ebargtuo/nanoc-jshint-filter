# JS Hint Filter #

A filter to lint javascript files using 
[JSHint](https://github.com/jshint/jshint/)
(via [jshintrb](https://github.com/stereobooster/jshintrb)) in
[Nanoc](http://nanoc.ws).

## Installation ##

Drop the file `jshint.rb` into the `lib/filters` folder of
your Nanoc project.

Make sure you have
[jshintrb](https://github.com/stereobooster/jshintrb)
in your `Gemfile`:

    gem 'jshintrb'

If necessary, re-run `bundle install`.

## Usage ##

Use the filter in `compile` rules as necessary. Examples:

    compile '/js/*' do
            # Apply other filters.
            # filter ...

            # Apply jshint filter.
            filter :jshint
        end
    end

If JSHint has nothing to report, the filter produces no output.
If there are any messages from JSHint, they are output to `STDOUT`.

## Notes and Issues ##

The filter uses [jshintrb](https://github.com/stereobooster/jshintrb),
which wraps [JSHint](https://github.com/jshint/jshint/), to
parse javascript files. It uses 
[ExecJS](https://github.com/sstephenson/execjs) to find a suitable
javascript interpreter.

### It does not work on Windows ###

If you are on Windows, it is possible that you may have problems using
JSHint with Microsoft Windows Script Host (JScript). If that is the case
it will be necessary to install one of the other supported ExecJS runtimes.

This is probably the case if you get this error message:

    ExecJS::RuntimeError: SyntaxError: Expected identifier, string or number

### It does not work with Rhino ###

JSHint requires Rhino (at least) version 1.7R4. This is provided by
the following gem:

    gem 'therubyrhino_jar', '1.7.4'

This is probably the case if you get this error message:

    ExecJS::RuntimeError: Property "lines" already defined in this object literal

### ArgumentError: wrong number of arguments calling `format` (1 for 2) ###

There is an issue with jshintrb version 0.2.4. To fix, find the file
`jshintrb-0.2.4/lib/jshintrb/reporter/default.rb` in your Ruby gems
folder. Edit line 5 from

    def format errors, file

to

    def format errors, file = nil

## Licence ##

Copyright 2013 ebargtuo. Released under the MIT license.
