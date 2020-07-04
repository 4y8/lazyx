#ifndef __FS_H_
#define __FS_H_

typedef struct file {
        long size;
        long uid;
        long gid;
        char *name;
        char *path;
        char *uname;
        char *gname;
} file;

#endif // __FS_H_
