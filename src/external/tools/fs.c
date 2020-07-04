#include <stdlib.h>
#include <string.h>
#include "fs.h"

char *
long_to_chars(long l)
{
        char *c;
        long j;

        c = malloc(8);
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
        char *buf;

        c = calloc((((f.size + 511) >> 9) + 2) << 9, sizeof(char));
        strncpy(c, f.name, 100);
        buf = long_to_chars(f.uid);
        memcpy(c + 108, buf, 8);
        free(buf);
        buf = long_to_chars(f.gid);
        memcpy(c + 116, buf, 8);
        free(buf);
        buf = long_to_chars(f.size);
        memcpy(c + 128, buf, 8);
        free(buf);
        return c;
}
