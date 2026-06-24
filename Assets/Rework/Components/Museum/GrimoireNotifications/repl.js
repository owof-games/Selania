import * as fs from "fs";

const fileContents = fs.readFileSync("./grimoire-notifications.ink", {
    encoding: "utf-8"
});

const newcontents = fileContents.replaceAll("RANDOM(1, 6) <= 3", _ => {
    return Math.random() < 0.5 ? "true" : "false"
});

fs.writeFileSync("./replaced.txt", newcontents, { encoding: "utf-8"});