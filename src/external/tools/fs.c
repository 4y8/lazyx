#include <string.h>
#include "fs.h"

void
long_to_chars(unsigned long long l, char *c, int n)
{

        --c;
        for (int i = 0; i < n; ++i) {
                *(++c) = (char)(l & 255);
                l >>= 8;
        }
}

char *
create_file(file f)
{
        char *c;
        unsigned long pos;
        unsigned long prev;

        c = calloc((((f.size + 511) >> 9) + 2) << 9, sizeof(char));
        if (!c) {
                puts("Error: Unable to allocate memory.");
                exit(1);
        } *c = -1; 
	strncpy(c + 1, f.name, 100);
        long_to_chars(f.uid, c + 109, 8);
        long_to_chars(f.gid, c + 117, 8);
        long_to_chars(f.size >> 32, c + 129, 4);
        long_to_chars(f.size, c + 133, 4);
        strncpy(c + 262, f.uname, 32);
        strncpy(c + 294, f.gname, 32);
        strncpy(c + 342, f.path, 167);
        pos = 512;
        prev = 508;
        while (f.size >= 508) {
                long_to_chars(pos, c + prev, 4);
                fread(c + pos + 4, 508, 1, f.file);
                prev = pos;
                pos += 512;
                f.size -= 508;
        } long_to_chars(pos, c + prev, 4);
        long_to_chars(0, c + pos, 4);
        fread(c + pos + 4, f.size, 1, f.file);
        return c;
}

int
main(int argc, char **argv)
{
        file f;
        char *c;
        FILE *out;

        if (argc < 2) {
                puts("Error: The program has to be called with an argument.");
                exit(1);
        } 
	f = (file){.file = fopen(argv[1], "r"), .name = argv[1], .uid = 0, 
		   .gid = 0, .path = argv[2], .gname = "", .uname = "root"};
        fseek(f.file, 0L, SEEK_END);
        f.size = ftell(f.file);
        rewind(f.file);
        c = create_file(f);
        fclose(f.file);
        out = fopen("root.fs", "w");
        fwrite(c, (((f.size + 511) >> 9) + 2) << 9, 1, out);
        fclose(out);
        free(c);
        return 0;
}
