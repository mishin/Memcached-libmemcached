package Memcached::libmemcached::memcached_user_data;
use strict;
use warnings;

=head1 NAME

memcached_set_user_data, memcached_get_user_data - Manage user specific data

=head1 LIBRARY

C Client Library for memcached (libmemcached, -lmemcached)

=head1 SYNOPSIS

  #include <memcached.h>

  void *memcached_get_user_data (memcached_st *ptr);

  void *memcached_set_user_data (memcached_st *ptr, void *data);

=head1 DESCRIPTION

libmemcached(3) allows you to store a pointer to a user specific data inside
the memcached_st structure. 

memcached_set_user_data() is used to set the user specific data in the
memcached_st structure.

memcached_get_user_data() is used to retrieve the user specific data in
the memcached_st structure.

=head1 RETURN

memcached_set_user_data() returns the previous value of the user specific 
data.

memcached_get_user_data() returns the current value uf the user specific
data.

=head1 HOME

To find out more information please check:
L<https://launchpad.net/libmemcached>

=head1 AUTHOR

Trond Norbye, E<lt>trond.norbye@gmail.comE<gt>

=head1 SEE ALSO

memcached(1) libmemcached(3)

=cut

1;
