#!/usr/bin/env node

const fs = require("fs");
const path = require("path");

function unlink(path) {
  fs.unlink(path, (err) => {
    if (!err) console.log(`Removed ${path}`);
  });
}

function cleanup(filePath) {
  const lineReader = require("readline").createInterface({
    input: fs.createReadStream(filePath)
  });

  let buffer = "";
  let cleanedUp = false;

  lineReader.on("line", (line) => {
    if (line.indexOf("@remove-line") === -1) {
      buffer += line + "\n";
    } else {
      cleanedUp = true;
    }
  });

  lineReader.on("close", () => {
    if (cleanedUp) {
      console.log(`Cleaned up ${filePath}`);
      fs.writeFileSync(filePath, buffer);
    }
  });
}

function readdir(dirPath) {
  fs.readdir(dirPath, (err, files) => {
    files.forEach(file => {
      const pth = path.join(dirPath, file);
      const stats = fs.lstatSync(pth);
      if (stats.isDirectory()) {
        readdir(pth);
      } else if (pth.match(/\.sol$/)) {
        cleanup(pth);
      }
    });
  });
}

unlink("exercises/deposit/contracts/Ownable.sol");
unlink("exercises/reentrancy/contracts/Balances.sol");
unlink("exercises/reentrancy-fix/contracts/Balances.sol");
unlink("exercises/reentrancy-fix/contracts/Reentrancy.sol");
readdir("exercises");
