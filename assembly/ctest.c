
#include <stdio.h>

void test_endian(){
    unsigned short word = 0x1234;
    unsigned char *p = (unsigned char*)&word;

    if(p[0] == 0x12){
        printf("Big Endian Machine\n");
    }else{
        printf("Little Endian Machine\n");
    }
}

int main(){
    test_endian();

    return 0;
}