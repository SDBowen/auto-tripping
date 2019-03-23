import SignaturePad from "signature_pad";

document.addEventListener("turbolinks:load", function() {
  console.log("JavaScript loaded");

  const canvas = document.getElementById("canvas");

  const signaturePad = new SignaturePad(canvas);
  signaturePad.minWidth = 5;
  signaturePad.penColor = "rgb(0, 0, 0)";
});
