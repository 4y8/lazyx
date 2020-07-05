#include <stdlib.h>
#include <string.h>
#include "fs.h"

char *
long_to_chars(long l, char *c)
{
        long j;

        j = 256;
        for (int i = 0; i < 8; ++i) {
                *(++c) = l & j;
                j <<= 3;
        }

        return c;
}

char *
create_file(file f)
{
        char *c;
        char *prev;
        int pos;

        c = calloc((((f.size + 511) >> 9) + 2) << 9, sizeof(char));
        strncpy(c, f.name, 100);
        long_to_chars(f.uid, c + 108);
        long_to_chars(f.gid, c + 116);
        long_to_chars(f.size, c + 128);
        strncpy(c + 261, f.uname, 32);
        strncpy(c + 293, f.gname, 32);
        strncpy(c + 341, f.gname, 167);
        prev = c + 508;
        while (f.size <= 508) {
                pos += 512;
                f.size -= 508;
        }
        return c;
}
