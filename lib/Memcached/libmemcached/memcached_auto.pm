package Memcached::libmemcached::memcached_auto;
use strict;
use warnings;

=head1 NAME

memcached_increment, memcached_decrement,
memcached_increment_with_initial, memcached_decrement_with_initial - Manipulate
counters

=head1 LIBRARY

C Client Library for memcached (libmemcached, -lmemcached)

=head1 SYNOPSIS

  #include <memcached.h>

  memcached_return_t
    memcached_increment (memcached_st *ptr, 
                         const char *key, size_t key_length,
                         unsigned int offset,
                         uint64_t *value);

  memcached_return_t
    memcached_decrement (memcached_st *ptr, 
                         const char *key, size_t key_length,
                         unsigned int offset,
                         uint64_t *value);

  memcached_return_t
    memcached_increment_with_initial (memcached_st *ptr,
                                      const char *key,
                                      size_t key_length,
                                      uint64_t offset,
                                      uint64_t initial,
                                      time_t expiration,
                                      uint64_t *value);

  memcached_return_t
    memcached_decrement_with_initial (memcached_st *ptr,
                                      const char *key,
                                      size_t key_length,
                                      uint64_t offset,
                                      uint64_t initial,
                                      time_t expiration,
                                      uint64_t *value);

  memcached_return_t
    memcached_increment_by_key (memcached_st *ptr, 
                                const char *master_key, size_t master_key_length,
                                const char *key, size_t key_length,
                                unsigned int offset,
                                uint64_t *value);

  memcached_return_t
    memcached_decrement_by_key (memcached_st *ptr, 
                                const char *master_key, size_t master_key_length,
                                const char *key, size_t key_length,
                                unsigned int offset,
                                uint64_t *value);

  memcached_return_t
    memcached_increment_with_initial_by_key (memcached_st *ptr,
                                             const char *master_key,
                                             size_t master_key_length,
                                             const char *key,
                                             size_t key_length,
                                             uint64_t offset,
                                             uint64_t initial,
                                             time_t expiration,
                                             uint64_t *value);

  memcached_return_t
    memcached_decrement_with_initial_by_key (memcached_st *ptr,
                                             const char *master_key,
                                             size_t master_key_length,
                                             const char *key,
                                             size_t key_length,
                                             uint64_t offset,
                                             uint64_t initial,
                                             time_t expiration,
                                             uint64_t *value);

=head1 DESCRIPTION

memcached(1) servers have the ability to increment and decrement keys
(overflow and underflow are not detected). This gives you the ability to use
memcached to generate shared sequences of values.  

memcached_increment() takes a key and keylength and increments the value by
the offset passed to it. The value is then returned via the unsigned int
value pointer you pass to it.

memcached_decrement() takes a key and keylength and decrements the value by
the offset passed to it. The value is then returned via the unsigned int
value pointer you pass to it.

memcached_increment_with_initial() takes a key and keylength and increments
the value by the offset passed to it. If the object specified by key does
not exist, one of two things may happen: If the expiration value is
MEMCACHED_EXPIRATION_NOT_ADD, the operation will fail. For all other
expiration values, the operation will succeed by seeding the value for that
key with a initial value to expire with the provided expiration time. The
flags will be set to zero.The value is then returned via the unsigned int
value pointer you pass to it.

memcached_decrement_with_initial() takes a key and keylength and decrements
the value by the offset passed to it. If the object specified by key does
not exist, one of two things may happen: If the expiration value is
MEMCACHED_EXPIRATION_NOT_ADD, the operation will fail. For all other
expiration values, the operation will succeed by seeding the value for that
key with a initial value to expire with the provided expiration time. The
flags will be set to zero.The value is then returned via the unsigned int
value pointer you pass to it.

memcached_increment_by_key(), memcached_decrement_by_key(),
memcached_increment_with_initial_by_key(), and
memcached_decrement_with_initial_by_key() are master key equivalents of the
above.

=head1 RETURN

A value of type C<memcached_return_t> is returned.
On success that value will be C<MEMCACHED_SUCCESS>.
Use memcached_strerror() to translate this value to a printable string.

=head1 HOME

To find out more information please check:
L<https://launchpad.net/libmemcached>

=head1 AUTHOR

Brian Aker, E<lt>brian@tangent.orgE<gt>

=head1 SEE ALSO

memcached(1) libmemcached(3) memcached_strerror(3)

=cut

1;
