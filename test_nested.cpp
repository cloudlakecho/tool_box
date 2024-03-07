
/*

Reference: 
  https://cplusplus.com/doc/tutorial/structures/

*/ 
 	

// array of structures
#include <iostream>
#include <string>
#include <sstream>

using namespace std;


struct movies_t {
  char* title;
  int year;
} films [3];


struct movies_f {
  char* title;
  int year;
  char** studio;
};

struct friends_t {
  char* name;
  char* email;
  movies_f favorite_movie;
} charlie, maria;


void printmovie (movies_t movie);


int main (int argc, char** argv)
{
  string mystr;
  int n;

  for (n=0; n<3; n++)
  {
    cout << "Enter title: ";
    getline (cin,films[n].title);
    cout << "Enter year: ";
    getline (cin,mystr);
    stringstream(mystr) >> films[n].year;
  }

  cout << "\nYou have entered these movies:\n";
  for (n=0; n<3; n++)
    printmovie (films[n]);

  // Nested struct 
  friends_t* pfriends = &charlie;
  charlie.name
  maria.favorite_movie.title
  charlie.favorite_movie.year
  pfriends->favorite_movie.

  return 0;
}

void printmovie (movies_t movie)
{
  cout << movie.title;
  cout << " (" << movie.year << ")\n";
}
