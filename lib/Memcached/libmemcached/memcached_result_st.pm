package Memcached::libmemcached::memcached_result_st;
use strict;
use warnings;

=head1 NAME

memcached_result_create, memcached_result_free,
memcached_result_key_value, memcached_result_key_length,
memcached_result_value, memcached_result_length,
memcached_result_flags, memcached_result_cas - Work with memcached_result_st


=head1 LIBRARY

C Client Library for memcached (libmemcached, -lmemcached)

=head1 SYNOPSIS

  #include <memcached.h>

  memcached_result_st *
    memcached_result_create (memcached_st *ptr,
                             memcached_result_st *result);

  void memcached_result_free (memcached_result_st *result);

  const char * memcached_result_key_value (memcached_result_st *result);

  size_t memcached_result_key_length (const memcached_result_st *result);

  const char *memcached_result_value (memcached_result_st *ptr);

  size_t memcached_result_length (const memcached_result_st *ptr);

  uint32_t memcached_result_flags (const memcached_result_st *result)

  uint64_t memcached_result_cas (const memcached_result_st *result);

  memcached_return_t
    memcached_result_set_value (memcached_result_st *ptr,
                                const char *value, size_t length)

  void memcached_result_set_flags (memcached_result_st *ptr, uint32_t flags)

  void memcached_result_set_expiration (memcached_result_st *ptr, time_t)

=head1 DESCRIPTION

libmemcached(3) can optionally return a memcached_result_st which acts as a
result object. The result objects have added benefits over the character
pointer returns in that they are forward compatible with new return items
that future memcached servers may implement (the best current example of
this is the CAS return item). The structures can also be reused which will
save on calls to malloc(3). It is suggested that you use result objects over
char * return functions.

The structure of memcached_result_st has been encapsulated, you should not
write code to directly access members of the structure.

memcached_result_create() will either allocate memory for a
memcached_result_st or will initialize a structure passed to it.

memcached_result_free() will deallocate any memory attached to the
structure. If the structure was also alloacted, it will deallocate it.

memcached_result_key_value() returns the key value associated with the
current result object.

memcached_result_key_length() returns the key length associated with the
current result object.

memcached_result_value() returns the result value associated with the
current result object.

memcached_result_length() returns the result length associated with the
current result object.

memcached_result_flags() returns the flags associated with the
current result object.

memcached_result_cas() returns the cas associated with the
current result object. This value will only be available if the server
supports it.

memcached_result_set_value() takes a byte array and a size and sets
the result to this value. This function is used for trigger responses.

void memcached_result_set_flags() takes a result structure and stores
a new value for the flags field.

void memcached_result_set_expiration(A) takes a result structure and stores
a new value for the expiration field (this is only used by read through
triggers).

You may wish to avoid using memcached_result_create(3) with a
stack based allocation. The most common issues related to ABI safety involve
heap allocated structures.

=head1 RETURN

Varies, see particular functions. All structures must have
memcached_result_free() called on them for cleanup purposes. Failure to
do this will result in leaked memory.

=head1 HOME

To find out more information please check:
L<https://launchpad.net/libmemcached>

=head1 AUTHOR

Brian Aker, E<lt>brian@tangent.orgE<gt>

=head1 SEE ALSO

memcached(1) libmemcached(3) memcached_strerror(3)

=cut

1;
