package Memcached::libmemcached::memcached_memory_allocators;
use strict;
use warnings;

=head1 NAME

memcached_set_memory_allocators, memcached_get_memory_allocators, memcached_set_memory_allocators_context - Manage memory allocator functions

=head1 LIBRARY

C Client Library for memcached (libmemcached, -lmemcached)

=head1 SYNOPSIS

  #include <memcached.h>

  memcached_return_t
    memcached_set_memory_allocators (memcached_st *ptr,
                                     memcached_malloc_fn mem_malloc,
                                     memcached_free_fn mem_free,
                                     memcached_realloc_fn mem_realloc,
                                     memcached_calloc_fn mem_calloc,
				     void *context);

  void
    memcached_get_memory_allocators (memcached_st *ptr,
                                     memcached_malloc_fn *mem_malloc,
                                     memcached_free_fn *mem_free,
                                     memcached_realloc_fn *mem_realloc,
                                     memcached_calloc_fn *mem_calloc);

  void * 
    memcached_get_memory_allocators_context(const memcached_st *ptr);

  void *
    (*memcached_malloc_fn) (memcached_st *ptr, const size_t size,
    			    void *context);

  void *
    (*memcached_realloc_fn) (memcached_st *ptr, void *mem,
                             const size_t size,
			     void *context);

  void
    (*memcached_free_fn) (memcached_st *ptr, void *mem,
    			  void *context);

  void *
  (*memcached_calloc_fn) (memcached_st *ptr,
  			  size_t nelem,
                          const size_t elsize,
			  void *context);


=head1 DESCRIPTION

libmemcached(3) allows you to specify your own memory allocators optimized
for your application.

memcached_set_memory_allocators() is used to set the memory allocators used
by the memcached instance specified by ptr. Please note that you cannot
override only one of the memory allocators, you have to specify a complete
new set if you want to override one of them. All of the memory allocation
functions should behave as specified in the C99 standard. Specify NULL as
all functions to reset them to the default values.

memcached_get_memory_allocators() is used to get the currently used memory
allocators by a mamcached handle.

memcached_get_memory_allocators_context() returns the void * that was
passed in during the call to memcached_set_memory_allocators().

The first argument to the memory allocator functions is a pointer to a
memcached structure, the is passed as const and you will need to clone
it in order to make use of any operation which would modify it.

=head1 NOTES

In version 0.38 all functions were modified to have a context void pointer
passed to them. This was so that customer allocators could have their
own space for memory.

=head1 RETURN

memcached_set_memory_allocators() return MEMCACHED_SUCCESS upon success,
and MEMCACHED_FAILURE if you don't pass a complete set of function pointers.

=head1 HOME

To find out more information please check:
L<https://launchpad.net/libmemcached>

=head1 AUTHOR

Trond Norbye, E<lt>trond.norbye@gmail.comE<gt>
Brian Aker, E<lt>brian@tangent.orf<gt>

=head1 SEE ALSO

memcached(1) libmemcached(3) memcached_get_user_data(3) memcached_set_user_data(3)

=cut

1;
