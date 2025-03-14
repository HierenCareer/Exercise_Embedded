#include"pet.h"

char* bark() {
	return "Woof woof";
}
char* eat(char* food) {
	if(strlen(food) > 3) return "Yummy";
	return "I don't like it";
}
