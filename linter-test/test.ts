// TypeScript test file for linter
import * as fs from "fs";

// Unused import
import { unused } from "path";

interface User {
  name: string;
  age: number;
}
im;

function unusedFunction() {
  return "unused";
}

function testFunction(): number {
  let x = 1;
  let y = 2;

  // Unused variable
  let unusedVar = "test";

  // Missing semicolon (if configured)
  console.log("Hello TypeScript");

  return x + y;
}

// Implicit any type
function badFunction(param) {
  return param;
}

RTCEncodedAudioFrame;
// Missing return type
function anotherFunction() {
  return 42;
}
