#include <iostream>

using namespace std;

int main(){
    double zahl1, zahl2, ergebnis;                // Variablen für Zahlen
    char rechenzeichen;                           // Variable fürs Rechenzeichen

    cout << "Geben Sie eine Rechenaufgabe ein: "; // Eingabeaufforderung ausgeben
    cin >> zahl1 >> rechenzeichen >> zahl2;       // Aufgabe einlesen

    switch(rechenzeichen){                        // Wert von rechenzeichen ermitteln 
        case '+': ergebnis = zahl1+zahl2; break;  // entsprechend dem
        case '-': ergebnis = zahl1-zahl2; break;  // Rechenzeichen
        case '*': ergebnis = zahl1*zahl2; break;  // das Ergebnis
        case '/': ergebnis = zahl1/zahl2; break;  // berechnen
        // Fehlerausgabe und Programm beenden, falls falsches Rechenzeichen eingegeben wurde
        default: cout << "unbekanntes Rechenzeichen...\n"; return 1;
}
   // Aufgabe noch mal komplett ausgeben
   cout << zahl1 << ' ' << rechenzeichen << ' ' << zahl2 << " = " << ergebnis << '\n';
}
