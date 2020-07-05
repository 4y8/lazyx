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
        long pos;

        c = calloc((((f.size + 511) >> 9) + 2) << 9, sizeof(char));
        if (!c) {
                puts("Error: Unable to allocate memory.");
                exit(1);
        }
        strncpy(c, f.name, 100);
        long_to_chars(f.uid, c + 108);
        long_to_chars(f.gid, c + 116);
        long_to_chars(f.size, c + 128);
        strncpy(c + 261, f.uname, 32);
        strncpy(c + 293, f.gname, 32);
        strncpy(c + 341, f.gname, 167);
        pos = 512;
        while (f.size > 0) {
                fgets(c + pos + 4, 508, f.file);
                long_to_chars(pos - 512, c + pos);
                pos += 512;
                f.size -= 508;
        } return c;
}

int
main(int argc, char **argv)
{
        file f;

        if (argc < 2) {
                puts("Error: The program has to be called with an argument.");
                exit(1);
        }
        f.file = fopen(argv[1], "r");
        f.name = argv[1];
        f.uid = 0;
        f.gid = 0;
        fseek(f.file, 0L, SEEK_END);
        f.size = ftell(f.file);
        rewind(f.file);
        f.path = "/";
        f.gname = "";
        f.uname = "root";
}
