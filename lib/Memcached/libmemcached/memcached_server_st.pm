package Memcached::libmemcached::memcached_server_st;
use strict;
use warnings;

=head1 NAME

memcached_server_list_free, memcached_server_list_append,
memcached_server_list_count, memcached_servers_parse - Manage server list

=head1 LIBRARY

C Client Library for memcached (libmemcached, -lmemcached)

=head1 SYNOPSIS

  #include <memcached.h>

  const memcached_server_instance_st
    memcached_server_list (memcached_st *ptr);

  void memcached_server_list_free (memcached_server_list_st list);

  memcached_server_list_st
    memcached_server_list_append (memcached_server_list_st list, 
                                  const char *hostname,
                                  unsigned int port, 
                                  memcached_return_t *error);

  uint32_t memcached_server_list_count (memcached_server_list_st list);

  memcached_server_list_st memcached_servers_parse (const char *server_strings);

  const char *memcached_server_error (memcached_server_instance_st instance);

  DEPRECATED
  void memcached_server_error_reset (memcached_server_instance_st list);

=head1 DESCRIPTION

libmemcached(3) operates on a list of hosts which are stored in
memcached_server_st structures. You should not modify these structures
directly. Functions are provided to modify these structures (and more can be
added, just ask!).

memcached_server_list() is used to provide an array of all defined hosts.
This was incorrectly documented as "requiring free()" up till version 0.39.

memcached_server_list_free() deallocates all memory associated with the array
of memcached_server_st that you passed to it. 

memcached_server_list_append() adds a server to the end of a
memcached_server_st array. On error null will be returned and the
memcached_return_t pointer you passed into the function will be set with the
appropriate error. If the value of port is zero, it is set to the default
port of a memcached server.

memcached_servers_parse() takes a string, the type that is used for the
command line applications, and parse it to an array of memcached_server_st.
The example is "localhost, foo:555, foo, bar". All hosts except foo:555 will
be set to the default port, while that host will have a port of 555.

memcached_server_error() can be used to look at the text of the last error 
message sent by the server to to the client.

Before version 0.39 theses functions used a memcache_server_st *. In 0.39
memcached_server_st * was aliased to memcached_server_list_st. This was
done for a style reason/to help clean up some concepts in the code. 


=head1 RETURN

Varies, see particular functions.

=head1 HOME

To find out more information please check:
L<https://launchpad.net/libmemcached>

=head1 AUTHOR

Brian Aker, E<lt>brian@tangent.orgE<gt>

=head1 SEE ALSO

memcached(1) libmemcached(3) memcached_strerror(3)

=cut

1;
