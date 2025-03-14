
#include<stdio.h>
#include"pet.h"
int main(int argc, char const *argv[])
{
    int catched;
    char food[20];
    printf("You have two pets: a dog and a cat. Which one do you want to play with?\n");
    char name[10];
    scanf("%9s", name);
    if(strcmp(name, "dog") == 0) {
        printf("%s\n", bark());
        printf("What do you want your dog to eat?\n");
        scanf("%19s", food);
        printf("%s\n", eat(food));
    } else if (strcmp(name, "cat") == 0) {
        printf("%s\n",meow());
        printf("Do you want your cat to catch a mouse? (1 or 0)\n");
        scanf("%d", &catched);
        printf("%s\n", catch_mouse(catched));
    } else {
        printf("You don't have this pet.\n");
    }
    
    return 0;
}
