package Memcached::libmemcached::memcached_sasl;
use strict;
use warnings;

=head1 NAME

memcached_set_sasl_callbacks, memcached_get_sasl_callbacks,
memcached_sasl_set_auth_data, memcached_destroy_sasl_auth_data - SASL support

=head1 LIBRARY

C Client Library for memcached (libmemcached, -lmemcached)

=head1 SYNOPSIS

  #include <memcached.h>

  void memcached_set_sasl_callbacks(memcached_st *ptr,
                                    const sasl_callback_t *callbacks)

  const sasl_callback_t *memcached_get_sasl_callbacks(memcached_st *ptr)

  memcached_return memcached_set_sasl_auth_data(memcached_st *ptr,
                                                const char *username,
                                                const char *password)
  memcached_return memcached_destroy_sasl_auth_data(memcached_st *ptr)


=head1 DESCRIPTION

libmemcached(3) allows you to plug in your own callbacks function used by
libsasl to perform SASL authentication.

Please note that SASL requires the memcached binary protocol, and you have
to specify the callbacks before you connect to the server.

memcached_set_sasl_auth_data() is a helper function for you defining
the basic functionality for you, but it will store the username and password
in memory. If you choose to use this method you have to call
memcached_destroy_sasl_auth_data before calling memcached_free to avoid
a memory leak. You should NOT call memcached_destroy_sasl_auth_data if you
specify your own callback function with memcached_set_sasl_callbacks().

You as a client user have to initialize libsasl by using sasl_client_init
before enabling it in libmemcached, and you have to shut down libsasl by
calling sasl_done() when you are done using SASL from libmemcached.


=head1 RETURN

memcached_get_sasl_callbacks() returns the callbacks currently used
by this memcached handle.
memcached_get_sasl_set_auth_data() returns MEMCACHED_SUCCESS upon success.

=head1 HOME

To find out more information please check:
L<http://libmemcached.org/>

=head1 AUTHOR

Trond Norbye, E<lt>trond.norbye@gmail.comE<gt>

=head1 SEE ALSO

memcached(1) libmemcached(3)

=cut
1;
