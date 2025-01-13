int timer = 2000;
boolean circuitOK;
int rez;

void setup() {
  pinMode(12, OUTPUT);  // A line
  pinMode(11, OUTPUT);  // B line
  pinMode(10, OUTPUT);  // C line
  pinMode(9, OUTPUT);   // D line
  pinMode(8, OUTPUT);   // E line
  pinMode(7, INPUT);    // Z line (circuit output)
  pinMode(3, OUTPUT);   // test result LED
  Serial.begin(9600);
}

void loop() {
  /* Test the circuit with the following test set:
     Test case 1 (output 0): 01100 -> G1, J0, Z1
     Test case 2 (output 0): 11100 -> F0, Z1
  */

  circuitOK = true;
  digitalWrite(3, LOW);  // Initially set test result LED to OFF

  for (int thisTest = 1; thisTest <= 2; thisTest++) {
    if (thisTest == 1) {       // Test case 1
      digitalWrite(12, LOW);  // A line
      digitalWrite(11, HIGH);   // B line
      digitalWrite(10, HIGH);  // C line
      digitalWrite(9, LOW);    // D line
      digitalWrite(8, LOW);    // E line

      delay(timer);
      rez = digitalRead(7);  // read Z line value
      if (rez != 0) {
        circuitOK = false;
      }
    }

    if (thisTest == 2) {       // Test case 2
      digitalWrite(12, HIGH);  // A line
      digitalWrite(11, HIGH);   // B line
      digitalWrite(10, HIGH);  // C line
      digitalWrite(9, LOW);    // D line
      digitalWrite(8, LOW);    // E line

      delay(timer);
      rez = digitalRead(7);  // read Z line value
      if (rez != 0) {
        circuitOK = false;
      }
    }
  }

  // Update test result LED based on circuit status
  if (!circuitOK) {
    digitalWrite(3, HIGH);  // Turn ON LED if fault detected
  } else {
    digitalWrite(3, LOW);  // Turn OFF LED if no fault detected
  }
}