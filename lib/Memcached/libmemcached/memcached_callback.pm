package Memcached::libmemcached::memcached_callback;
use strict;
use warnings;

=head1 NAME

memcached_callback_get, memcached_callback_set - Get and set a callback

=head1 LIBRARY

C Client Library for memcached (libmemcached, -lmemcached)

=head1 SYNOPSIS

  #include <memcached.h>

  memcached_return_t 
    memcached_callback_set (memcached_st *ptr, 
                            memcached_callback_t flag, 
                            void *data);

  void *
    memcached_callback_get (memcached_st *ptr, 
                            memcached_callback_t flag,
                            memcached_return_t *error);

=head1 DESCRIPTION

libmemcached(3) can have callbacks set key execution points. These either
provide function calls at points in the code, or return pointers to
structures for particular usages.

memcached_callback_get() takes a callback flag and returns the structure or
function set by memcached_callback_set().

memcached_callback_set() changes the function/structure assigned by a
callback flag. No connections are reset. 

You can use MEMCACHED_CALLBACK_USER_DATA to provide custom context if required for any 
of the callbacks

=over 4

=item MEMCACHED_CALLBACK_CLEANUP_FUNCTION

When memcached_delete() is called this function will be excuted. At the
point of its execution all connections have been closed.

=item MEMCACHED_CALLBACK_CLONE_FUNCTION

When memcached_delete() is called this function will be excuted. At the
point of its execution all connections have been closed.

=item MEMCACHED_CALLBACK_PREFIX_KEY

You can set a value which will be used to create a domain for your keys.
The value specified here will be prefixed to each of your keys. The value can not
be greater then MEMCACHED_PREFIX_KEY_MAX_SIZE - 1 and will reduce MEMCACHED_MAX_KEY by
the value of your key. The prefix key is only applied to the primary key,
not the master key. MEMCACHED_FAILURE will be returned if no key is set. In the case
of a key which is too long MEMCACHED_BAD_KEY_PROVIDED will be returned.

=item MEMCACHED_CALLBACK_USER_DATA

This allows you to store a pointer to a specifc piece of data. This can be
retrieved from inside of memcached_fetch_execute(). Cloning a memcached_st
will copy the pointer to the clone.

=item  MEMCACHED_CALLBACK_MALLOC_FUNCTION

DEPRECATED: use memcached_set_memory_allocators instead.

=item  MEMCACHED_CALLBACK_REALLOC_FUNCTION

DEPRECATED: use memcached_set_memory_allocators instead.

=item  MEMCACHED_CALLBACK_FREE_FUNCTION

DEPRECATED: use memcached_set_memory_allocators instead.

=item  MEMCACHED_CALLBACK_GET_FAILURE

This function implements the read through cache behavior. On failure of retrieval this callback will be called. 
You are responsible for populating the result object provided. This result object will then be stored in the server and
returned to the calling process. You must clone the memcached_st in order to
make use of it. The value will be stored only if you return
MEMCACHED_SUCCESS or MEMCACHED_BUFFERED. Returning MEMCACHED_BUFFERED will
cause the object to be buffered and not sent immediatly (if this is the default behavior based on your connection setup this will happen automatically).

The prototype for this is:
memcached_return_t (*memcached_trigger_key)(memcached_st *ptr, char *key, size_t key_length, memcached_result_st *result);

=item  MEMCACHED_CALLBACK_DELETE_TRIGGER

This function implements a trigger upon successful deletion of a key. The memcached_st structure will need to be cloned
in order to make use of it.

The prototype for this is:
typedef memcached_return_t (*memcached_trigger_delete_key)(memcached_st *ptr, char *key, size_t key_length);


=back

=head1 RETURN

memcached_callback_get() return the function or structure that was provided.
Upon error, nothing is set, null is returned, and the memcached_return_t
argument is set to MEMCACHED_FAILURE.

memcached_callback_set() returns MEMCACHED_SUCCESS upon successful setting,
otherwise MEMCACHED_FAILURE on error.

=head1 HOME

To find out more information please check:
L<https://launchpad.net/libmemcached>

=head1 AUTHOR

Brian Aker, E<lt>brian@tangent.orgE<gt>

=head1 SEE ALSO

memcached(1) libmemcached(3) memcached_strerror(3)

=cut

1;
