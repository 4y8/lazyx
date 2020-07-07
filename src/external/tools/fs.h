#ifndef __FS_H_
#define __FS_H_
#include <stdlib.h>
#include <stdio.h>

typedef struct file {
        long long size;
        long long uid;
        long long gid;
        char *name;
        char *path;
        char *uname;
        char *gname;
        FILE *file;
} file;

#endif // __FS_H_
