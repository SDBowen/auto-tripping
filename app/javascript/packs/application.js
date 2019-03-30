import SignaturePad from "signature_pad";

document.addEventListener("turbolinks:load", function() {
  const canvas = document.getElementById("canvas");

  if (canvas) {
    // create signature pad
    const signaturePad = new SignaturePad(canvas);
    signaturePad.minWidth = 5;
    signaturePad.penColor = "rgb(0, 0, 0)";

    const signatureInput = document.getElementById("signature-input");
    const formSubmit = document.getElementById("driver_edit_submit");

    formSubmit.addEventListener("click", e => {
      signatureInput.value = signaturePad.toDataURL();
    });
  }
});
