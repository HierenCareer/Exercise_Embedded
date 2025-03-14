#include"cat.h"

char* meow() {
    return "Meow meow";
}
char* catch_mouse(int catched) {
    if(catched) return "I caught the mouse";
    return "I missed the mouse";
}