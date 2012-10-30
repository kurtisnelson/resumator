#Resumator
[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/kurtisnelson/resumator) [![Build Status](https://secure.travis-ci.org/kurtisnelson/resumator.png?branch=master)](http://travis-ci.org/kurtisnelson/resumator)

Communicates with the resumator API

##Usage

  ``ruby
  client = Resumator::Client.new(APIKEY)
  resp = client.jobs
  puts resp[0].title
  resp = client.jobs(id: resp[0].id)
  ``

Any of the parameters listed in the [API docs](http://www.resumatorapi.com/v1/) should be supported.

##Contributing to resumator
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

If you want messages from Faraday, set DEBUG in your environment to true.

##Copyright

Copyright (c) 2012 Kurt Nelson. See LICENSE.txt for
further details.

