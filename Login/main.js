let timerOn = true;
function timer(remaining) {
  var m = Math.floor(remaining / 60);
  var s = remaining % 60;
  m = m < 10 ? "0" + m : m;
  s = s < 10 ? "0" + s : s;
  document.getElementById("countdown").innerHTML = `Time left: ${m} : ${s}`;
  remaining -= 1;
  if (remaining >= 0 && timerOn) {
    setTimeout(function () {
      timer(remaining);
    }, 1000);
    document.getElementById("resend").innerHTML = `
    `;
    return;
  }
  if (!timerOn) {
    return;
  }
  document.getElementById("resend").innerHTML = `Don't receive the code? 
  <span class="font-weight-bold text-color cursor" onclick="timer(60)">Resend
  </span>`;
}
timer(60);

function moveToNext(input, nextFieldID, prevFieldID) {
    const maxLength = parseInt(input.getAttribute('maxlength'));
    const currentLength = input.value.length;

    if (currentLength >= maxLength) {
        if (nextFieldID) {
            const nextField = document.getElementById(nextFieldID);
            if (nextField) {
                nextField.focus();
            }
        }
    } else if (currentLength === 0) {
        if (prevFieldID) {
            const prevField = document.getElementById(prevFieldID);
            if (prevField) {
                prevField.focus();
            }
        }
    }
}
