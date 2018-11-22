# CacheMock
A very simple mock rest service.

# Description
This rest service simulates an auth cache service, data is simply stored in a sqlite
file. It is meant to be used to test network disruptions using the Cache::Toolkit
and ToxiProxy modules.

The service just provides a route:

GET  /login/<user> : retrives the username profile
