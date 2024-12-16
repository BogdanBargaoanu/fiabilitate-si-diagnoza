int timer = 100;
boolean circuitOK;
int rez;

void setup() {
  pinMode(12, OUTPUT);  // a line
  pinMode(11, OUTPUT);  // b line
  pinMode(10, OUTPUT);  // c line
  pinMode(9, OUTPUT);   // d line
  pinMode(7, INPUT);    // z line (circuit output)
  pinMode(4, OUTPUT);   // test result LED
  Serial.begin(9600);   // start serial communication @9600 bps
}

void loop() {
  /* Test the circuit with the following test set:
     1010->1, 1100->1, 1110->0, 0000->0, 1001->0
  */

  circuitOK = true;
  digitalWrite(4, LOW);  // Initially set test result LED to OFF

  for (int thisTest = 1; thisTest <= 5; thisTest++) {
    if (thisTest == 1) {       // Test case 1: 1010 -> 1
      digitalWrite(12, HIGH);  // a line
      digitalWrite(11, LOW);   // b line
      digitalWrite(10, HIGH);  // c line
      digitalWrite(9, LOW);    // d line

      delay(timer);
      rez = digitalRead(7);  // read z line value
      if (rez != 1) {
        circuitOK = false;
      }
    }

    if (thisTest == 2) {       // Test case 2: 1100 -> 1
      digitalWrite(12, HIGH);  // a line
      digitalWrite(11, HIGH);  // b line
      digitalWrite(10, LOW);   // c line
      digitalWrite(9, LOW);    // d line

      delay(timer);
      rez = digitalRead(7);  // read z line value
      if (rez != 1) {
        circuitOK = false;
      }
    }

    if (thisTest == 3) {       // Test case 3: 1110 -> 0
      digitalWrite(12, HIGH);  // a line
      digitalWrite(11, HIGH);  // b line
      digitalWrite(10, HIGH);  // c line
      digitalWrite(9, LOW);    // d line

      delay(timer);
      rez = digitalRead(7);  // read z line value
      if (rez != 0) {
        circuitOK = false;
      }
    }

    if (thisTest == 4) {      // Test case 4: 0000 -> 0
      digitalWrite(12, LOW);  // a line
      digitalWrite(11, LOW);  // b line
      digitalWrite(10, LOW);  // c line
      digitalWrite(9, LOW);   // d line

      delay(timer);
      rez = digitalRead(7);  // read z line value
      if (rez != 0) {
        circuitOK = false;
      }
    }

    if (thisTest == 5) {       // Test case 5: 1001 -> 0
      digitalWrite(12, HIGH);  // a line
      digitalWrite(11, LOW);   // b line
      digitalWrite(10, LOW);   // c line
      digitalWrite(9, HIGH);   // d line

      delay(timer);
      rez = digitalRead(7);  // read z line value
      if (rez != 0) {
        circuitOK = false;
      }
    }
  }

  // Update test result LED based on circuit status
  if (!circuitOK) {
    digitalWrite(4, HIGH);  // Turn ON LED if fault detected
  } else {
    digitalWrite(4, LOW);  // Turn OFF LED if no fault detected
  }
}