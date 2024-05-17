// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";

// this is so that after turbo does its thing we can load our javascript
document.addEventListener(function () {
  // console.log("Turbo loaded");
  var ballotElements = document.querySelectorAll("[id^='ballot-box-root-']");
  ballotElements.forEach(function (rootElement) {
    var ballotId = rootElement.getAttribute("data-ballot-id");
    var props = {
      host: "https://api.voteballotbox.com/api/v1",
      ballotId: ballotId,
    };
    // console.log("Mounting BallotBoxBallot for ballot ID:", ballotId);

    if (window.BallotBoxBallot && typeof window.BallotBoxBallot.mount === "function") {
      window.BallotBoxBallot.mount(rootElement, props);
    } else {
      console.error("BallotBoxBallot or BallotBoxBallot.mount is not defined");
    }
  });
});
