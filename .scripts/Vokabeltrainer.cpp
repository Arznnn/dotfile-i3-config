#include <cstdlib>
#include <iostream>
#include <cstdio>
#include <ctime>
#include <string>
#include <cstring>

using namespace std;

struct Wort{
       string Worte;
       string richtig;
       string richtig2;
       string richtig3;
       };
       
struct Vokabel
       {
       char Fremdwort[900];
       char Deutschw1[900];
       char Deutschw2[900];
       char Deutschw3[900];
       };
       
char* Umlaute(char Worter[900])
{
int g;
for(g=0;g<901;g++)
{
if(Worter[g]=='\x81')
{
                 Worter[g]='\x81';
}
if(Worter[g]=='\x84')
{
                 Worter[g]='\x84';
}
if(Worter[g]=='\x94')
{
                 Worter[g]='\x94';
}   
if(Worter[g]=='\x8E')
{
                 Worter[g]='\x8E';
}
if(Worter[g]=='\x99')
{
                 Worter[g]='\x99';
}
if(Worter[g]=='\x9A')
{
                 Worter[g]='\x9A';
}
if(Worter[g]=='\xE1')
{
                 Worter[g]='\xE1';
}               
}
return(Worter);
}

int main(int argc, char *argv[])
{
    struct Wort in[500];
    int Zahl=2;
    int t=1;
    int i;
    int u=0;
    string s;
    int Frage;
    int Punkte=0;
    char Mal[9000];
    char o;
    string z;
    int r=0;
    int p=1;
    int so;
    size_t size;//size=grösse der datei/anzahl der zeichen, i als Zählervariable 
    char* buf;//
    
    struct Vokabel Wort[500];

FILE *f;

char Weiter1;
char Weiter2;
char Weiter3='j';
char Dateiname[900];
int loe;

int Option;

do{
system ("CLS"); 
printf("Was wollen Sie machen:\n\n<1>Neue Vokabeln eintragen\n<2>Lernen\n<3>Beenden\n\nIhre Eingabe: ");
scanf("%d",&Option);
getchar();

system ("CLS"); 

if(Option==2)
{
//Alles löschen
r=0;
p=1;

    while(1)
    {
    printf("Welche Textdatei willst du oeffnen:\n");
    scanf("%s",&Dateiname);
    getchar();
    
    f=fopen(Dateiname,"r");
    
    if(f==0)
    {
            cout<<"Der Name der Datei ist nicht richtig!\n";
            getchar();
            system("CLS");
            continue;
    }
    else
    {
        break;
    }
    }
    
    
    
    i=0;
               
    
    while((Mal[i]=fgetc(f))!=EOF)//... und solange das ende nicht erreicht ist, jedes zeichen einzeln einlesen 
    { 
        ++i; 
    } 
    
       
    fclose(f);
    i=0;
    
char* pToken = strtok(Mal, "\n"); 
if (pToken) 
{ 
z=pToken;
r++;

if(r==1)
{
in[p].Worte=z;
}
if(r==2)
{
in[p].richtig=z;
}
if(r==3)
{
in[p].richtig2=z;
}
if(r==4)
{
in[p].richtig3=z;
r=0;
p++; 
}

    while ( (pToken = strtok(NULL, "\n")) ) 
    { 

z=pToken;
r++;

if(r==1)
{
in[p].Worte=z;
}
if(r==2)
{
in[p].richtig=z;
}
if(r==3)
{
in[p].richtig2=z;
}
if(r==4)
{
in[p].richtig3=z;
r=0;
p++;
}

}
}
p--;

do 
{
system("CLS");
cout<<"Wenn du fremdsprachige Woerter uebersetzen willst, dann druecke die 1,\nwenn du Deutsche Woerter uebersetzen willst, dann druecke die 2: ";
cin>>Zahl;
getchar();
printf("\n"); 
system ("CLS"); 
   
for(so=0;so<20;so++)
{
                 srand(time(0));
                 t = (rand()% p+1);
                 while(t==u)
                 {
                            t = (rand()% p+1);
                 }

                 u=t;
 
                 if(Zahl==1)
                 {
                            cout<<"Was heisst das auf Deutsch: "<<in[t].Worte<<"\nGebe hier den Begriff auf Deutsch ein: ";
                            getline( cin, s );
                            //cout<<in[u].richtig2.length()<<in[u].richtig3.length();
                            if(in[u].richtig2.length()>1&&in[u].richtig3.length()>1)
                            {
                            
                            if(s==in[u].richtig||s==in[u].richtig2||s==in[u].richtig)
                            {
                                            printf("\nRichtig!\n\n");
                                            cout<<in[t].Worte<<" heisst auf Deutsch "<<in[u].richtig<<", "<<in[u].richtig2<<", "<<in[u].richtig3<< "\n\n";
                                            Punkte++;
                                            system ("PAUSE"); 
                                            system ("CLS");
                            }
                            else
                            {
                                            cout<<"\nLeider falsch! "<<in[t].Worte<<" heisst auf Deutsch "<<in[u].richtig<<", "<<in[u].richtig2<<", "<<in[u].richtig3<< "\n\n";
                                            system ("PAUSE"); 
                                            system ("CLS");
                            }
                            }
                            if(in[u].richtig2.length()>1&&in[u].richtig3.length()<=1)
                            {
                            if(s==in[u].richtig||s==in[u].richtig2)
                            {
                                            printf("\nRichtig!\n\n");
                                            cout<<in[t].Worte<<" heisst auf Deutsch "<<in[u].richtig<<", "<<in[u].richtig2<< "\n\n";
                                            Punkte++;
                                            system ("PAUSE"); 
                                            system ("CLS");
                            }
                            else
                            {
                                            cout<<"\nLeider falsch! "<<in[t].Worte<<" heisst auf Deutsch "<<in[u].richtig<<", "<<in[u].richtig2<< "\n\n";
                                            system ("PAUSE"); 
                                            system ("CLS");
                            }
                            }
                            if(in[u].richtig2.length()<=1&&in[u].richtig3.length()<=1)
                            {
                            if(s==in[u].richtig)
                            {
                                            printf("\nRichtig!\n\n");
                                            cout<<in[t].Worte<<" heisst auf Deutsch "<<in[u].richtig<< "\n\n";
                                            Punkte++;
                                            system ("PAUSE"); 
                                            system ("CLS");
                            }
                            else
                            {
                                            cout<<"\nLeider falsch! "<<in[t].Worte<<" heisst auf Deutsch "<<in[u].richtig<< "\n\n";
                                            system ("PAUSE"); 
                                            system ("CLS");
                            }
                            }
                            
                            
                  }
                  if(Zahl==2)
                  {
                             cout<<"Was heisst das in der entsprechenden Fremdsprache: "<<in[t].richtig<<"\nGebe hier den Begriff in der entsprechenden Fremdsprache ein: ";
                             getline( cin, s );

                             if(s==in[u].Worte)
                             {
                                               printf("\nRichtig!\n\n");
                                               Punkte++;
                                               system ("PAUSE"); 
                                               system ("CLS");
                             }
                             else
                             {
                                               cout<<"\nLeider falsch! "<<in[u].richtig<<" heisst in der entsprechenden Fremdsprache "<<in[t].Worte<< "\n\n";
                                               system ("PAUSE"); 
                                               system ("CLS");
                             }
                  }
}
cout<<"Du hast "<<Punkte<<" richtige Antworten von 20 Fragen!!!\n\n";
cout<<"Wenn du weitermachen willst, druecke die 1, wenn nicht die 2: ";
cin>>Frage;
getchar(); 
printf("\n");
Punkte=0;
 
}while(Frage!=2);

}
if(Option==1)
{
i=0;
printf("Wie soll die Datei heissen, in die Sie die Vokabeln hinein schreiben moechten:\n");
scanf("%s",&Dateiname);
getchar();

f = fopen(Dateiname, "w+");
if(f == NULL)
{
         printf("Konnte Datei %s nicht erstellen!\n");
         exit(0);
}
system("Cls");
do
{
i++;
printf("Geben Sie die fremdsprachige %d.Vokabel ein: ",i);
fgets(Wort[i].Fremdwort, sizeof(Wort[i].Fremdwort),stdin);
Umlaute(Wort[i].Fremdwort);
fprintf(f,"%s",Wort[i].Fremdwort);
system("Cls");
printf("Geben Sie die 1. deutsche Uebersetzung an: ");
fgets(Wort[i].Deutschw1, sizeof(Wort[i].Deutschw1),stdin);
Umlaute(Wort[i].Deutschw1);
fprintf(f,"%s",Wort[i].Deutschw1);
system("Cls");
printf("Gibt es weitere Ubersetzung von diesem Wort(j/n): ");
scanf("%c",&Weiter1);
getchar();
system("Cls");
if(Weiter1=='j')
{
                printf("Geben Sie die 2. deutsche Uebersetzung an: ");
                fgets(Wort[i].Deutschw2, sizeof(Wort[i].Deutschw2),stdin);
                Umlaute(Wort[i].Deutschw2);
                fprintf(f,"%s",Wort[i].Deutschw2);
                system("Cls");
                printf("Gibt es weitere Ubersetzung von diesem Wort(j/n): ");
                scanf("%c",&Weiter2);
                getchar();
                system("Cls");                
                if(Weiter2=='j')
                {
                              printf("Geben Sie die 3. deutsche Uebersetzung an: ");
                              fgets(Wort[i].Deutschw3, sizeof(Wort[i].Deutschw3),stdin);
                              Umlaute(Wort[i].Deutschw3);
                              fprintf(f,"%s\n",Wort[i].Deutschw3);
                              system("Cls");
                }
                else
                {
                              fprintf(f," \n",Wort[i].Deutschw3);
                }
}
else
{
                 fprintf(f," \n \n",Wort[i].Deutschw3);
}
printf("Wollen Sie eine weitere Vokabel eintragen(j/n): ");
scanf("%c",&Weiter3);
getchar();
system("Cls");
}while(Weiter3=='j');
fclose(f);            
}
}while(Option!=3);

    return EXIT_SUCCESS;
}