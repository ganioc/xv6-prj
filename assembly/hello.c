#include <unistd.h>

int main(void){
    write(1, "hello world\n", 15);
    return 0;
}